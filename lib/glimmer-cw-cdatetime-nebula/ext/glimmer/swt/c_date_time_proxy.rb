# Copyright (c) 2020 - Andy Maleh
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

module Glimmer
  module SWT
    # This modules just configures Glimmer to work with Nebula CDateTime
    # Since it is wrapping an existing SWT widget with the same name,
    # it is not implemented as a typical "Glimmer Custom Widget", yet
    # just a Glimmer widget proxy that extends Glimmer::SWT::WidgetProxy
    class CDateTimeProxy < WidgetProxy
      def text_widget_proxy
        WidgetProxy.create(swt_widget: swt_widget.text_widget.control) if swt_widget.text_widget
      end
      
      def toggle_open
        swt_widget.set_open(!swt_widget.is_open)
      end
            
      WidgetProxy::DEFAULT_STYLES.merge!(
        'c_date_time'              => [:border, :tab_fields, :simple],
        'c_date'                   => [:border, :tab_fields, :simple],
        'c_time'                   => [:border, :tab_fields, :simple],
        'c_date_time_drop_down'    => [:border, :tab_fields, :drop_down],
        'c_date_drop_down'         => [:border, :tab_fields, :drop_down],
        'c_time_drop_down'         => [:border, :tab_fields, :drop_down],
        'c_date_time_spinner'      => [:border, :tab_fields, :spinner],
        'c_date_spinner'           => [:border, :tab_fields, :spinner],
        'c_time_spinner'           => [:border, :tab_fields, :spinner],
        'c_date_time_compact'      => [:border, :tab_fields, :compact],
        'c_date_compact'           => [:border, :tab_fields, :compact],
        'c_time_compact'           => [:border, :tab_fields, :compact],
      )
      
      WidgetProxy::DEFAULT_INITIALIZERS['c_date_time'] = WidgetProxy::DEFAULT_INITIALIZERS['c_date_time_compact'] = WidgetProxy::DEFAULT_INITIALIZERS['c_date_time_spinner'] = WidgetProxy::DEFAULT_INITIALIZERS['c_date_time_drop_down'] = lambda do |widget|
        has_pattern_style = %w[time_short time_medium date_short date_medium date_long].reduce(false) {|result, style| result || widget.get_data('proxy').has_style?(style)}
        widget.pattern = 'MM/dd/yyyy hh:mm a' unless has_pattern_style
      end
      WidgetProxy::DEFAULT_INITIALIZERS['c_date'] = WidgetProxy::DEFAULT_INITIALIZERS['c_date_compact'] = WidgetProxy::DEFAULT_INITIALIZERS['c_date_spinner'] = WidgetProxy::DEFAULT_INITIALIZERS['c_date_drop_down'] = lambda do |widget|
        has_pattern_style = %w[time_short time_medium date_short date_medium date_long].reduce(false) {|result, style| result || widget.get_data('proxy').has_style?(style)}
        unless has_pattern_style
          widget.format = Glimmer::SWT::CDTProxy[:date_short]
          widget.pattern = 'MM/dd/yyyy'
        end
      end
      WidgetProxy::DEFAULT_INITIALIZERS['c_time'] = WidgetProxy::DEFAULT_INITIALIZERS['c_time_compact'] = WidgetProxy::DEFAULT_INITIALIZERS['c_time_spinner'] = WidgetProxy::DEFAULT_INITIALIZERS['c_time_drop_down'] = lambda do |widget|
        has_pattern_style = %w[time_short time_medium date_short date_medium date_long].reduce(false) {|result, style| result || widget.get_data('proxy').has_style?(style)}
        unless has_pattern_style
          widget.format = Glimmer::SWT::CDTProxy[:time_short]
          widget.pattern = 'hh:mm a'
        end
      end
      
      WidgetProxy::KEYWORD_ALIASES.merge!(
        'c_date'                   => 'c_date_time',
        'c_time'                   => 'c_date_time',
        'c_date_time_compact'      => 'c_date_time',
        'c_date_compact'           => 'c_date_time',
        'c_time_compact'           => 'c_date_time',
        'c_date_time_spinner'      => 'c_date_time',
        'c_date_spinner'           => 'c_date_time',
        'c_time_spinner'           => 'c_date_time',
        'c_date_time_drop_down'    => 'c_date_time',
        'c_date_drop_down'         => 'c_date_time',
        'c_time_drop_down'         => 'c_date_time',
      )
      
      private
      
      def interpret_style(*styles)
        CDTProxy[*styles] rescue super
      end
      
    end

  end

end

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
    class CDateTimeProxy < Glimmer::SWT::WidgetProxy
      def text_widget_proxy
        Glimmer::SWT::WidgetProxy.new(swt_widget: swt_widget.text_widget.control)
      end
      
      def toggle_open
        swt_widget.set_open(!swt_widget.is_open)
      end

      private

      def has_style?(style)
        begin
          comparison = CDTProxy[style]
        rescue
          begin
            comparison = SWTProxy[style]
          rescue
            comparison = DNDProxy[style]
          end
        end
        (@swt_widget.style & comparison) == comparison
      end

      def default_style(underscored_widget_name)
        styles = DEFAULT_STYLES[underscored_widget_name] || [:none]
        CDTProxy[styles] rescue SWTProxy[styles] rescue DNDProxy[styles]
      end

      def style(underscored_widget_name, styles)
        styles = [styles].flatten.compact
        if styles.empty?         
          default_style(underscored_widget_name) 
        else         
          begin
            CDTProxy[*styles]
          rescue
            begin
              SWTProxy[*styles]
            rescue
              DNDProxy[*styles]
            end
          end
        end
      end

    end

  end

end

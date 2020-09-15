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

$LOAD_PATH.unshift(File.expand_path('..', __FILE__))
$LOAD_PATH.unshift(File.expand_path('../..', __FILE__))

require 'glimmer-dsl-swt'

require 'vendor/nebula/org.eclipse.nebula.cwt_1.1.0.jar'
require 'vendor/nebula/org.eclipse.nebula.widgets.cdatetime_1.4.0.jar'

Glimmer::Config.import_swt_packages += [
  'org.eclipse.nebula.cwt',
  'org.eclipse.nebula.widgets.cdatetime',
]

require 'glimmer-cw-cdatetime-nebula/ext/glimmer/dsl/swt/cdt_expression'
require 'glimmer-cw-cdatetime-nebula/ext/glimmer/swt/c_date_time_proxy'
require 'views/nebula/c_date_time'

Glimmer::SWT::WidgetProxy::DEFAULT_STYLES.merge!(
  'c_date_time'              => [:border, :tab_fields, :simple],
  'c_date'                   => [:border, :tab_fields, :date_short, :simple],
  'c_time'                   => [:border, :tab_fields, :time_short, :simple],
  'c_date_time_compact'      => [:border, :tab_fields, :compact],
  'c_date_compact'           => [:border, :tab_fields, :date_short, :compact],
  'c_time_compact'           => [:border, :tab_fields, :time_short, :compact],
  'c_date_time_spinner'      => [:border, :tab_fields, :spinner],
  'c_date_spinner'           => [:border, :tab_fields, :date_short, :spinner],
  'c_time_spinner'           => [:border, :tab_fields, :time_short, :spinner],
  'c_date_time_drop_down'    => [:border, :tab_fields, :drop_down],
  'c_date_drop_down'         => [:border, :tab_fields, :drop_down, :date_short],
  'c_time_drop_down'         => [:border, :tab_fields, :drop_down, :time_short],
)

Glimmer::SWT::WidgetProxy::DEFAULT_INITIALIZERS['c_date_time'] = Glimmer::SWT::WidgetProxy::DEFAULT_INITIALIZERS['c_date_time_compact'] = Glimmer::SWT::WidgetProxy::DEFAULT_INITIALIZERS['c_date_time_spinner'] = Glimmer::SWT::WidgetProxy::DEFAULT_INITIALIZERS['c_date_time_drop_down'] = lambda do |widget|
  widget.pattern = 'MM/dd/yyyy hh:mm a'
end
Glimmer::SWT::WidgetProxy::DEFAULT_INITIALIZERS['c_date'] = Glimmer::SWT::WidgetProxy::DEFAULT_INITIALIZERS['c_date_compact'] = Glimmer::SWT::WidgetProxy::DEFAULT_INITIALIZERS['c_date_spinner'] = Glimmer::SWT::WidgetProxy::DEFAULT_INITIALIZERS['c_date_drop_down'] = lambda do |widget|
  widget.pattern = 'MM/dd/yyyy'
end
Glimmer::SWT::WidgetProxy::DEFAULT_INITIALIZERS['c_time'] = Glimmer::SWT::WidgetProxy::DEFAULT_INITIALIZERS['c_time_compact'] = Glimmer::SWT::WidgetProxy::DEFAULT_INITIALIZERS['c_time_spinner'] = Glimmer::SWT::WidgetProxy::DEFAULT_INITIALIZERS['c_time_drop_down'] = lambda do |widget|
  widget.pattern = 'hh:mm a'
end

Glimmer::SWT::WidgetProxy::KEYWORD_ALIASES.merge!(
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

Glimmer::Config::SAMPLE_DIRECTORIES << File.expand_path('../../samples/nebula', __FILE__)

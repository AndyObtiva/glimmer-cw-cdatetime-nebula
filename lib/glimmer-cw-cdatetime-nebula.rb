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

require 'glimmer-dsl-swt'

require_relative '../vendor/nebula/org.eclipse.nebula.cwt_1.1.0.202007241204.jar'
require_relative '../vendor/nebula/org.eclipse.nebula.widgets.cdatetime_1.5.0.202007241204.jar'

Glimmer::Config.import_swt_packages += [
  'org.eclipse.nebula.cwt',
  'org.eclipse.nebula.widgets.cdatetime',
]

require 'glimmer-cw-cdatetime-nebula/ext/glimmer/dsl/swt/cdt_expression'
require 'glimmer-cw-cdatetime-nebula/ext/glimmer/swt/c_date_time_proxy'
require 'views/nebula/c_date_time'

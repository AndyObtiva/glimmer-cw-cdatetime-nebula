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

require 'glimmer/swt/style_constantizable'
require 'glimmer-cw-cdatetime-nebula/ext/glimmer/cdt' if RUBY_ENGINE == 'opal'

module Glimmer
  module SWT
    # Proxy for org.eclipse.nebula.widgets.cdatetime.CDT
    #
    # Follows the Proxy Design Pattern
    class CDTProxy
      include Glimmer::SWT::StyleConstantizable

      class << self
        JAVA_IMPORT = 'org.eclipse.nebula.widgets.cdatetime.CDT'
        
        java_import JAVA_IMPORT if RUBY_ENGINE == 'jruby'
        
        def constant_java_import
          JAVA_IMPORT
        end

        def constant_source_class
          CDT
        end

        def constant_value_none
          CDT::NONE
        end
        
      end
      
    end
    
  end
  
end

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

$LOAD_PATH.unshift File.expand_path('../../../lib', __FILE__)

require 'glimmer-cw-cdatetime-nebula'

class CDateTimeGallery
  class Person
    attr_accessor :date_of_birth
  end
  
  include Glimmer
  
  def open
    person = Person.new
    person.date_of_birth = DateTime.new(2013, 7, 12, 18, 37, 23)
    
    shell {
      grid_layout(4, false) {
        vertical_spacing 20
      }
      text 'Nebula CDateTime Glimmer Custom Widget Gallery'
      
      label {
        layout_data(:center, :center, true, false) {
          horizontal_span 4
        }
        text 'Nebula CDateTime Glimmer Custom Widget Gallery'
        font height: 24, style: :bold
      }
      
      tab_folder {
        tab_item {
          grid_layout 2, false
          text 'Simple'
          
          label {
            text 'c_date_time'
            font name: 'Consolas', height: 14
          }
          c_date_time
          
          label {
            text 'c_date'
            font name: 'Consolas', height: 14
          }
          c_date
          
          label {
            text 'c_time'
            font name: 'Consolas', height: 14
          }
          c_time {
            selection bind(person, :date_of_birth)
          }
        }
         
        tab_item {
          grid_layout 2, false
          text 'Drop Down'
          
          label {
            text 'c_date_time_drop_down'
            font name: 'Consolas', height: 14
          }
          c_date_time_drop_down {
            layout_data(:fill, :center, true, true)
          }
           
          label {
            text 'c_date_drop_down'
            font name: 'Consolas', height: 14
          }
          c_date_drop_down {
            layout_data(:fill, :center, true, true)
          }
           
          label {
            text 'c_time_drop_down'
            font name: 'Consolas', height: 14
          }
          c_time_drop_down {
            layout_data(:fill, :center, true, true)
            selection bind(person, :date_of_birth)
          }
        }
         
        tab_item {
          grid_layout 2, false
          text 'Spinner'
          
          label {
            text 'c_date_time_spinner'
            font name: 'Consolas', height: 14
          }
          c_date_time_spinner {
            layout_data(:fill, :center, true, true)
          }
           
          label {
            text 'c_date_spinner'
            font name: 'Consolas', height: 14
          }
          c_date_spinner {
            layout_data(:fill, :center, true, true)
          }
           
          label {
            text 'c_time_spinner'
            font name: 'Consolas', height: 14
          }
          c_time_spinner {
            layout_data(:fill, :center, true, true)
            selection bind(person, :date_of_birth)
          }
        }
              
        tab_item {
          grid_layout 2, false
          text 'Compact'
          
          label {
            text 'c_date_time_compact'
            font name: 'Consolas', height: 14
          }
          c_date_time_compact {
            layout_data(:fill, :center, true, true)
          }
           
          label {
            text 'c_date_compact'
            font name: 'Consolas', height: 14
          }
          c_date_compact {
            layout_data(:fill, :center, true, true)
          }
           
          label {
            text 'c_time_compact'
            font name: 'Consolas', height: 14
          }
          c_time_compact {
            layout_data(:fill, :center, true, true)
            selection bind(person, :date_of_birth)
          }
        }
      }
    }.open
  end
end

CDateTimeGallery.new.open

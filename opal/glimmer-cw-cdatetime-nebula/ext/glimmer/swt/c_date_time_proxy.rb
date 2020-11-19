require 'glimmer/swt/widget_proxy'
#
module Glimmer
  module SWT
    class CDateTimeProxy < WidgetProxy
      class << self
        def create(keyword, parent, args, block)
          # TODO support :tab_fields style
          # TODO support :border style
          # TODO support :compact style
          # TODO support :spinner style
          # TODO support :date_medium and :date_long styles
          # TODO support :time_medium style
          # TODO support :CLOCK_24_HOUR style in addition to :CLOCK_12_HOUR
          # TODO support :BUTTON_ALWAYS, :BUTTON_AUTO, :BUTTON_MANUAL, :BUTTON_NEVER, :BUTTON_LEFT, and :BUTTON_RIGHT styles
          # TODO support "Today" functionality
          # TODO support pattern functionality
          if [keyword].include_any?('c_date', 'c_date_drop_down', 'c_date_spinner', 'c_date_compact')
            args += [:date_short]
          end
          if [keyword].include_any?('c_time', 'c_time_drop_down', 'c_time_spinner', 'c_time_compact')
            args += [:time_short]
          end
          if keyword.end_with?('_drop_down')
            args += [:drop_down]
          elsif keyword.end_with?('_spinner')
            args += [:spinner]
          elsif keyword.end_with?('_compact')
            args += [:compact]
          else
            args += [:simple]
          end
          
          new(parent, args, block)
        end
      end
      
      def initialize(parent, args, block)
        super(parent, args, block)
        post_add_content if block.nil?
      end
      
      def post_add_content
        if date?
          options = {
            changeMonth: true,
            changeYear: true,
          }
          if drop_down?
            options = options.merge(
              showOn: 'both',
              buttonImage: 'assets/glimmer/images/calendar.gif',
              buttonImageOnly: true,
              buttonText: 'Select date',
            )
          end
          date_input_dom_element.datepicker(options)
        end
        
        if time?
          clocklet
          if drop_down?
            time_button_dom_element.on('click') do |event|
              `clocklet.open(document.getElementById(#{time_input_id}))`
            end
          end
        end
        
        selection_value = self.selection
        @added_content = true
        self.selection = selection_value
      end
      
      def clocklet
        unless defined?(@@clocklet_default_options_set)
          `clocklet.defaultOptions.appendTo = 'parent'`
          `clocklet.defaultOptions.format = 'hh:mm A'`
          @@clocklet_default_options_set = true
        end
        if simple?
          @clocklet ||= Native(`clocklet.inline(document.getElementById(#{clock_id}), {input: document.getElementById(#{time_input_id})})`)
        end
      end
      
      def date_time?
        !args.to_a.include_any?(:date_short, :date_medium, :date_long) && !args.to_a.include_any?(:time_short, :time_medium)
      end
      
      def date?
        args.to_a.include_any?(:date_short, :date_medium, :date_long) || date_time?
      end
      
      def time?
        args.to_a.include_any?(:time_short, :time_medium) || date_time?
      end
      
      def drop_down?
        args.to_a.include?(:drop_down)
      end
      
      def simple?
        args.to_a.include?(:simple)
      end
      
      def compact?
        args.to_a.include?(:compact)
      end
      
      def spinner?
        args.to_a.include?(:spinner)
      end
      
      def selection
        if @added_content
          default_date = DateTime.new if @selection.nil?
          
          current_year = @selection&.year || default_date.year
          current_month = @selection&.month || default_date.month
          current_day = @selection&.day || default_date.day
          current_hour = @selection&.hour || default_date.hour
          current_min = @selection&.min || default_date.min
          current_sec = @selection&.sec || default_date.sec
          
          if time?
            time_string = time_input_dom_element.val
             _, current_hour, current_min, am_pm = time_string.match(/(\d{1,2})\:(\d{1,2})[ ]?([APap]?\.?[Mm]?\.?)/).to_a
            current_hour ||= default_hour
            current_min ||= default_min
            current_hour = current_hour.to_i
            am_pm = am_pm.to_s.gsub('.', '').upcase
            current_hour += 12 if am_pm == 'PM'
            current_min = current_min.to_i
          end
          
          if date?
            current_year = date_input_dom_element.datepicker('getDate')&.year.to_i
            current_month = date_input_dom_element.datepicker('getDate')&.month.to_i
            current_day = date_input_dom_element.datepicker('getDate')&.day.to_i
          end
          
          @selection = DateTime.new(current_year, current_month, current_day, current_hour, current_min, current_sec)
          @selection = @selection&.to_datetime
        else
          @initial_selection
        end
      end
      
      def selection=(value)
        if @added_content
          @selection = value&.to_datetime || DateTime.new
          
          if time?
            formatted_time = @selection.strftime('%I:%M %p')
            if drop_down? || spinner? || compact?
              time_input_dom_element.val(formatted_time)
            else
              clocklet.value(formatted_time)
            end
          end
          
          if date?
            date_input_dom_element.datepicker('setDate', @selection.to_time)
          end
        else
          @initial_selection = value
        end
      end
      
      def observation_request_to_event_mapping
        {
          'on_widget_selected' => [
            { # time
              event: 'input',
            },
            { # date
              event: 'change',
            },
          ],
        }
      end
      
      def listener_path
        if date_time?
          "#{date_input_path}, #{time_input_path}"
        elsif date?
          date_input_path
        else # time
          time_input_path
        end
      end
      
      def time_button_id
        "#{id}-time-button"
      end
      
      def time_button_class
        "#{name}-time-button"
      end
      
      def time_button_path
        "#{path} ##{time_button_id}"
      end
      
      def time_button_dom_element
        Document.find(time_button_path)
      end
      
      def element
        'span'
      end
      
      def date_input_id
        "#{id}-date-input"
      end
      
      def date_input_class
        "#{name}-date-input"
      end
      
      def date_input_path
        "#{path} ##{date_input_id}"
      end
      
      def date_input_dom_element
        Document.find(date_input_path)
      end
      
      def time_input_id
        "#{id}-time-input"
      end
      
      def time_input_class
        "#{name}-time-input"
      end
      
      def time_input_path
        "#{path} ##{time_input_id}"
      end
      
      def time_input_dom_element
        Document.find(time_input_path)
      end
      
      def clock_id
        "#{id}-clock"
      end
      
      def clock_class
        "#{name}-clock"
      end
      
      def clock_path
        "#{path} .clocklet"
      end
      
      def clock_dom_element
        Document.find(clock_path)
      end
      
      def dom
        date_input_element = simple? ? 'div' : 'input'
        date_input_attributes = {type: 'text', style: 'display: inline-block; vertical-align: top;', id: date_input_id, class: date_input_class}
        time_input_class_value = "#{time_input_class} hide" if time? && simple?
        time_input_attributes = {type: 'text', id: time_input_id, class: time_input_class_value}
        time_input_attributes['data-clocklet'] = 'format: hh:mm A; appendTo: parent;' if time?
        clock_attributes = {id: clock_id, class: clock_class, style: 'display: inline-block; vertical-align: top;'}
        clock_attributes[:style] = 'display: inline-block; vertical-align: top; font-size: 13px; '
        the_class = name
        the_class += ' simple' if simple?
        the_class += ' drop-down' if drop_down?
        the_class += ' spinner' if spinner?
        the_class += ' compact' if compact?
        @dom ||= html {
          span(id: id, class: the_class) {
            # TODO move style somewhere to embed one time for all elements instead of repeating per element
            style {
              css {
                s('.c-date-time.simple .clocklet, .c-date-time.drop-down .clocklet') {
                  pv 'font-size', '13px'
                  pv 'width', '207px'
                  pv 'height', '207px'
                }
                s('.c-date-time.compact .clocklet, .c-date-time.spinner .clocklet') {
                  pv 'display', 'none'
                }
              }
            }
            send(date_input_element, date_input_attributes) {} if date?
            input(time_input_attributes) {} if time?
            div(clock_attributes) {} if time? && simple?
            button(id: time_button_id, class: time_button_class, style: "border: none; background: url(assets/glimmer/images/ui-icons_222222_256x240.png) -80px, -96px; width: 16px; height: 16px;") if time? && drop_down?
          }
        }.to_s
      end
      
      def widget_property_listener_installers
        super.merge(
          CDateTimeProxy => {
            :selection => lambda do |observer|
              on_widget_selected { |selection_event|
                observer.call(selection)
              }
            end
          },
          
        )
      end
    end
    
    # Aliases: `date`, `date_drop_down`, `time`, and `calendar`
    # TODO
    CDateProxy               = CDateTimeProxy
    CDateDropDownProxy       = CDateTimeProxy
    CDateSpinnerProxy        = CDateTimeProxy
    CDateCompactProxy        = CDateTimeProxy
    CTimeProxy               = CDateTimeProxy
    CTimeDropDownProxy       = CDateTimeProxy
    CTimeSpinnerProxy        = CDateTimeProxy
    CTimeCompactProxy        = CDateTimeProxy
    CDateTimeDropDownProxy   = CDateTimeProxy
    CDateTimeSpinnerProxy    = CDateTimeProxy
    CDateTimeCompactProxy    = CDateTimeProxy
    
  end
  
end

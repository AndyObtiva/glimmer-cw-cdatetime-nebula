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
        if time?
          clocklet
          if drop_down?
            time_button_dom_element.on('click') do |event|
              `clocklet.open(document.getElementById(#{input_id}))`
            end
          end
        else
          options = {
            changeMonth: true,
            changeYear: true,
          }
          if drop_down?
            options = {
              showOn: 'both',
              buttonImage: 'assets/glimmer/images/calendar.gif',
              buttonImageOnly: true,
              buttonText: 'Select date',
            }
          end
          input_dom_element.datepicker(options)
        end
        selection_value = self.selection
        @added_content = true
        self.selection = selection_value
      end
      
      def clocklet
        if simple?
          @clocklet ||= Native(`clocklet.inline(document.getElementById(#{clock_id}), {format: 'HH:mm', input: document.getElementById(#{input_id})})`)
        end
      end
      
      def date?
        args.to_a.include_any?(:date_short, :date_medium, :date_long)
      end
      
      def time?
        args.to_a.include_any?(:time_short, :time_medium)
      end
      
      def date_time?
        !date? && !time?
      end
      
      def drop_down?
        # Temporarily use dropdown for spinner and compact until fully supported in the future
        args.to_a.include?(:drop_down) || spinner? || compact?
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
          default_year = @selection&.year || default_date.year
          default_month = @selection&.month || default_date.month
          default_day = @selection&.day || default_date.day
          default_hour = @selection&.hour || default_date.hour
          default_min = @selection&.min || default_date.min
          default_sec = @selection&.sec || default_date.sec
          if time?
            time_string = input_dom_element.val
             _, current_hour, current_min, am_pm = time_string.match(/(\d{1,2})\:(\d{1,2})[ ]?([APap]?\.?[Mm]?\.?)/).to_a
            current_hour ||= default_hour
            current_min ||= default_min
            current_hour = current_hour.to_i
            am_pm = am_pm.to_s.gsub('.', '').upcase
            current_hour += 12 if am_pm == 'PM'
            current_min = current_min.to_i
            @selection = DateTime.new(default_year, default_month, default_day, current_hour, current_min, default_sec)
          else
            @selection = DateTime.new(input_dom_element.datepicker('getDate')&.year.to_i, input_dom_element.datepicker('getDate')&.month.to_i, input_dom_element.datepicker('getDate')&.day.to_i, default_hour, default_min, default_sec)
          end
          @selection = @selection&.to_datetime
        else
          @initial_selection
        end
      end
      
      def selection=(value)
        if @added_content
          @selection = value&.to_datetime || DateTime.new
          if time?
            if drop_down?
              input_dom_element.val(@selection.strftime('%I:%M %p'))
            else
              clocklet.value(@selection.strftime('%H:%M'))
            end
          else
            input_dom_element.datepicker('setDate', @selection.to_time)
          end
        else
          @initial_selection = value
        end
      end
      
      # TODO add date, time, year, month, day, hours, minutes, seconds attribute methods
      
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
        input_path
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
      
      def input_id
        "#{id}-input"
      end
      
      def input_class
        "#{name}-input"
      end
      
      def input_path
        "#{path} ##{input_id}"
      end
      
      def input_dom_element
        Document.find(input_path)
      end
      
      def clock_id
        "#{id}-clock"
      end
      
      def clock_class
        "#{name}-clock"
      end
      
      def clock_path
        "#{path} ##{clock_id}"
      end
      
      def clock_dom_element
        Document.find(clock_path)
      end
      
      def dom
        input_element = date? && simple? ? 'div' : 'input'
        input_class_value = "#{input_class} hide" if time? && simple?
        input_attributes = {type: 'text', id: input_id, class: input_class_value}
        input_attributes['data-clocklet'] = "format: hh:mm A;" if time? && drop_down?
        @dom ||= html {
          span(id: id, class: name) {
            send(input_element, input_attributes)
            div(id: clock_id, class: clock_class) if time? && simple?
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

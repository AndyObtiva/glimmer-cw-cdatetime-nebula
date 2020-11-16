require 'glimmer/swt/widget_proxy'

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
      end
      
      def post_add_content
        if time?
          if drop_down?
            input_dom_element.mdtimepicker({
              timeFormat: 'h:mm tt',
              format: 'h:mm tt',
              clearBtn: true,
              hourPadding: true,
            })
            time_button_dom_element.on('click') do |event|
              input_dom_element.mdtimepicker('show')
            end
          else
            date_time_value = self.date_time
            @added_content = true
            self.date_time = date_time_value
          
            input_dom_element.clockInput
            
            clock_dom_element.on('click') do |event|
              if @clock_minutes && clock_dom_element.has_class?('jq-ci--m')
                clock_dom_element.add_class('jq-ci--h')
                clock_dom_element.remove_class('jq-ci--m')
              end
              @clock_minutes = clock_dom_element.has_class?('jq-ci--m')
            end
          end
        else
          options = {}
          if drop_down?
            options = {
              showOn: 'both',
              buttonImage: 'assets/glimmer/images/calendar.gif',
              buttonImageOnly: true,
              buttonText: 'Select date'
            }
          end
          input_dom_element.datepicker(options)
        end
        date_time_value = self.date_time
        @added_content = true
        self.date_time = date_time_value
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
      
      def date_time
        if @added_content
          default_date = DateTime.new if @date_time.nil?
          default_year = @date_time&.year || default_date.year
          default_month = @date_time&.month || default_date.month
          default_day = @date_time&.day || default_date.day
          default_hour = @date_time&.hour || default_date.hour
          default_min = @date_time&.min || default_date.min
          default_sec = @date_time&.sec || default_date.sec
          if time?
#             if drop_down?
              time_string = input_dom_element.val
              _, current_hour, current_min, am_pm = time_string.match(/(\d{1,2})\:(\d{1,2})[ ]?([APap]?\.?[Mm]?\.?)/)
              current_hour = current_hour.to_i
              am_pm = am_pm.to_s.gsub('.', '').upcase
              current_hour += 12 if am_pm == 'PM'
              current_min = current_min.to_i
              @date_time = DateTime.new(default_year, default_month, default_day, current_hour, current_min, default_sec)
              # TODO delete this code if not needed as it seems to work without it (test further to confirm)
#             else
#               current_hour = clock_dom_element.find('.jq-ci-t_h').text.to_i
#               current_min = clock_dom_element.find('.jq-ci-t_m').text.to_i
#               am_pm = clock_dom_element.find('.jq-ci-t_ap--s').empty? ? 'AM' : 'PM'
#               current_hour += 12 if am_pm == 'PM'
#               @date_time = DateTime.new(default_year, default_month, default_day, current_hour, current_min, default_sec)
#             end
          else
            @date_time = DateTime.new(input_dom_element.datepicker('getDate')&.year.to_i, input_dom_element.datepicker('getDate')&.month.to_i, input_dom_element.datepicker('getDate')&.day.to_i, default_hour, default_min, default_sec)
          end
          @date_time = @date_time&.to_datetime
        else
          @initial_date_time
        end
      end
      
      def date_time=(value)
        if @added_content
          @date_time = value&.to_datetime || DateTime.new
          if time?
            if drop_down?
              input_dom_element.mdtimepicker('setValue', @date_time.strftime('%I:%M %p'))
            else
              input_dom_element.val(@date_time.strftime('%H:%M'))
            end
          else
            input_dom_element.datepicker('setDate', @date_time.to_time)
          end
        else
          @initial_date_time = value
        end
      end
      
      # TODO add date, time, year, month, day, hours, minutes, seconds attribute methods
      
      def observation_request_to_event_mapping
        {
          'on_widget_selected' => [
            {
              event: 'click'
            },
            {
              event: 'change'
            },
            {
              event: 'timeChanged'
            },
          ],
        }
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
      
      def clock_class
        'jq-ci'
      end
      
      def clock_path
        "#{path} .#{clock_class}"
      end
      
      def clock_dom_element
        Document.find(clock_path)
      end
      
      def dom
        input_element = (date? || date_time?) && simple? ? 'div' : 'input'
        @dom ||= html {
          span(id: id, class: name) {
            send(input_element, type: 'text', id: input_id, class: input_class)
            button(id: time_button_id, class: time_button_class, style: "border: none; background: url(assets/glimmer/images/ui-icons_222222_256x240.png) -80px, -96px; width: 16px; height: 16px;") if time? && drop_down?
          }
        }.to_s
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

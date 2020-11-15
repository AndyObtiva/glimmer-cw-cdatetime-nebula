require 'glimmer/swt/widget_proxy'

module Glimmer
  module SWT
    class CDateTimeProxy < WidgetProxy
      class << self
        def create(keyword, parent, args)
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
          if [keyword].include_any?(['c_date', 'c_date_drop_down', 'c_date_spinner', 'c_date_compact'])
            args += [:date_short]
          end
          if [keyword].include_any?(['c_time', 'c_time_drop_down', 'c_time_spinner', 'c_time_compact'])
            args += [:time_short]
          end
          # Temporarily use dropdown for spinner and compact until fully supported in the future
          if keyword.end_with?('_drop_down') || keyword.end_with?('_spinner') || keyword.end_with?('_compact')
            args += [:drop_down]
          else
            args += [:simple]
          end
          
          pd keyword, args
          
          new(parent, args)
        end
      end
      
      def initialize(parent, args)
        super(parent, args)
      end
      
      def post_add_content
        # TODO handle date_drop_down version
        if time?
          options = {}
          if drop_down?
            options = {
              showPeriod: true,
              showLeadingZero: true,
              showOn: 'both',
              button: "##{time_button_id}",
            }
          end
          pd id
          pd dom_element
          dom_element.timepicker(options)
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
          pd id
          pd dom_element
          dom_element.datepicker(options)
        end
        date_time_value = self.date_time
        @added_content = true
        self.date_time = date_time_value
      end
      
      def date?
        args.to_a.include_any?([:date_short, :date_medium, :date_long])
      end
      
      def time?
        args.to_a.include_any?([:time_short, :time_medium])
      end
      
      def drop_down?
        args.to_a.include?(:drop_down)
      end
      
      def simple?
        args.to_a.include?(:simple)
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
            @date_time = DateTime.new(default_year, default_month, default_day, dom_element.timepicker('getHour').to_i, dom_element.timepicker('getMinute').to_i, default_sec)
          else
            @date_time = DateTime.new(dom_element.datepicker('getDate')&.year.to_i, dom_element.datepicker('getDate')&.month.to_i, dom_element.datepicker('getDate')&.day.to_i, default_hour, default_min, default_sec)
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
            dom_element.timepicker('setTime', "#{@date_time.hour}:#{@date_time.min}")
          else
            dom_element.datepicker('setDate', @date_time.to_time)
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
              event: 'change'
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
      
      def element
        simple? ? 'div' : 'input'
      end
      
      def dom
        pd id, name
        @dom ||= html {
          span {
            send(element, type: 'text', id: id, class: name)
            button(id: time_button_id, class: time_button_class, style: "border: none; background: url(assets/glimmer/images/ui-icons_222222_256x240.png) -80px, -96px; width: 16px; height: 16px;") if drop_down? && time?
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

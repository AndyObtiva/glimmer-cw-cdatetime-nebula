module Nebula
  # This modules just configures Glimmer to work with Nebula CDateTime
  module CDateTime    
    include Glimmer

    Glimmer::SWT::TableProxy.editors[:c_date_time] ||= {
      widget_value_property: :selection,
      editor_gui: lambda do |args, model, property, table_proxy|      
        args << cdt(:drop_down) if args.empty?
        table_editor_widget_proxy = c_date_time(*args) {
          table_proxy.table_editor.minimumHeight = 20
          selection model.send(property)
          focus true
          on_focus_lost {
            table_proxy.finish_edit!
          }
          on_key_pressed { |key_event|
            if key_event.keyCode == swt(:cr)
              table_proxy.finish_edit!
            elsif key_event.keyCode == swt(:esc)
              table_proxy.cancel_edit!
            end
          }
          on_widget_selected { |event|          
            table_proxy.finish_edit! unless event.widget.is_open
          }
          on_widget_default_selected { |event|
            table_proxy.finish_edit! unless event.widget.is_open
          }
        }
        table_editor_widget_proxy
      end
    }    
  end
end

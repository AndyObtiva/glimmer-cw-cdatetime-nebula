# Change Log

## 1.4.0.2.0

- Actual CDateTimeProxy class that is a subclass of WidgetProxy
- Smart defaults
` `cdt` keyword for easily building `CDT` styles
- `c_date`, `c_time` aliases for date only and time only
- `c_date_time_drop_down`, `c_date_drop_down`, `c_time_drop_down` for drop down configured widgets
- `c_date_time_spinner`, `c_date_spinner`, `c_time_spinner` for spinner configured widgets
- `c_date_time_compact`, `c_date_compact`, `c_time_compact` for compact style configured widgets
- `text_widget_proxy` method to retrieve a Glimmer widget proxy for the inner text widget of CDateTime, thus enabling direct adding of observers and data-binding
- `toggle_open` method to programmatically toggle between open and closed (works better and is more convenient than `.swt_widget.set_open` in some situations)
- Nebula CDateTime Glimmer Custom Widget Gallery [sample](samples/nebula/c_date_time_gallery.rb)

## 1.4.0.1

- Prevent table editor from saving upon traversing months in drop down Calendar

## 1.4.0.0

- Initial version containing a Glimmer configured and wrapped CDateTime Nebula custom widget
- Support use as editor of Glimmer table items.
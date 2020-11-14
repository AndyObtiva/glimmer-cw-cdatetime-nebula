# Copyright (c) 2020 Andy Maleh
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

module Glimmer
  # Acts as an Opal Ruby substitute for the Eclipse SWT class
  # Up-to-date with SWT 4.17
  module CDT
    ABORT                                     = 512
    ALL                                       = 1
    ALPHA                                     = 4
    ALT                                       = 65536
    ALT_GR                                    = 32768
    APPLICATION_MODAL                         = 65536
    ARROW                                     = 4
    ARROW_DOWN                                = 16777218
    ARROW_LEFT                                = 16777219
    ARROW_RIGHT                               = 16777220
    ARROW_UP                                  = 16777217
    AUTO_TEXT_DIRECTION                       = 100663296
    Activate                                  = 26
    Arm                                       = 30
    BACKGROUND                                = 8
    BALLOON                                   = 4096
    BAR                                       = 2
    BEGINNING                                 = 1
    BITMAP                                    = 0
    BOLD                                      = 1
    BORDER                                    = 2048
    BORDER_DASH                               = 2
    BORDER_DOT                                = 4
    BORDER_SOLID                              = 1
    BOTTOM                                    = 1024
    BREAK                                     = 16777302
    BS                                        = 8
    BUTTON1                                   = 524288
    BUTTON2                                   = 1048576
    BUTTON3                                   = 2097152
    BUTTON4                                   = 8388608
    BUTTON5                                   = 33554432
    BUTTON_MASK                               = 45613056
    CALENDAR                                  = 1024
    CALENDAR_WEEKNUMBERS                      = 16384
    CANCEL                                    = 256
    CAPS_LOCK                                 = 16777298
    CAP_FLAT                                  = 1
    CAP_ROUND                                 = 2
    CAP_SQUARE                                = 3
    CASCADE                                   = 64
    CENTER                                    = 16777216
    CHANGED                                   = 2
    CHECK                                     = 32
    CHROMIUM                                  = 131072
    CLIP_CHILDREN                             = 4096
    CLIP_SIBLINGS                             = 8192
    CLOSE                                     = 64
    COLOR_BLACK                               = 2
    COLOR_BLUE                                = 9
    COLOR_CYAN                                = 13
    COLOR_DARK_BLUE                           = 10
    COLOR_DARK_CYAN                           = 14
    COLOR_DARK_GRAY                           = 16
    COLOR_DARK_GREEN                          = 6
    COLOR_DARK_MAGENTA                        = 12
    COLOR_DARK_RED                            = 4
    COLOR_DARK_YELLOW                         = 8
    COLOR_GRAY                                = 15
    COLOR_GREEN                               = 5
    COLOR_INFO_BACKGROUND                     = 29
    COLOR_INFO_FOREGROUND                     = 28
    COLOR_LINK_FOREGROUND                     = 36
    COLOR_LIST_BACKGROUND                     = 25
    COLOR_LIST_FOREGROUND                     = 24
    COLOR_LIST_SELECTION                      = 26
    COLOR_LIST_SELECTION_TEXT                 = 27
    COLOR_MAGENTA                             = 11
    COLOR_RED                                 = 3
    COLOR_TEXT_DISABLED_BACKGROUND            = 38
    COLOR_TITLE_BACKGROUND                    = 31
    COLOR_TITLE_BACKGROUND_GRADIENT           = 32
    COLOR_TITLE_FOREGROUND                    = 30
    COLOR_TITLE_INACTIVE_BACKGROUND           = 34
    COLOR_TITLE_INACTIVE_BACKGROUND_GRADIENT  = 35
    COLOR_TITLE_INACTIVE_FOREGROUND           = 33
    COLOR_TRANSPARENT                         = 37
    COLOR_WHITE                               = 1
    COLOR_WIDGET_BACKGROUND                   = 22
    COLOR_WIDGET_BORDER                       = 23
    COLOR_WIDGET_DARK_SHADOW                  = 17
    COLOR_WIDGET_DISABLED_FOREGROUND          = 39
    COLOR_WIDGET_FOREGROUND                   = 21
    COLOR_WIDGET_HIGHLIGHT_SHADOW             = 20
    COLOR_WIDGET_LIGHT_SHADOW                 = 19
    COLOR_WIDGET_NORMAL_SHADOW                = 18
    COLOR_YELLOW                              = 7
    COMMAND                                   = 4194304
    COMPOSITION_CHANGED                       = 1
    COMPOSITION_OFFSET                        = 2
    COMPOSITION_SELECTION                     = 3
    CONTROL                                   = 262144
    CR                                        = 13
    CTRL                                      = 262144
    CURSOR_APPSTARTING                        = 3
    CURSOR_ARROW                              = 0
    CURSOR_CROSS                              = 2
    CURSOR_HAND                               = 21
    CURSOR_HELP                               = 4
    CURSOR_IBEAM                              = 19
    CURSOR_NO                                 = 20
    CURSOR_SIZEALL                            = 5
    CURSOR_SIZEE                              = 12
    CURSOR_SIZEN                              = 10
    CURSOR_SIZENE                             = 14
    CURSOR_SIZENESW                           = 6
    CURSOR_SIZENS                             = 7
    CURSOR_SIZENW                             = 17
    CURSOR_SIZENWSE                           = 8
    CURSOR_SIZES                              = 11
    CURSOR_SIZESE                             = 15
    CURSOR_SIZESW                             = 16
    CURSOR_SIZEW                              = 13
    CURSOR_SIZEWE                             = 9
    CURSOR_UPARROW                            = 18
    CURSOR_WAIT                               = 1
    Close                                     = 21
    Collapse                                  = 18
    DATE                                      = 32
    DBCS                                      = 2
    DEFAULT                                   = -1
    DEFER                                     = 4
    DEL                                       = 127
    DELIMITER_SELECTION                       = 131072
    DIALOG_TRIM                               = 2144
    DM_FILL_BACKGROUND                        = 2
    DM_FILL_NONE                              = 1
    DM_FILL_PREVIOUS                          = 3
    DM_UNSPECIFIED                            = 0
    DOUBLE_BUFFERED                           = 536870912
    DOWN                                      = 1024
    DRAG                                      = 1
    DRAW_DELIMITER                            = 2
    DRAW_MNEMONIC                             = 8
    DRAW_TAB                                  = 4
    DRAW_TRANSPARENT                          = 1
    DROP_DOWN                                 = 4
    Deactivate                                = 27
    DefaultSelection                          = 14
    Deiconify                                 = 20
    Dispose                                   = 12
    DragDetect                                = 29
    EMBEDDED                                  = 16777216
    const_set 'END',                            16777224
    ERROR                                     = 1
    ERROR_CANNOT_BE_ZERO                      = 7
    ERROR_CANNOT_GET_COUNT                    = 36
    ERROR_CANNOT_GET_ENABLED                  = 31
    ERROR_CANNOT_GET_ITEM                     = 8
    ERROR_CANNOT_GET_ITEM_HEIGHT              = 11
    ERROR_CANNOT_GET_SELECTION                = 9
    ERROR_CANNOT_GET_TEXT                     = 12
    ERROR_CANNOT_INVERT_MATRIX                = 10
    ERROR_CANNOT_SET_ENABLED                  = 30
    ERROR_CANNOT_SET_MENU                     = 29
    ERROR_CANNOT_SET_SELECTION                = 28
    ERROR_CANNOT_SET_TEXT                     = 13
    ERROR_DEVICE_DISPOSED                     = 45
    ERROR_FAILED_EVALUATE                     = 50
    ERROR_FAILED_EXEC                         = 46
    ERROR_FAILED_LOAD_LIBRARY                 = 47
    ERROR_FUNCTION_DISPOSED                   = 49
    ERROR_GRAPHIC_DISPOSED                    = 44
    ERROR_INVALID_ARGUMENT                    = 5
    ERROR_INVALID_FONT                        = 48
    ERROR_INVALID_IMAGE                       = 40
    ERROR_INVALID_PARENT                      = 32
    ERROR_INVALID_RANGE                       = 6
    ERROR_INVALID_RETURN_VALUE                = 51
    ERROR_INVALID_SUBCLASS                    = 43
    ERROR_IO                                  = 39
    ERROR_ITEM_NOT_ADDED                      = 14
    ERROR_ITEM_NOT_REMOVED                    = 15
    ERROR_MENUITEM_NOT_CASCADE                = 27
    ERROR_MENU_NOT_BAR                        = 33
    ERROR_MENU_NOT_DROP_DOWN                  = 21
    ERROR_MENU_NOT_POP_UP                     = 37
    ERROR_NOT_IMPLEMENTED                     = 20
    ERROR_NO_GRAPHICS_LIBRARY                 = 16
    ERROR_NO_HANDLES                          = 2
    ERROR_NO_MORE_CALLBACKS                   = 3
    ERROR_NULL_ARGUMENT                       = 4
    ERROR_THREAD_INVALID_ACCESS               = 22
    ERROR_UNSPECIFIED                         = 1
    ERROR_UNSUPPORTED_DEPTH                   = 38
    ERROR_UNSUPPORTED_FORMAT                  = 42
    ERROR_WIDGET_DISPOSED                     = 24
    ESC                                       = 27
    EraseItem                                 = 40
    Expand                                    = 17
    F1                                        = 16777226
    F10                                       = 16777235
    F11                                       = 16777236
    F12                                       = 16777237
    F13                                       = 16777238
    F14                                       = 16777239
    F15                                       = 16777240
    F16                                       = 16777241
    F17                                       = 16777242
    F18                                       = 16777243
    F19                                       = 16777244
    F2                                        = 16777227
    F20                                       = 16777245
    F3                                        = 16777228
    F4                                        = 16777229
    F5                                        = 16777230
    F6                                        = 16777231
    F7                                        = 16777232
    F8                                        = 16777233
    F9                                        = 16777234
    FILL                                      = 4
    FILL_EVEN_ODD                             = 1
    FILL_WINDING                              = 2
    FLAT                                      = 8388608
    FLIP_TEXT_DIRECTION                       = -2147483648
    FOCUSED                                   = 4
    FOREGROUND                                = 16
    FULL_SELECTION                            = 65536
    FocusIn                                   = 15
    FocusOut                                  = 16
    GESTURE_BEGIN                             = 2
    GESTURE_END                               = 4
    GESTURE_MAGNIFY                           = 32
    GESTURE_PAN                               = 64
    GESTURE_ROTATE                            = 8
    GESTURE_SWIPE                             = 16
    Gesture                                   = 48
    HELP                                      = 16777297
    HIDE_SELECTION                            = 32768
    HIGH                                      = 2
    HOME                                      = 16777223
    HORIZONTAL                                = 256
    HOT                                       = 32
    H_SCROLL                                  = 256
    HardKeyDown                               = 33
    HardKeyUp                                 = 34
    Help                                      = 28
    Hide                                      = 23
    ICON                                      = 1
    ICON_CANCEL                               = 256
    ICON_ERROR                                = 1
    ICON_INFORMATION                          = 2
    ICON_QUESTION                             = 4
    ICON_SEARCH                               = 512
    ICON_WARNING                              = 8
    ICON_WORKING                              = 16
    ID_ABOUT                                  = -1
    ID_HIDE                                   = -3
    ID_HIDE_OTHERS                            = -4
    ID_PREFERENCES                            = -2
    ID_QUIT                                   = -6
    ID_SHOW_ALL                               = -5
    IGNORE                                    = 2048
    IMAGE_BMP                                 = 0
    IMAGE_BMP_RLE                             = 1
    IMAGE_COPY                                = 0
    IMAGE_DISABLE                             = 1
    IMAGE_GIF                                 = 2
    IMAGE_GRAY                                = 2
    IMAGE_ICO                                 = 3
    IMAGE_JPEG                                = 4
    IMAGE_OS2_BMP                             = 7
    IMAGE_PNG                                 = 5
    IMAGE_SVG                                 = 8
    IMAGE_TIFF                                = 6
    IMAGE_UNDEFINED                           = -1
    INDETERMINATE                             = 2
    INHERIT_DEFAULT                           = 1
    INHERIT_FORCE                             = 2
    INHERIT_NONE                              = 0
    INSERT                                    = 16777225
    ITALIC                                    = 2
    Iconify                                   = 19
    ImeComposition                            = 43
    JOIN_BEVEL                                = 3
    JOIN_MITER                                = 1
    JOIN_ROUND                                = 2
    KEYCODE_BIT                               = 16777216
    KEYPAD                                    = 2
    KEYPAD_0                                  = 16777264
    KEYPAD_1                                  = 16777265
    KEYPAD_2                                  = 16777266
    KEYPAD_3                                  = 16777267
    KEYPAD_4                                  = 16777268
    KEYPAD_5                                  = 16777269
    KEYPAD_6                                  = 16777270
    KEYPAD_7                                  = 16777271
    KEYPAD_8                                  = 16777272
    KEYPAD_9                                  = 16777273
    KEYPAD_ADD                                = 16777259
    KEYPAD_CR                                 = 16777296
    KEYPAD_DECIMAL                            = 16777262
    KEYPAD_DIVIDE                             = 16777263
    KEYPAD_EQUAL                              = 16777277
    KEYPAD_MULTIPLY                           = 16777258
    KEYPAD_SUBTRACT                           = 16777261
    KEY_MASK                                  = 16842751
    KeyDown                                   = 1
    KeyUp                                     = 2
    LAST_LINE_SELECTION                       = 1048576
    LEAD                                      = 16384
    LEFT                                      = 16384
    LEFT_TO_RIGHT                             = 33554432
    LF                                        = 10
    LINE_CUSTOM                               = 6
    LINE_DASH                                 = 2
    LINE_DASHDOT                              = 4
    LINE_DASHDOTDOT                           = 5
    LINE_DOT                                  = 3
    LINE_SOLID                                = 1
    LONG                                      = 268435456
    LOW                                       = 1
    MAX                                       = 1024
    MEDIUM                                    = 65536
    MENU                                      = 64
    MENU_KEYBOARD                             = 1
    MENU_MOUSE                                = 0
    MIN                                       = 128
    MIRRORED                                  = 134217728
    MOD1                                      = 4194304
    MOD2                                      = 131072
    MOD3                                      = 65536
    MOD4                                      = 262144
    MODELESS                                  = 0
    MODIFIER_MASK                             = 4685824
    MOVEMENT_CHAR                             = 1
    MOVEMENT_CLUSTER                          = 2
    MOVEMENT_WORD                             = 4
    MOVEMENT_WORD_END                         = 8
    MOVEMENT_WORD_START                       = 16
    MOZILLA                                   = 32768
    MULTI                                     = 2
    MeasureItem                               = 41
    MenuDetect                                = 35
    Modify                                    = 24
    MouseDoubleClick                          = 8
    MouseDown                                 = 3
    MouseEnter                                = 6
    MouseExit                                 = 7
    MouseHorizontalWheel                      = 38
    MouseHover                                = 32
    MouseMove                                 = 5
    MouseUp                                   = 4
    MouseVerticalWheel                        = 37
    MouseWheel                                = 37
    Move                                      = 10
    NATIVE                                    = 8
    NO                                        = 128
    NONE                                      = 0
    NORMAL                                    = 0
    NO_BACKGROUND                             = 262144
    NO_FOCUS                                  = 524288
    NO_MERGE_PAINTS                           = 2097152
    NO_MOVE                                   = 8388608
    NO_RADIO_GROUP                            = 4194304
    NO_REDRAW_RESIZE                          = 1048576
    NO_SCROLL                                 = 16
    NO_TRIM                                   = 8
    NULL                                      = 0
    NUM_LOCK                                  = 16777299
    None                                      = 0
    OFF                                       = 0
    OK                                        = 32
    ON                                        = 1
    ON_TOP                                    = 16384
    OPEN                                      = 4096
    OpenDocument                              = 46
    OpenUrl                                   = 54
    OrientationChange                         = 44
    PAGE_DOWN                                 = 16777222
    PAGE_UP                                   = 16777221
    PASSWORD                                  = 4194304
    PATH_CLOSE                                = 5
    PATH_CUBIC_TO                             = 4
    PATH_LINE_TO                              = 2
    PATH_MOVE_TO                              = 1
    PATH_QUAD_TO                              = 3
    PAUSE                                     = 16777301
    PAUSED                                    = 4
    PHONETIC                                  = 16
    POP_UP                                    = 8
    PRIMARY_MODAL                             = 32768
    PRINT_SCREEN                              = 16777303
    PUSH                                      = 8
    Paint                                     = 9
    PaintItem                                 = 42
    PostEvent                                 = 51
    PostExternalEventDispatch                 = 53
    PreEvent                                  = 50
    PreExternalEventDispatch                  = 52
    RADIO                                     = 16
    READ_ONLY                                 = 8
    RESIZE                                    = 16
    RETRY                                     = 1024
    RIGHT                                     = 131072
    RIGHT_TO_LEFT                             = 67108864
    ROMAN                                     = 32
    Resize                                    = 11
    SAVE                                      = 8192
    SCROLLBAR_OVERLAY                         = 2
    SCROLL_LINE                               = 1
    SCROLL_LOCK                               = 16777300
    SCROLL_PAGE                               = 2
    SEARCH                                    = 128
    SELECTED                                  = 2
    SEPARATOR                                 = 2
    SEPARATOR_FILL                            = -2
    SHADOW_ETCHED_IN                          = 16
    SHADOW_ETCHED_OUT                         = 64
    SHADOW_IN                                 = 4
    SHADOW_NONE                               = 32
    SHADOW_OUT                                = 8
    SHEET                                     = 268435456
    SHELL_TRIM                                = 1264
    SHIFT                                     = 131072
    SHORT                                     = 32768
    SIMPLE                                    = 64
    SINGLE                                    = 4
    SKIN_CLASS                                = 'org.eclipse.swt.skin.class'
    SKIN_ID                                   = 'org.eclipse.swt.skin.id'
    SMOOTH                                    = 65536
    SPACE                                     = 32
    SYSTEM_MODAL                              = 131072
    Segments                                  = 49
    Selection                                 = 13
    SetData                                   = 36
    Settings                                  = 39
    Show                                      = 22
    Skin                                      = 45
    Sleep                                     = 52
    TAB                                       = 9
    TIME                                      = 128
    TITLE                                     = 32
    TOGGLE                                    = 2
    TOOL                                      = 4
    TOP                                       = 128
    TOUCHSTATE_DOWN                           = 1
    TOUCHSTATE_MOVE                           = 2
    TOUCHSTATE_UP                             = 4
    TRAIL                                     = 131072
    TRANSPARENCY_ALPHA                        = 1
    TRANSPARENCY_MASK                         = 2
    TRANSPARENCY_NONE                         = 0
    TRANSPARENCY_PIXEL                        = 4
    TRANSPARENT                               = 1073741824
    TRAVERSE_ARROW_NEXT                       = 64
    TRAVERSE_ARROW_PREVIOUS                   = 32
    TRAVERSE_ESCAPE                           = 2
    TRAVERSE_MNEMONIC                         = 128
    TRAVERSE_NONE                             = 0
    TRAVERSE_PAGE_NEXT                        = 512
    TRAVERSE_PAGE_PREVIOUS                    = 256
    TRAVERSE_RETURN                           = 4
    TRAVERSE_TAB_NEXT                         = 16
    TRAVERSE_TAB_PREVIOUS                     = 8
    Touch                                     = 47
    Traverse                                  = 31
    UNDERLINE_DOUBLE                          = 1
    UNDERLINE_ERROR                           = 2
    UNDERLINE_LINK                            = 4
    UNDERLINE_SINGLE                          = 0
    UNDERLINE_SQUIGGLE                        = 3
    UP                                        = 128
    VERTICAL                                  = 512
    VIRTUAL                                   = 268435456
    V_SCROLL                                  = 512
    Verify                                    = 25
    WEBKIT                                    = 65536
    WRAP                                      = 64
    Wakeup                                    = 53
    YES                                       = 64
    ZoomChanged                               = 55
  end
end

----------------------------
-- dkrasiev awesome theme --
----------------------------
-- local catppuccin   = require '.theme.catppuccin.mocha'
-- local colors       = {
--     primary   = catppuccin.lavender.hex,
--     secondary = catppuccin.rosewater.hex,
--
--     success   = catppuccin.green.hex,
--     danger    = catppuccin.red.hex,
--     warning   = catppuccin.yellow.hex,
--     info      = catppuccin.blue.hex,
--
--     text      = catppuccin.text.hex,
--     subtle    = catppuccin.subtext0.hex,
--     muted     = catppuccin.subtext1.hex,
--
--     base      = catppuccin.base.hex,
--     surface   = catppuccin.surface0.hex,
--     overlay   = catppuccin.overlay0.hex,
-- }

-- Rose Pine
local rose_pine    = require '.theme.palettes.rose-pine'
local colors       = {
    primary        = rose_pine.rose,
    secondary      = rose_pine.iris,

    success        = rose_pine.pine,
    danger         = rose_pine.love,
    warning        = rose_pine.gold,
    info           = rose_pine.foam,

    text           = rose_pine.text,
    subtle         = rose_pine.subtle,
    muted          = rose_pine.muted,

    base           = rose_pine.base,
    surface        = rose_pine.surface,
    overlay        = rose_pine.overlay,

    highlight_low  = rose_pine.highlight_low,
    highlight_mid  = rose_pine.highlight_mid,
    highlight_high = rose_pine.highlight_high,
}

local gfs          = require 'gears.filesystem'
local theme_assets = require 'beautiful.theme_assets'
local dpi          = require 'beautiful.xresources'.apply_dpi
local shape        = require 'gears.shape'


-- MY VARIABLES
local themes_path     = gfs.get_configuration_dir() .. 'theme/'
local wallpapers_path = '/home/dkrasiev/Pictures/wallpapers/'
local gutter          = dpi(8)
local font            = {
    family = 'JetBrainsMonoNerdFont',
    size = {
        normal = 10,
        heading = 14,
    }
}


local function get_files(dir)
    local filenames = {}
    for filename in io.popen('ls "' .. dir .. '"'):lines() do
        table.insert(filenames, filename)
    end
    return filenames
end

-- local function get_wallpaper()
--     local wallpapers = get_files(wallpapers_path)
--     local wallpaper  = wallpapers[math.random(#wallpapers)]
--     return wallpapers_path .. wallpaper
-- end


local theme                                     = {}

-- DEFAULT VARIABLES
theme.font                                      = font.family .. ' ' .. font.size.normal
-- theme.wallpaper                                 = get_wallpaper
-- theme.wallpaper                                 = get_wallpaper

-- ARCCHART
-- theme.arcchart_border_color = nil
-- theme.arcchart_color = nil
-- theme.arcchart_border_width = nil
-- theme.arcchart_paddings = nil
-- theme.arcchart_thickness = nil

-- BG
theme.bg_normal                                 = colors.base
theme.bg_focus                                  = colors.overlay
theme.bg_urgent                                 = colors.danger
theme.bg_minimize                               = colors.highlight_low
theme.bg_systray                                = colors.base

-- BORDER
theme.border_width                              = dpi(1)
theme.border_normal                             = colors.highlight_high
theme.border_focus                              = colors.primary
theme.border_marked                             = colors.danger

-- CALENDAR
-- theme.calendar_style = nil
-- theme.calendar_font = nil
-- theme.calendar_spacing = nil
-- theme.calendar_week_numbers = nil
-- theme.calendar_start_sunday = nil
-- theme.calendar_long_weekdays = nil

-- CHECKBOX
-- theme.checkbox_border_width = nil
-- theme.checkbox_bg = nil
-- theme.checkbox_border_color = nil
-- theme.checkbox_check_border_color = nil
-- theme.checkbox_check_border_width = nil
-- theme.checkbox_check_color = nil
-- theme.checkbox_shape = nil
-- theme.checkbox_check_shape = nil
-- theme.checkbox_paddings = nil
-- theme.checkbox_color = nil

-- COLUMN
-- theme.column_count = nil

-- CURSOR
-- theme.cursor_mouse_resize = nil
-- theme.cursor_mouse_move = nil

-- ENABLE
-- theme.enable_spawn_cursor = nil

-- FG
theme.fg_normal                                 = colors.subtle
theme.fg_focus                                  = colors.text
theme.fg_urgent                                 = colors.text
theme.fg_minimize                               = colors.secondary

-- FULLSCREEN
-- theme.fullscreen_hide_border                    = false -- true by default

-- GAP
theme.gap_single_client                         = false

-- GRAPH
-- theme.graph_bg = nil
-- theme.graph_fg = nil
-- theme.graph_border_color = nil

-- HOTKEYS
-- theme.hotkeys_bg = nil
-- theme.hotkeys_fg = nil
-- theme.hotkeys_border_width = nil
-- theme.hotkeys_border_color = nil
-- theme.hotkeys_shape                             = function(cr, w, h)
--     return shape.rounded_rect(cr, w, h)
-- end
theme.hotkeys_modifiers_fg                      = colors.primary
-- theme.hotkeys_label_bg = nil
-- theme.hotkeys_label_fg = nil
theme.hotkeys_font                              = font.family .. ' ' .. font.size.heading .. ' ' .. 'bold'
theme.hotkeys_description_font                  = font.family .. ' ' .. font.size.normal
theme.hotkeys_group_margin                      = gutter

-- ICON
-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
-- theme.icon_theme = nil

-- LAYOUT
theme.layout_cornernw                           = themes_path .. 'layouts/cornernww.png'
theme.layout_cornerne                           = themes_path .. 'layouts/cornernew.png'
theme.layout_cornersw                           = themes_path .. 'layouts/cornersww.png'
theme.layout_cornerse                           = themes_path .. 'layouts/cornersew.png'
theme.layout_fairh                              = themes_path .. 'layouts/fairhw.png'
theme.layout_fairv                              = themes_path .. 'layouts/fairvw.png'
theme.layout_floating                           = themes_path .. 'layouts/floatingw.png'
theme.layout_magnifier                          = themes_path .. 'layouts/magnifierw.png'
theme.layout_max                                = themes_path .. 'layouts/maxw.png'
theme.layout_fullscreen                         = themes_path .. 'layouts/fullscreenw.png'
theme.layout_spiral                             = themes_path .. 'layouts/spiralw.png'
theme.layout_dwindle                            = themes_path .. 'layouts/dwindlew.png'
theme.layout_tile                               = themes_path .. 'layouts/tilew.png'
theme.layout_tiletop                            = themes_path .. 'layouts/tiletopw.png'
theme.layout_tilebottom                         = themes_path .. 'layouts/tilebottomw.png'
theme.layout_tileleft                           = themes_path .. 'layouts/tileleftw.png'

-- LAYOUTLIST
-- theme.layoutlist_fg_normal = nil
-- theme.layoutlist_bg_normal = nil
-- theme.layoutlist_fg_selected = nil
-- theme.layoutlist_bg_selected = nil
-- theme.layoutlist_disable_icon = nil
-- theme.layoutlist_disable_name = nil
-- theme.layoutlist_font = nil
-- theme.layoutlist_align = nil
-- theme.layoutlist_font_selected = nil
-- theme.layoutlist_spacing = nil
-- theme.layoutlist_shape = nil
-- theme.layoutlist_shape_border_width = nil
-- theme.layoutlist_shape_border_color = nil
-- theme.layoutlist_shape_selected = nil
-- theme.layoutlist_shape_border_width_selected = nil
-- theme.layoutlist_shape_border_color_selected = nil

-- MASTER
-- theme.master_width_factor = nil
-- theme.master_fill_policy = nil
-- theme.master_count = nil

-- MAXIMIZED
-- theme.maximized_honor_padding = nil
-- theme.maximized_hide_border = nil

-- MENU
theme.menu_submenu_icon                         = themes_path .. 'submenu.png'
-- theme.menu_font = nil
theme.menu_height                               = gutter * 3
theme.menu_width                                = gutter * 64
-- theme.menu_border_color = nil
-- theme.menu_border_width = nil
-- theme.menu_fg_focus = nil
-- theme.menu_bg_focus = nil
-- theme.menu_fg_normal = nil
-- theme.menu_bg_normal = nil
-- theme.menu_submenu = nil

-- MENUBAR
-- theme.menubar_fg_normal = nil
-- theme.menubar_bg_normal = nil
-- theme.menubar_border_width = nil
-- theme.menubar_border_color = nil

-- NOTIFICATION
-- theme.notification_font = nil
-- theme.notification_bg = nil
-- theme.notification_fg = nil
-- theme.notification_border_width = nil
-- theme.notification_border_color = nil
-- theme.notification_shape = nil
-- theme.notification_opacity = nil
-- theme.notification_margin = nil
-- theme.notification_width = nil
-- theme.notification_height = nil
-- theme.notification_max_width = nil
-- theme.notification_max_height = nil
theme.notification_icon_size                    = gutter * 2

-- PIECHART
-- theme.piechart_border_color = nil
-- theme.piechart_border_width = nil
-- theme.piechart_colors = nil

-- PROGRESSBAR
-- theme.progressbar_bg = nil
-- theme.progressbar_fg = nil
-- theme.progressbar_shape = nil
-- theme.progressbar_border_color = nil
-- theme.progressbar_border_width = nil
-- theme.progressbar_bar_shape = nil
-- theme.progressbar_bar_border_width = nil
-- theme.progressbar_bar_border_color = nil
-- theme.progressbar_margins = nil
-- theme.progressbar_paddings = nil

-- PROMPT
-- theme.prompt_fg_cursor = nil
-- theme.prompt_bg_cursor = nil
-- theme.prompt_font = nil
-- theme.prompt_fg = nil
-- theme.prompt_bg = nil

-- RADIALPROGRESSBAR
-- theme.radialprogressbar_border_color = nil
-- theme.radialprogressbar_color = nil
-- theme.radialprogressbar_border_width = nil
-- theme.radialprogressbar_paddings = nil

-- SEPARATOR
-- theme.separator_thickness = nil
-- theme.separator_border_color = nil
-- theme.separator_border_width = nil
-- theme.separator_span_ratio = nil
-- theme.separator_color = nil
-- theme.separator_shape = nil

-- SLIDER
-- theme.slider_bar_border_width = nil
-- theme.slider_bar_border_color = nil
-- theme.slider_handle_border_color = nil
-- theme.slider_handle_border_width = nil
-- theme.slider_handle_width = nil
-- theme.slider_handle_color = nil
-- theme.slider_handle_shape = nil
-- theme.slider_bar_shape = nil
-- theme.slider_bar_height = nil
-- theme.slider_bar_margins = nil
-- theme.slider_handle_margins = nil
-- theme.slider_bar_color = nil

-- SNAP
theme.snap_bg                                   = colors.primary
theme.snap_border_width                         = gutter / 2
theme.snap_shape                                = function(cr, h, w)
    shape.rounded_rect(cr, h, w, gutter / 2)
end

-- SNAPPER
theme.snapper_gap                               = gutter

-- SYSTRAY
-- theme.systray_icon_spacing = nil

-- TAGLIST
-- theme.taglist_fg_focus = nil
-- theme.taglist_bg_focus = nil
-- theme.taglist_fg_urgent = nil
-- theme.taglist_bg_urgent = nil
-- theme.taglist_bg_occupied = nil
-- theme.taglist_fg_occupied = nil
-- theme.taglist_bg_empty = nil
-- theme.taglist_fg_empty = nil
-- theme.taglist_bg_volatile = nil
-- theme.taglist_fg_volatile = nil

local taglist_square_size                       = gutter / 2
theme.taglist_squares_sel                       =
    theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel                     =
    theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- theme.taglist_squares_sel_empty = nil
-- theme.taglist_squares_unsel_empty = nil
-- theme.taglist_squares_resize = nil
-- theme.taglist_disable_icon = nil
-- theme.taglist_font = nil
-- theme.taglist_spacing = nil
-- theme.taglist_shape = nil
-- theme.taglist_shape_border_width = nil
-- theme.taglist_shape_border_color = nil
-- theme.taglist_shape_empty = nil
-- theme.taglist_shape_border_width_empty = nil
-- theme.taglist_shape_border_color_empty = nil
-- theme.taglist_shape_focus = nil
-- theme.taglist_shape_border_width_focus = nil
-- theme.taglist_shape_border_color_focus = nil
-- theme.taglist_shape_urgent = nil
-- theme.taglist_shape_border_width_urgent = nil
-- theme.taglist_shape_border_color_urgent = nil
-- theme.taglist_shape_volatile = nil
-- theme.taglist_shape_border_width_volatile = nil
-- theme.taglist_shape_border_color_volatile = nil

-- TASKLIST
-- theme.tasklist_fg_normal = nil
-- theme.tasklist_bg_normal = nil
-- theme.tasklist_fg_focus = nil
-- theme.tasklist_bg_focus = nil
-- theme.tasklist_fg_urgent = nil
-- theme.tasklist_bg_urgent = nil
-- theme.tasklist_fg_minimize = nil
-- theme.tasklist_bg_minimize = nil
-- theme.tasklist_bg_image_normal = nil
-- theme.tasklist_bg_image_focus = nil
-- theme.tasklist_bg_image_urgent = nil
-- theme.tasklist_bg_image_minimize = nil
-- theme.tasklist_disable_icon = nil
-- theme.tasklist_disable_task_name = nil
-- theme.tasklist_plain_task_name = nil
-- theme.tasklist_font = nil
-- theme.tasklist_align = nil
-- theme.tasklist_font_focus = nil
-- theme.tasklist_font_minimized = nil
-- theme.tasklist_font_urgent = nil
-- theme.tasklist_spacing = nil
-- theme.tasklist_shape = nil
-- theme.tasklist_shape_border_width = nil
-- theme.tasklist_shape_border_color = nil
-- theme.tasklist_shape_focus = nil
-- theme.tasklist_shape_border_width_focus = nil
-- theme.tasklist_shape_border_color_focus = nil
-- theme.tasklist_shape_minimized = nil
-- theme.tasklist_shape_border_width_minimized = nil
-- theme.tasklist_shape_border_color_minimized = nil
-- theme.tasklist_shape_urgent = nil
-- theme.tasklist_shape_border_width_urgent = nil
-- theme.tasklist_shape_border_color_urgent = nil

-- TITLEBAR
-- theme.titlebar_fg_normal = nil
-- theme.titlebar_bg_normal = nil
-- theme.titlebar_bgimage_normal = nil
-- theme.titlebar_fg = nil
-- theme.titlebar_bg = nil
-- theme.titlebar_bgimage = nil
-- theme.titlebar_fg_focus = nil
-- theme.titlebar_bg_focus = nil
-- theme.titlebar_bgimage_focus = nil
-- theme.titlebar_floating_button_normal = nil
-- theme.titlebar_maximized_button_normal = nil
theme.titlebar_minimize_button_normal           = themes_path
    .. 'titlebar/minimize_normal.png'
-- theme.titlebar_minimize_button_normal_hover = nil
-- theme.titlebar_minimize_button_normal_press = nil
theme.titlebar_close_button_normal              = themes_path .. 'titlebar/close_normal.png'
-- theme.titlebar_close_button_normal_hover = nil
-- theme.titlebar_close_button_normal_press = nil
-- theme.titlebar_ontop_button_normal = nil
-- theme.titlebar_sticky_button_normal = nil
-- theme.titlebar_floating_button_focus = nil
-- theme.titlebar_maximized_button_focus = nil
theme.titlebar_minimize_button_focus            = themes_path
    .. 'titlebar/minimize_focus.png'
-- theme.titlebar_minimize_button_focus_hover = nil
-- theme.titlebar_minimize_button_focus_press = nil
theme.titlebar_close_button_focus               = themes_path .. 'titlebar/close_focus.png'
-- theme.titlebar_close_button_focus_hover = nil
-- theme.titlebar_close_button_focus_press = nil
-- theme.titlebar_ontop_button_focus = nil
-- theme.titlebar_sticky_button_focus = nil
theme.titlebar_floating_button_normal_active    = themes_path
    .. 'titlebar/floating_normal_active.png'
-- theme.titlebar_floating_button_normal_active_hover = nil
-- theme.titlebar_floating_button_normal_active_press = nil
theme.titlebar_maximized_button_normal_active   = themes_path
    .. 'titlebar/maximized_normal_active.png'
-- theme.titlebar_maximized_button_normal_active_hover = nil
-- theme.titlebar_maximized_button_normal_active_press = nil
theme.titlebar_ontop_button_normal_active       = themes_path
    .. 'titlebar/ontop_normal_active.png'
-- theme.titlebar_ontop_button_normal_active_hover = nil
-- theme.titlebar_ontop_button_normal_active_press = nil
theme.titlebar_sticky_button_normal_active      = themes_path
    .. 'titlebar/sticky_normal_active.png'
-- theme.titlebar_sticky_button_normal_active_hover = nil
-- theme.titlebar_sticky_button_normal_active_press = nil
theme.titlebar_floating_button_focus_active     = themes_path
    .. 'titlebar/floating_focus_active.png'
-- theme.titlebar_floating_button_focus_active_hover = nil
-- theme.titlebar_floating_button_focus_active_press = nil
theme.titlebar_maximized_button_focus_active    = themes_path
    .. 'titlebar/maximized_focus_active.png'
-- theme.titlebar_maximized_button_focus_active_hover = nil
-- theme.titlebar_maximized_button_focus_active_press = nil
theme.titlebar_ontop_button_focus_active        = themes_path
    .. 'titlebar/ontop_focus_active.png'
-- theme.titlebar_ontop_button_focus_active_hover = nil
-- theme.titlebar_ontop_button_focus_active_press = nil
theme.titlebar_sticky_button_focus_active       = themes_path
    .. 'titlebar/sticky_focus_active.png'
-- theme.titlebar_sticky_button_focus_active_hover = nil
-- theme.titlebar_sticky_button_focus_active_press = nil
theme.titlebar_floating_button_normal_inactive  = themes_path
    .. 'titlebar/floating_normal_inactive.png'
-- theme.titlebar_floating_button_normal_inactive_hover = nil
-- theme.titlebar_floating_button_normal_inactive_press = nil
theme.titlebar_maximized_button_normal_inactive = themes_path
    .. 'titlebar/maximized_normal_inactive.png'
-- theme.titlebar_maximized_button_normal_inactive_hover = nil
-- theme.titlebar_maximized_button_normal_inactive_press = nil
theme.titlebar_ontop_button_normal_inactive     = themes_path
    .. 'titlebar/ontop_normal_inactive.png'
-- theme.titlebar_ontop_button_normal_inactive_hover = nil
-- theme.titlebar_ontop_button_normal_inactive_press = nil
theme.titlebar_sticky_button_normal_inactive    = themes_path
    .. 'titlebar/sticky_normal_inactive.png'
-- theme.titlebar_sticky_button_normal_inactive_hover = nil
-- theme.titlebar_sticky_button_normal_inactive_press = nil
theme.titlebar_floating_button_focus_inactive   = themes_path
    .. 'titlebar/floating_focus_inactive.png'
-- theme.titlebar_floating_button_focus_inactive_hover = nil
-- theme.titlebar_floating_button_focus_inactive_press = nil
theme.titlebar_maximized_button_focus_inactive  = themes_path
    .. 'titlebar/maximized_focus_inactive.png'
-- theme.titlebar_maximized_button_focus_inactive_hover = nil
-- theme.titlebar_maximized_button_focus_inactive_press = nil
theme.titlebar_ontop_button_focus_inactive      = themes_path
    .. 'titlebar/ontop_focus_inactive.png'
-- theme.titlebar_ontop_button_focus_inactive_hover = nil
-- theme.titlebar_ontop_button_focus_inactive_press = nil
theme.titlebar_sticky_button_focus_inactive     = themes_path
    .. 'titlebar/sticky_focus_inactive.png'
-- theme.titlebar_sticky_button_focus_inactive_hover = nil
-- theme.titlebar_sticky_button_focus_inactive_press = nil

-- TOOLTIP
-- theme.tooltip_border_color = nil
-- theme.tooltip_bg = nil
-- theme.tooltip_fg = nil
-- theme.tooltip_font = nil
-- theme.tooltip_border_width = nil
-- theme.tooltip_opacity = nil
-- theme.tooltip_shape = nil
-- theme.tooltip_align = nil

-- USELESS
theme.useless_gap                               = gutter / 2

-- WIBAR
-- theme.wibar_stretch = nil
-- theme.wibar_border_width = nil
-- theme.wibar_border_color = nil
-- theme.wibar_ontop = nil
-- theme.wibar_cursor = nil
-- theme.wibar_opacity = nil
-- theme.wibar_type = nil
-- theme.wibar_width = nil
theme.wibar_height                              = gutter * 3
-- theme.wibar_bg = nil
-- theme.wibar_bgimage = nil
-- theme.wibar_fg = nil
-- theme.wibar_shape = nil

-- AWESOME
-- theme.awesome_icon                              = theme_assets.awesome_icon(
--     theme.menu_height,
--     theme.bg_focus,
--     theme.fg_focus)

theme_assets.recolor_layout(theme, colors.primary)

-- theme_assets.recolor_titlebar(theme, colors.subtle, 'normal')
-- theme_assets.recolor_titlebar(theme, colors.text, 'normal', 'hover')
-- theme_assets.recolor_titlebar(theme, colors.primary, 'normal', 'press')

-- theme_assets.recolor_titlebar(theme, colors.subtle, 'focus')
-- theme_assets.recolor_titlebar(theme, colors.text, 'focus', 'hover')
-- theme_assets.recolor_titlebar(theme, colors.primary, 'focus', 'press')

return theme

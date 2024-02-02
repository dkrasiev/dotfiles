-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, 'luarocks.loader')


local awful         = require 'awful'
local beautiful     = require 'beautiful'
local gears         = require 'gears'
local hotkeys_popup = require 'awful.hotkeys_popup'
local naughty       = require 'naughty'
local wibox         = require 'wibox'
require 'awful.autofocus'
-- local gfs = require 'gears.filesystem'
-- local menubar = require("menubar")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
-- require("awful.hotkeys_popup.keys")


-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify {
		preset = naughty.config.presets.critical,
		title = 'Oops, there were errors during startup!',
		text = awesome.startup_errors,
	}
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal('debug::error', function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then
			return
		end
		in_error = true

		naughty.notify {
			preset = naughty.config.presets.critical,
			title  = 'Oops, an error happened!',
			text   = tostring(err),
		}
		in_error = false
	end)
end
-- }}}

-- {{{ Variable definitions
local theme = require 'theme.theme'
beautiful.init(theme)

local terminal         = 'kitty'
local filemanager      = 'thunar'
local browser          = 'google-chrome-stable'
local launcher         = 'rofi -show combi'
local powermenu        = '~/.config/rofi/powermenu.sh'
local volume_step      = '5'
local brightness_step  = '5'
-- local editor = os.getenv 'EDITOR' or 'nano'
-- local editor_cmd = terminal .. ' -e ' .. editor

local mod              = 'Mod4'
local alt              = 'Mod1'
local ctrl             = 'Control'
local shift            = 'Shift'

local tagkeys          = {
	'1',
	'2',
	'3',
	'4',
	'5',
	'6',
	'7',
	'8',
	'9',
}

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts   = {
	awful.layout.suit.tile,
	awful.layout.suit.magnifier,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
-- local myawesomemenu = {
-- 	{ "hotkeys",     function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
-- 	{ "manual",      terminal .. " -e man awesome" },
-- 	{ "edit config", editor_cmd .. " " .. awesome.conffile },
-- 	{ "restart",     awesome.restart },
-- 	{ "quit",        awesome.quit },
-- }

-- local mymainmenu = awful.menu({
-- 	items = {
-- 		{ "awesome",       myawesomemenu, beautiful.awesome_icon },
-- 		{ "open terminal", terminal },
-- 	},
-- })

-- local mylauncher = awful.widget.launcher({
-- 	image = beautiful.awesome_icon,
-- 	menu = mymainmenu,
-- })

-- Menubar configuration
-- menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibar
-- Keyboard map indicator and switcher
local mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget
local mytextclock      = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons  = gears.table.join(
	awful.button({}, 1, function(t) t:view_only() end),
	awful.button({ mod }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, function() awful.tag.viewtoggle() end),
	awful.button({ mod }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
	awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal('request::activate', 'tasklist', { raise = true })
		end
	end),
	awful.button(
		{},
		3,
		function() awful.menu.client_list() end
	),
	awful.button({}, 4, function() awful.client.focus.byidx(1) end),
	awful.button({}, 5, function() awful.client.focus.byidx(-1) end)
)

local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == 'function' then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal('property::geometry', set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	set_wallpaper(s)

	-- Each screen has its own tag table.
	awful.tag(tagkeys, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	-- s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoubox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(
		gears.table.join(
			awful.button({}, 1, function() awful.layout.inc(1) end),
			awful.button({}, 3, function() awful.layout.inc(-1) end),
			awful.button({}, 4, function() awful.layout.inc(1) end),
			awful.button({}, 5, function() awful.layout.inc(-1) end)
		)
	)
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist {
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
	}

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist {
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
	}

	-- Create the wibox
	s.mywibox = awful.wibar { position = 'top', screen = s }

	-- Add widgets to the wibox
	s.mywibox:setup {
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			-- mylauncher,
			s.mytaglist,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{           -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			mykeyboardlayout,
			wibox.widget.systray(),
			mytextclock,
			s.mylayoutbox,
		},
	}
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
-- awful.button({}, 3,
-- 	function()
-- 		mymainmenu:toggle()
-- 	end),
	awful.button({}, 4, awful.tag.viewnext),
	awful.button({}, 5, awful.tag.viewprev)
))
-- }}}

local resize_factor = 0.05

-- {{{ Key bindings
local globalkeys = gears.table.join(
-- Swap tags
	awful.key(
		{ alt },
		'Tab',
		function() awful.tag.viewnext() end,
		{ description = 'view next', group = 'tag' }
	),
	awful.key(
		{ alt, shift },
		'Tab',
		function() awful.tag.viewprev() end,
		{ description = 'view previous', group = 'tag' }
	),
	awful.key(
		{ alt },
		'Escape',
		function() awful.tag.history.restore() end,
		{ description = 'go back', group = 'tag' }
	),

	-- Focus cliens
	awful.key(
		{ mod },
		'j',
		function() awful.client.focus.byidx(1) end,
		{ description = 'focus next by index', group = 'client' }
	),
	awful.key(
		{ mod },
		'k',
		function() awful.client.focus.byidx(-1) end,
		{ description = 'focus previous by index', group = 'client' }
	),

	-- Swap clients
	awful.key(
		{ mod, shift },
		'j',
		function() awful.client.swap.byidx(1) end,
		{ description = 'swap with next client by index', group = 'client' }
	),
	awful.key(
		{ mod, shift },
		'k',
		function() awful.client.swap.byidx(-1) end,
		{ description = 'swap with previous client by index', group = 'client' }
	),

	-- Screen
	awful.key(
		{ mod, ctrl },
		'j',
		function() awful.screen.focus_relative(1) end,
		{ description = 'focus the next screen', group = 'screen' }
	),
	awful.key(
		{ mod, ctrl },
		'k',
		function() awful.screen.focus_relative(-1) end,
		{ description = 'focus the previous screen', group = 'screen' }
	),

	awful.key(
		{ mod },
		'u',
		function() awful.client.urgent.jumpto() end,
		{ description = 'jump to urgent client', group = 'client' }
	),

	-- awful.key({ mod }, "Tab",
	-- 	function()
	-- 		awful.client.focus.history.previous()
	-- 		if client.focus then
	-- 			client.focus:raise()
	-- 		end
	-- 	end,
	-- 	{ description = "go back", group = "client" }), -- Standard program

	awful.key(
		{ mod },
		'Return',
		function() awful.spawn(terminal) end,
		{ description = 'open a terminal', group = 'launcher' }
	),
	awful.key(
		{ alt },
		'space',
		function() awful.spawn.with_shell(launcher) end,
		{ description = 'run prompt', group = 'launcher' }
	),
	awful.key(
		{ mod },
		'e',
		function() awful.spawn(filemanager) end,
		{ description = 'open a file manager', group = 'launcher' }
	),
	awful.key(
		{ mod },
		'w',
		function() awful.spawn(browser) end,
		{ description = 'open a browser', group = 'launcher' }
	),

	-- awesome
	awful.key(
		{ mod },
		's',
		function() hotkeys_popup.show_help() end,
		{ description = 'show help', group = 'awesome' }
	),
	awful.key(
		{ mod, ctrl },
		'r',
		awesome.restart,
		{ description = 'reload awesome', group = 'awesome' }
	),
	awful.key(
		{ mod, ctrl },
		'q',
		function()
			awful.spawn.with_shell(powermenu)
		end,
		{ description = 'quit awesome', group = 'awesome' }
	),
	awful.key(
		{ mod, ctrl },
		'l',
		function() awful.spawn 'loginctl lock-session' end,
		{ description = 'lock session', group = 'awesome' }
	),
	-- awful.key({ mod }, "w", function()
	-- 	mymainmenu:show()
	-- end, { description = "show main menu", group = "awesome" }),

	awful.key(
		{ mod },
		'l',
		function() awful.tag.incmwfact(resize_factor) end,
		{ description = 'increase master width factor', group = 'layout' }
	),
	awful.key(
		{ mod },
		'h',
		function() awful.tag.incmwfact(-resize_factor) end,
		{ description = 'decrease master width factor', group = 'layout' }
	),
	awful.key(
		{ mod, shift },
		'h',
		function() awful.tag.incnmaster(1, nil, true) end,
		{
			description = 'increase the number of master clients',
			group = 'layout',
		}
	),
	awful.key(
		{ mod, shift },
		'l',
		function() awful.tag.incnmaster(-1, nil, true) end,
		{
			description = 'decrease the number of master clients',
			group = 'layout',
		}
	),
	awful.key(
		{ mod, ctrl },
		'h',
		function() awful.tag.incncol(1, nil, true) end,
		{ description = 'increase the number of columns', group = 'layout' }
	),
	awful.key(
		{ mod, ctrl },
		'l',
		function() awful.tag.incncol(-1, nil, true) end,
		{ description = 'decrease the number of columns', group = 'layout' }
	),
	awful.key(
		{ mod },
		'Tab',
		function() awful.layout.inc(1) end,
		{ description = 'select next', group = 'layout' }
	),
	awful.key(
		{ mod, shift },
		'Tab',
		function() awful.layout.inc(-1) end,
		{ description = 'select previous', group = 'layout' }
	),

	awful.key(
		{ mod, shift },
		'n',
		function()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal(
					'request::activate',
					'key.unminimize',
					{ raise = true }
				)
			end
		end,
		{ description = 'restore minimized', group = 'client' }),

	awful.key(
		{},
		'XF86MonBrightnessUp',
		function()
			awful.spawn('xbacklight -inc ' .. brightness_step)
		end,
		{ description = '+' .. brightness_step .. '%', group = 'hotkeys' }),
	awful.key(
		{},
		'XF86MonBrightnessDown',
		function()
			awful.spawn('xbacklight -dec ' .. brightness_step)
		end,
		{ description = '-' .. brightness_step .. '%', group = 'hotkeys' }),
	awful.key(
		{},
		'XF86AudioRaiseVolume',
		function()
			awful.spawn('amixer set Master ' .. volume_step .. '%+')
		end,
		{ description = '+' .. volume_step .. '%', group = 'hotkeys' }),
	awful.key(
		{},
		'XF86AudioLowerVolume',
		function()
			awful.spawn('amixer set Master ' .. volume_step .. '%-')
		end,
		{ description = '-' .. volume_step .. '%', group = 'hotkeys' }),
	awful.key(
		{},
		'XF86AudioMute',
		function()
			awful.spawn 'amixer -q set Master toggle'
		end,
		{ description = 'toggle mute', group = 'hotkeys' })


-- Prompt
-- awful.key({ modkey }, "x", function()
--     awful.prompt.run({
--         prompt = "Run Lua code: ",
--         textbox = awful.screen.focused().mypromptbox.widget,
--         exe_callback = awful.util.eval,
--         history_path = awful.util.get_cache_dir() .. "/history_eval",
--     })
-- end, { description = "lua execute prompt", group = "awesome" }),

-- Menubar
-- awful.key({ mod }, "p",
-- 	function()
-- 		menubar.show()
-- 	end,
-- 	{ description = "show the menubar", group = "launcher" })
)

local clientkeys = gears.table.join(
	awful.key({ mod }, 'f', function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = 'toggle fullscreen', group = 'client' }),
	awful.key(
		{ mod },
		'q',
		function(c) c:kill() end,
		{ description = 'close', group = 'client' }
	),
	awful.key(
		{ mod, shift },
		'f',
		function() awful.client.floating.toggle() end,
		{ description = 'toggle floating', group = 'client' }
	),
	awful.key(
		{ mod, shift },
		'Return',
		function(c) c:swap(awful.client.getmaster()) end,
		{ description = 'move to master', group = 'client' }
	),
	awful.key(
		{ mod },
		'o',
		function(c) c:move_to_screen() end,
		{ description = 'move to screen', group = 'client' }
	),
	awful.key(
		{ mod },
		't',
		function(c) c.ontop = not c.ontop end,
		{ description = 'toggle keep on top', group = 'client' }
	),
	-- The client currently has the input focus, so it cannot be
	-- minimized, since minimized clients can't have the focus.
	awful.key(
		{ mod },
		'n',
		function(c) c.minimized = true end,
		{ description = 'minimize', group = 'client' }
	),
	awful.key({ mod }, 'm', function(c)
		c.maximized = not c.maximized
		c:raise()
	end, { description = '(un)maximize', group = 'client' }),
	awful.key({ mod, ctrl }, 'm', function(c)
		c.maximized_vertical = not c.maximized_vertical
		c:raise()
	end, { description = '(un)maximize vertically', group = 'client' }),
	awful.key({ mod, shift }, 'm', function(c)
		c.maximized_horizontal = not c.maximized_horizontal
		c:raise()
	end, { description = '(un)maximize horizontally', group = 'client' })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, #tagkeys do
	local key = tagkeys[i]
	globalkeys = gears.table.join(
		globalkeys, -- View tag only.
		awful.key({ mod }, key, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = 'view tag #' .. i, group = 'tag' }),
		-- Toggle tag display.
		awful.key({ mod, ctrl }, key, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = 'toggle tag #' .. i, group = 'tag' }),
		-- Move client to tag.
		awful.key(
			{ mod, shift },
			key,
			function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:move_to_tag(tag)
					end
				end
			end,
			{ description = 'move focused client to tag #' .. i, group = 'tag' }
		),
		-- Toggle tag on focused client.
		awful.key({ mod, ctrl, shift }, key, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, {
			description = 'toggle focused client on tag #' .. i,
			group = 'tag',
		})
	)
end

local clientbuttons = gears.table.join(
	awful.button(
		{},
		1,
		function(c)
			c:emit_signal('request::activate', 'mouse_click', { raise = true })
		end
	),
	awful.button({ mod }, 1, function(c)
		c:emit_signal('request::activate', 'mouse_click', { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ mod }, 3, function(c)
		c:emit_signal('request::activate', 'mouse_click', { raise = true })
		awful.mouse.client.resize(c)
	end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap
					+ awful.placement.no_offscreen,
		},
	}, -- Floating clients.
	{
		rule_any = {
			instance = {
				'DTA', -- Firefox addon DownThemAll.
				'copyq', -- Includes session name in class.
				'pinentry',
			},
			class = {
				'Arandr',
				'Blueman-manager',
				'Gpick',
				'Kruler',
				'MessageWin', -- kalarm.
				'Sxiv',
				'Tor Browser', -- Needs a fixed window size to avoid fingerprinting by screen size.
				'Wpa_gui',
				'veromix',
				'xtightvncviewer',
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				'Event Tester', -- xev.
			},
			role = {
				'AlarmWindow', -- Thunderbird's calendar.
				'ConfigManager', -- Thunderbird's about:config.
				'pop-up',    -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },
	}, -- Add titlebars to normal clients and dialogs
	{
		rule_any = { type = { 'normal', 'dialog' } },
		properties = { titlebars_enabled = false },
	},

	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- { rule = { class = "Firefox" },
	--   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal('manage', function(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then awful.client.setslave(c) end

	if
			awesome.startup
			and not c.size_hints.user_position
			and not c.size_hints.program_position
	then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal('request::titlebars', function(c)
	-- buttons for the titlebar
	local buttons = gears.table.join(
		awful.button({}, 1, function()
			c:emit_signal('request::activate', 'titlebar', { raise = true })
			awful.mouse.client.move(c)
		end),
		awful.button({}, 3, function()
			c:emit_signal('request::activate', 'titlebar', { raise = true })
			awful.mouse.client.resize(c)
		end)
	)

	awful.titlebar(c):setup {
		{ -- Left
			awful.titlebar.widget.iconwidget(c),
			buttons = buttons,
			layout = wibox.layout.fixed.horizontal,
		},
		{ -- Middle
			{ -- Title
				align = 'center',
				widget = awful.titlebar.widget.titlewidget(c),
			},
			buttons = buttons,
			layout = wibox.layout.flex.horizontal,
		},
		{ -- Right
			awful.titlebar.widget.floatingbutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.stickybutton(c),
			awful.titlebar.widget.ontopbutton(c),
			awful.titlebar.widget.closebutton(c),
			layout = wibox.layout.fixed.horizontal(),
		},
		layout = wibox.layout.align.horizontal,
	}
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal(
	'mouse::enter',
	function(c)
		c:emit_signal('request::activate', 'mouse_enter', { raise = false })
	end
)

client.connect_signal(
	'focus',
	function(c) c.border_color = beautiful.border_focus end
)
client.connect_signal(
	'unfocus',
	function(c) c.border_color = beautiful.border_normal end
)
-- }}}

-- {{{ MY CUSTOM CONFIG
-- Autostart
awful.spawn 'picom'
awful.spawn 'autorandr --change'
-- }}}

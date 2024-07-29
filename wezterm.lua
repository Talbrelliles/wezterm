-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- For example, changing the color scheme:
config.color_scheme = "cyberpunk"
config.font = wezterm.font("MesloLGS NF")
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.window_frame = {
	font = wezterm.font("Roboto"),
	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#3f2d66",

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#3f2d66",
}
config.window_padding = {
	top = 0,
	bottom = 0,
	left = 2,
	right = 0,
}
-- wezterm.on("update-right-status", function(window, pane)
-- 	-- "Wed Mar 3 08:14"
-- 	local date = wezterm.strftime("%a %b %-d %H:%M ")
-- 	window:set_right_status(wezterm.format({
-- 		{ Text = date },
-- 		{ Background = { Color = "#3f2d66" } },
-- 	}))
-- end)
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = "#0b0022"
	local background = "#1b1032"
	local foreground = "#808080"

	if tab.is_active then
		background = "#2b2042"
		foreground = "#c0c0c0"
	elseif hover then
		background = "#3b3052"
		foreground = "#909090"
	end

	local edge_foreground = background

	local title = tab_title(tab)

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - 2)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)
-- BACKGROUND
local dimmer = { brightness = 0.03 }
-- NOTE: Change this to get the images to work
local path = "/home/talmage/.config/wezterm/wilds/"
local possibilities = { "Left", "Right", "Center" }
config.enable_scroll_bar = true
config.background = {
	{
		source = {
			File = path .. "wildspace.png",
		},
		repeat_x = "Mirror",
		hsb = dimmer,
		-- When the viewport scrolls, move this layer 10% of the number of
		-- pixels moved by the main viewport. This makes it appear to be
		-- further behind the text.
		attachment = { Parallax = 0.1 },
	},
	-- The Stranger
	{
		source = {
			File = path .. "stranger.png",
		},
		horizontal_align = "Left",
		repeat_x = "NoRepeat",
		vertical_align = "Bottom",
		repeat_y_size = "300%",
		hsb = dimmer,
		attachment = { Parallax = 0.12 },
	},
	-- White Hole
	{
		source = {
			File = path .. "white.png",
		},
		horizontal_align = "Right",
		repeat_x = "NoRepeat",
		vertical_align = "Bottom",
		repeat_y_size = "300%",
		hsb = dimmer,
		attachment = { Parallax = -0.3 },
	},
	-- Dark Bramble
	{
		source = {
			File = path .. "bramble.png",
		},
		horizontal_align = "Left",
		horizontal_offset = "-10%",

		repeat_x = "NoRepeat",
		vertical_align = "Bottom",
		repeat_y_size = "300%",
		hsb = dimmer,
		attachment = { Parallax = -0.34 },
	},
	--Giants Deep
	{
		source = {
			File = path .. "giant.png",
		},
		horizontal_align = "Right",
		repeat_x = "NoRepeat",
		vertical_align = "Bottom",
		repeat_y_size = "300%",
		hsb = dimmer,
		attachment = { Parallax = -0.2 },
	},
	-- The Interloper
	{
		source = {
			File = path .. "interlope.png",
		},
		horizontal_align = "Right",
		width = "25%",
		height = "25%",
		repeat_x = "NoRepeat",
		vertical_align = "Bottom",
		repeat_y_size = "300%",
		hsb = dimmer,
		attachment = { Parallax = 0.9 },
	},
	-- The Sun
	{
		source = {
			File = path .. "sun.png",
		},
		width = "100%",
		repeat_x = "NoRepeat",
		repeat_y = "NoRepeat",
		vertical_align = "Bottom",
		hsb = dimmer,
		attachment = { Parallax = 0 },
	},
	-- The Twins
	{
		source = {
			File = path .. "twins.png",
		},
		horizontal_align = "Left",
		horizontal_offset = "-70%",
		repeat_x = "NoRepeat",
		vertical_align = "Bottom",
		repeat_y_size = "150%",
		vertical_offset = "-100%",
		hsb = dimmer,
		attachment = { Parallax = 0.9 },
	},
	-- Quantum Moon
	{
		source = {
			File = path .. "moon.png",
		},
		horizontal_align = possibilities[math.random(#possibilities)],
		repeat_x = "NoRepeat",
		vertical_align = "Bottom",
		repeat_y_size = "200%",
		hsb = dimmer,
		attachment = { Parallax = 0.7 },
	},
	--Timber Hearth
	{
		source = {
			File = path .. "timber.png",
		},
		horizontal_align = "Center",
		repeat_x = "NoRepeat",
		vertical_align = "Top",
		repeat_y_size = "300%",
		hsb = dimmer,
		attachment = { Parallax = 0.8 },
	},
	-- Brittle Hollow
	{
		source = {
			File = path .. "brittle.png",
		},
		horizontal_align = "Left",
		horizontal_offset = "30%",
		repeat_x = "NoRepeat",
		vertical_align = "Bottom",
		repeat_y_size = "300%",
		hsb = dimmer,
		attachment = { Parallax = 0.6 },
	},
}

-- KEYS
config.disable_default_key_bindings = true
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1500 }
config.keys = {
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ CopyTo = "Clipboard" }),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ PasteFrom = "Clipboard" }),
	},
	{
		key = "v",
		mods = "LEADER",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "b",
		mods = "LEADER",
		action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action({ ActivatePaneDirection = "Left" }),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action({ ActivatePaneDirection = "Right" }),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action({ ActivatePaneDirection = "Down" }),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action({ ActivatePaneDirection = "Up" }),
	},
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action({ CloseCurrentPane = { confirm = false } }),
	},
	{
		key = ".",
		mods = "LEADER",
		action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }),
	},
	{
		key = ",",
		mods = "LEADER",
		action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }),
	},
	{
		key = "z",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},
	-- TABS
	{
		key = "t",
		mods = "LEADER",
		action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
	},
	{
		key = "x",
		mods = "LEADER",
		action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
	},
	{
		key = "1",
		mods = "LEADER",
		action = wezterm.action({ ActivateTab = 0 }),
	},
	{
		key = "2",
		mods = "LEADER",
		action = wezterm.action({ ActivateTab = 1 }),
	},
	{
		key = "3",
		mods = "LEADER",
		action = wezterm.action({ ActivateTab = 2 }),
	},
	{
		key = "4",
		mods = "LEADER",
		action = wezterm.action({ ActivateTab = 3 }),
	},
	{
		key = "5",
		mods = "LEADER",
		action = wezterm.action({ ActivateTab = 4 }),
	},
	{
		key = "6",
		mods = "LEADER",
		action = wezterm.action({ ActivateTab = 5 }),
	},
	{
		key = "7",
		mods = "LEADER",
		action = wezterm.action({ ActivateTab = 6 }),
	},
	{
		key = "8",
		mods = "LEADER",
		action = wezterm.action({ ActivateTab = 7 }),
	},
	{
		key = "9",
		mods = "LEADER",
		action = wezterm.action({ ActivateTabRelative = -1 }),
	},
	{
		key = "0",
		mods = "LEADER",
		action = wezterm.action({ ActivateTabRelative = 1 }),
	},
	{
		key = "Space",
		mods = "LEADER",
		action = wezterm.action.ActivateCommandPalette,
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.DecreaseFontSize,
	},
	{
		key = "=",
		mods = "LEADER",
		action = wezterm.action.IncreaseFontSize,
	},
	{
		key = "r",
		mods = "LEADER",
		action = wezterm.action.ResetFontSize,
	},
	{
		key = "f",
		mods = "LEADER",
		action = wezterm.action({ Search = { CaseInSensitiveString = "" } }),
	},
}

-- and finally, return the configuration to wezterm
return config

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.default_prog = { "/home/taimase/.nix-profile/bin/fish", "-l" }
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
local path = "/home/taimase/.config/wezterm/wilds/"
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

-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
	LeftArrow = "Left",
	DownArrow = "Down",
	UpArrow = "Up",
	RightArrow = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

wezterm.on("toggle-tabbar", function(window, _)
	local overrides = window:get_config_overrides() or {}
	if overrides.enable_tab_bar == false then
		wezterm.log_info("tab bar shown")
		overrides.enable_tab_bar = true
	else
		wezterm.log_info("tab bar hidden")
		overrides.enable_tab_bar = false
	end
	window:set_config_overrides(overrides)
end)

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
		key = "n",
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
		key = "q",
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
	{ key = "b", mods = "LEADER", action = wezterm.action.EmitEvent("toggle-tabbar") },
	-- -- move between split panes
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	-- resize panes
	split_nav("resize", "LeftArrow"),
	split_nav("resize", "DownArrow"),
	split_nav("resize", "UpArrow"),
	split_nav("resize", "RightArrow"),
	{ key = "x", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
}

local act = wezterm.action

config.key_tables = {
	copy_mode = {
		{ key = "Tab", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
		{
			key = "Tab",
			mods = "SHIFT",
			action = act.CopyMode("MoveBackwardWord"),
		},
		{
			key = "Enter",
			mods = "NONE",
			action = act.CopyMode("MoveToStartOfNextLine"),
		},
		{
			key = "Escape",
			mods = "NONE",
			action = act.Multiple({
				-- { CopyMode = "ScrollToBottom" },
				{ CopyMode = "Close" },
			}),
		},
		{
			key = "Space",
			mods = "NONE",
			action = act.CopyMode({ SetSelectionMode = "Cell" }),
		},
		{
			key = "$",
			mods = "NONE",
			action = act.CopyMode("MoveToEndOfLineContent"),
		},
		{
			key = "$",
			mods = "SHIFT",
			action = act.CopyMode("MoveToEndOfLineContent"),
		},
		{ key = ",", mods = "NONE", action = act.CopyMode("JumpReverse") },
		{ key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
		{ key = ";", mods = "NONE", action = act.CopyMode("JumpAgain") },
		{
			key = "F",
			mods = "NONE",
			action = act.CopyMode({ JumpBackward = { prev_char = false } }),
		},
		{
			key = "F",
			mods = "SHIFT",
			action = act.CopyMode({ JumpBackward = { prev_char = false } }),
		},
		{
			key = "G",
			mods = "NONE",
			action = act.CopyMode("MoveToScrollbackBottom"),
		},
		{
			key = "G",
			mods = "SHIFT",
			action = act.CopyMode("MoveToScrollbackBottom"),
		},
		{ key = "H", mods = "NONE", action = act.CopyMode("MoveToViewportTop") },
		{
			key = "H",
			mods = "SHIFT",
			action = act.CopyMode("MoveToViewportTop"),
		},
		{
			key = "L",
			mods = "NONE",
			action = act.CopyMode("MoveToViewportBottom"),
		},
		{
			key = "L",
			mods = "SHIFT",
			action = act.CopyMode("MoveToViewportBottom"),
		},
		{
			key = "M",
			mods = "NONE",
			action = act.CopyMode("MoveToViewportMiddle"),
		},
		{
			key = "M",
			mods = "SHIFT",
			action = act.CopyMode("MoveToViewportMiddle"),
		},
		{
			key = "O",
			mods = "NONE",
			action = act.CopyMode("MoveToSelectionOtherEndHoriz"),
		},
		{
			key = "O",
			mods = "SHIFT",
			action = act.CopyMode("MoveToSelectionOtherEndHoriz"),
		},
		{
			key = "T",
			mods = "NONE",
			action = act.CopyMode({ JumpBackward = { prev_char = true } }),
		},
		{
			key = "T",
			mods = "SHIFT",
			action = act.CopyMode({ JumpBackward = { prev_char = true } }),
		},
		{
			key = "V",
			mods = "NONE",
			action = act.CopyMode({ SetSelectionMode = "Line" }),
		},
		{
			key = "V",
			mods = "SHIFT",
			action = act.CopyMode({ SetSelectionMode = "Line" }),
		},
		{
			key = "^",
			mods = "NONE",
			action = act.CopyMode("MoveToStartOfLineContent"),
		},
		{
			key = "^",
			mods = "SHIFT",
			action = act.CopyMode("MoveToStartOfLineContent"),
		},
		{ key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },
		{ key = "b", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
		{ key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
		{
			key = "c",
			mods = "CTRL",
			action = act.Multiple({
				-- { CopyMode = "ScrollToBottom" },
				{ CopyMode = "Close" },
			}),
		},
		{
			key = "d",
			mods = "CTRL",
			action = act.CopyMode({ MoveByPage = 0.5 }),
		},
		{
			key = "e",
			mods = "NONE",
			action = act.CopyMode("MoveForwardWordEnd"),
		},
		{
			key = "f",
			mods = "NONE",
			action = act.CopyMode({ JumpForward = { prev_char = false } }),
		},
		{ key = "f", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
		{ key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },
		{
			key = "g",
			mods = "NONE",
			action = act.CopyMode("MoveToScrollbackTop"),
		},
		{
			key = "g",
			mods = "CTRL",
			action = act.Multiple({
				-- { CopyMode = "ScrollToBottom" },
				{ CopyMode = "Close" },
			}),
		},
		{ key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
		{ key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
		{ key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
		{ key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },
		{
			key = "m",
			mods = "ALT",
			action = act.CopyMode("MoveToStartOfLineContent"),
		},
		{
			key = "o",
			mods = "NONE",
			action = act.CopyMode("MoveToSelectionOtherEnd"),
		},
		{
			key = "q",
			mods = "NONE",
			action = act.Multiple({
				-- { CopyMode = "ScrollToBottom" },
				{ CopyMode = "Close" },
			}),
		},
		{
			key = "t",
			mods = "NONE",
			action = act.CopyMode({ JumpForward = { prev_char = true } }),
		},
		{
			key = "u",
			mods = "CTRL",
			action = act.CopyMode({ MoveByPage = -0.5 }),
		},
		{
			key = "v",
			mods = "NONE",
			action = act.CopyMode({ SetSelectionMode = "Cell" }),
		},
		{
			key = "v",
			mods = "CTRL",
			action = act.CopyMode({ SetSelectionMode = "Block" }),
		},
		{ key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
		{
			key = "y",
			mods = "NONE",
			action = act.Multiple({
				{ CopyTo = "ClipboardAndPrimarySelection" },
				-- { CopyMode = "ScrollToBottom" },
				{ CopyMode = "Close" },
			}),
		},
		{ key = "PageUp", mods = "NONE", action = act.CopyMode("PageUp") },
		{ key = "PageDown", mods = "NONE", action = act.CopyMode("PageDown") },
		{
			key = "End",
			mods = "NONE",
			action = act.CopyMode("MoveToEndOfLineContent"),
		},
		{
			key = "Home",
			mods = "NONE",
			action = act.CopyMode("MoveToStartOfLine"),
		},
		{ key = "LeftArrow", mods = "NONE", action = act.CopyMode("MoveLeft") },
		{
			key = "LeftArrow",
			mods = "ALT",
			action = act.CopyMode("MoveBackwardWord"),
		},
		{
			key = "RightArrow",
			mods = "NONE",
			action = act.CopyMode("MoveRight"),
		},
		{
			key = "RightArrow",
			mods = "ALT",
			action = act.CopyMode("MoveForwardWord"),
		},
		{ key = "UpArrow", mods = "NONE", action = act.CopyMode("MoveUp") },
		{ key = "DownArrow", mods = "NONE", action = act.CopyMode("MoveDown") },
	},
}

return config

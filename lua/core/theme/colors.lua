local M = {}

M.my_colors = {
	-- Foundation & UI (absolute night)
	fg             = "#b8c1ec",
	bg             = "#0f111a",
	bg_dim         = "#0b0d14",
	bg_alt         = "#131625",
	grey_soft      = "#6f7899",
	grey_comment   = "#3f4663",
	silver         = "#8f96b3",
	gold           = "#b79a6a",
	selection      = "#1a1f33",
	visual         = "#22284a",

	-- Reds & Pinks (deep, restrained)
	red            = "#e06c75",
	red_deep       = "#b84a4a",
	deep_blood     = "#6b1010",
	night_abyss    = "#3b0a0a",
	void_red       = "#240505",
	burgundy       = "#6e2f44",
	pink_soft      = "#c27c8c",
	magenta        = "#9d8bd6",
	magenta_bright = "#8c6fd1",
	rose           = "#b0485f",

	-- Yellows & Oranges (low luminance)
	yellow         = "#b79a6a",
	orange         = "#d88a5a",
	orange_burnt   = "#b06a44",
	tan            = "#b8a58a",
	brown          = "#65422e",
	peach          = "#c99a82",
	amber          = "#c07a4a",

	-- Blues (dark-marine core)
	blue_sky       = "#6bb3d6",
	blue_cyan      = "#5fa8c9",
	blue_accent    = "#6c82c7",
	turquoise      = "#2b8fa3",
	teal           = "#1f7f8a",
	blue_electric  = "#5c6fae",

	-- Marine additions (NEW)
	marine_ink     = "#0b1c2d",
	marine_deep    = "#102a43",
	marine_teal    = "#163a3f",
	marine_mist    = "#2a4b5e",
	naval_green    = "#1f3d34",
	abyss_blue     = "#081624",

	-- Greens (submerged, not fresh)
	green_lime     = "#8fb573",
	green_main     = "#6fa67a",
	green_vibrant  = "#4b8f8a",
	green_deep     = "#1f6b5a",
	emerald        = "#1e8a63",

	-- Purples (inked)
	purple_light   = "#9b8ccf",
	purple_tokyo   = "#8e7cc9",
	purple_deep    = "#6b5a99",
	violet         = "#7d6bd1",

	-- blur 
	blur_bg       = "#0b0f1a",
	blur_float    = "#101528",
	blur_border   = "#1b2038",
	blur_overlay  = "#151a2e",

	-- Foreground ladder (NEW)
	fg_bright      = "#d7defa", -- titles, active labels
	fg_main        = "#c7cff2", -- primary text
	fg_soft        = "#aab3d6", -- secondary text
	fg_muted       = "#8b93b3", -- inactive, hints
	fg_faint       = "#6e7599", -- comments / subtle UI

	-- cool light
	ice_blue       = "#bcd6ff", -- crisp but not neon
	frost_blue     = "#9fb7e8",
	mist_cyan      = "#9acbd3",
	soft_sky       = "#a7c0e8",

	-- soft purple
	lavender_ink   = "#c1b6f3",
	violet_glow    = "#b3a5f2",
	plum_soft      = "#a896d8",

	-- marine light
	marine_light   = "#8fb2c9",
	marine_silver  = "#9bb8cc",
	marine_fog     = "#7f9db3",

	-- warm light
	sand_light     = "#d8c8a8",
	amber_soft     = "#e0b68a",
	peach_light    = "#dcb09a",

	-- Soft blues (subtle, for float windows, panels)
	blue_soft        = "#7da7d9",  -- gentle, muted, readable
	blue_mist        = "#86aedd",  -- light, slightly cool
	blue_light_bg    = "#9ac4e2",  -- good for subtle highlights on dark bg

	-- 2. Normal / Primary blues (text, icons, or active elements)
	blue_normal      = "#6bb3d6",  -- matches your existing blue_sky
	blue_main        = "#5fa8c9",  -- matches blue_cyan
	blue_mid         = "#558fc1",  -- slightly darker, for contrast

	-- 3. Accent blues (links, selection, buttons)
	blue_ice         = "#a0c4ff",  -- soft, frosty, works with fg_bright

	-- blue type
	type_blue = "#65bcff",

	-- light colors for 12 colors
    light_red      = "#e7949e",
    light_burgundy = "#a06070",
    light_orange   = "#e0aa7c",
    light_yellow   = "#f0d18c",
    light_green    = "#8fd4a0",
    light_teal     = "#6fc2c8",
    light_blue     = "#8fc3f2",
    light_marine   = "#5c7fa1",
    light_purple   = "#bfa6f0",
    light_magenta  = "#ab90e0",
    light_silver   = "#c0c6e0",
    light_ice      = "#a6d0f5",


	-- the abyss
	-- black
	abyss_black_bg    = "#050505",
	abyss_black_fg    = "#323232",

	-- Red
	abyss_red_bg      = "#240505",
	abyss_red_fg      = "#ff4444",

	-- Green
	abyss_green_bg    = "#052405",
	abyss_green_fg    = "#50ff50",

	-- Yellow
	abyss_yellow_bg   = "#242405",
	abyss_yellow_fg   = "#ffff50",

	-- Blue
	abyss_blue_bg     = "#050524",
	abyss_blue_fg     = "#5050ff",

	-- Magenta
	abyss_magenta_bg  = "#240524",
	abyss_magenta_fg  = "#ff50ff",

	-- Cyan
	abyss_cyan_bg     = "#052424",
	abyss_cyan_fg     = "#50ffff",

	-- White
	abyss_white_bg    = "#1a1a1a",
	abyss_white_fg    = "#eeeeee",
}

return M

--Refer to the wiki for more information.
--https://wiki.hyprland.org/Configuring

--Please note not all available settings / options are set here.
--For a full list, see the wiki

-- Rose pine moon's color scheme

local base = 0xff232136
local surface = 0xff2a273f
local overlay = 0xff393552
local muted = 0xff6e6a86
local subtle = 0xff908caa
local text = 0xffe0def4
local love = 0xffeb6f92
local gold = 0xfff6c177
local rose = 0xffea9a97
local pine = 0xff3e8fb0
local foam = 0xff9ccfd8
local iris = 0xffc4a7e7
local highlightLow = 0xff2a283e
local highlightMed = 0xff44415a
local highlightHigh = 0xff56526e

--[[
################
### MONITORS ###
################
--]]

hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@100",
	position = "0x0",
	scale = 1,
})

--[[
###################
### MY PROGRAMS ###
###################
--]]

--========================== APP VARIABLES =========================
--Set programs that you use

local terminal = "~/dotfiles/hypr/.config/hypr/open_terminal.sh"
local musicScript = "~/dotfiles/hypr/.config/hypr/music.sh"
local musicSelector =
	"pgrep rofi > /dev/null 2>&1 && killall rofi || rofi -modi drun -show drun -p \"Music\" -theme-str 'inputbar {enabled: false;} listview {border: 0; padding: 0;}' -filter 'Music ' -no-fixed-num-lines"
local tidal =
	"pgrep tidal-hifi > /dev/null 2>&1 && hyprctl dispatch 'hl.dsp.workspace.toggle_special(\"tidal\")' || tidal-hifi"
local ytmusic =
	"hyprctl clients | grep YouTube Music > /dev/null 2>&1 && hyprctl dispatch 'hl.dsp.workspace.toggle_special(\"music.youtube\")' || youtube-music-desktop-app"
local fileManager =
	"pgrep nautilus > /dev/null 2>&1 && hyprctl dispatch 'hl.dsp.focus({ window = \"class:^(org.gnome.Nautilus)$\"})' | grep ok || nautilus"
local browser =
	"pgrep librewolf > /dev/null 2>&1 && hyprctl dispatch 'hl.dsp.focus({ window = \"class:^(librewolf)$\" })' | grep ok || librewolf"
local screenshot = "grim"
local passwordManager = "keepassxc"
local menu = "pgrep rofi > /dev/null 2>&1 && killall rofi || rofi -show drun"
local internetSearch = "~/dotfiles/hypr/.config/hypr/rofisearch.sh"
local emojis =
	'pgrep rofi > /dev/null 2>&1 && killall rofi || rofi -modi emoji -show emoji -kb-secondary-copy "" -kb-custom-1 Return -kb-accept-entry Ctrl+C'
local volumecontrol =
	"pgrep pwvucontrol > /dev/null 2>&1 && hyprctl dispatch 'hl.dsp.workspace.toggle_special(\"volumecontrol\")' || pwvucontrol"
local easyeffects =
	"pgrep easyeffects > /dev/null 2>&1 && hyprctl dispatch 'hl.dsp.workspace.toggle_special(\"audio\")' || easyeffects"
local obs = "pgrep obs > /dev/null 2>&1 && hyprctl dispatch 'hl.dsp.workspace.toggle_special(\"obs\")' || obs"

--==================================================================

--=========================== AUTOSTART ============================
--Autostart necessary processes (like notifications daemons, status bars, etc.)

hl.on("hyprland.start", function()
	hl.exec_cmd("ddcutil setvcp 10 --display 1 100")
	hl.exec_cmd("solaar --window-hide")
	hl.exec_cmd("waybar & hyprpaper & hypridle")
	hl.exec_cmd("hyprpm reload")
	hl.exec_cmd("[workspace special:audio silent] easyeffects")
	hl.exec_cmd("[workspace special:volumecontrol silent] pwvucontrol")
end)

--==================================================================

--==================== ENVIRONMENT VARIABLES =======================
--See https://wiki.hyprland.org/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

--==================================================================

--======================== LOOK AND FEEL ===========================
--Refer to https://wiki.hyprland.org/Configuring/Basics/Variables/

hl.config({
	general = {
		gaps_in = 2.5,
		gaps_out = 5,
		float_gaps = 10,

		border_size = 2,

		col = { active_border = 0xffffffff, inactive_border = 0xff4d4d4d },

		resize_on_border = false,

		allow_tearing = false,

		layout = "master",
	},

	-- master = {
	-- enabled = true,
	-- workspace_wraparound = true,
	-- },

	decoration = {
		rounding = 5,

		active_opacity = 1.0,
		inactive_opacity = 0.75,

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
		workspace_wraparound = true,
	},

	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = true,
	},
	ecosystem = {
		no_update_news = true,
		no_donation_nag = true,
	},
	input = {
		kb_layout = "us",
		accel_profile = "flat",

		follow_mouse = 1,
		scroll_factor = 1,

		sensitivity = 0,

		touchpad = {
			natural_scroll = false,
		},
	},

	binds = {
		hide_special_on_workspace_change = true,
		focus_preferred_method = 1,
	},
	cursor = {
		no_warps = true,
	},
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})
--==================================================================

--========================= ANIMATIONS =============================
--Refer to https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "default" })

--==================================================================

--========================= KEYBINDINGS ============================
--Refer to https://wiki.hypr.land/Configuring/Basics/Binds/

local mainMod = "SUPER"

--Quick access to some apps and commands
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(easyeffects))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(musicScript))
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd(musicSelector))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(tidal))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(ytmusic))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(screenshot))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(passwordManager))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(volumecontrol))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(obs))
hl.bind(mainMod .. " + SHIFT + Space", hl.dsp.exec_cmd(emojis))
hl.bind(mainMod .. " + CTRL + Space", hl.dsp.exec_cmd(internetSearch))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(
	mainMod .. " + SHIFT + E",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd("shutdown -h now"))

--Switching the window's mode
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + V", hl.dsp.window.float())
hl.bind(mainMod .. " + W", hl.dsp.window.cycle_next())

--Cycle through workspaces with $mainMod + HJKL
hl.bind(mainMod .. " + H", hl.dsp.focus({ workspace = "e-1" }), { repeating = true })
hl.bind(mainMod .. " + J", hl.dsp.focus({ workspace = "m~2147483647" }), { repeating = true })
hl.bind(mainMod .. " + K", hl.dsp.focus({ workspace = 1 }), { repeating = true })
hl.bind(mainMod .. " + L", hl.dsp.focus({ workspace = "e+1" }), { repeating = true })

--Change focus with $mainMod + CTRL + HJKL
hl.bind(mainMod .. " + CTRL + H", hl.dsp.focus({ direction = "left" }), { repeating = true })
hl.bind(mainMod .. " + CTRL + J", hl.dsp.focus({ direction = "down" }), { repeating = true })
hl.bind(mainMod .. " + CTRL + K", hl.dsp.focus({ direction = "up" }), { repeating = true })
hl.bind(mainMod .. " + CTRL + L", hl.dsp.focus({ direction = "right" }), { repeating = true })

--Move the currently focused window with $mainMod + ALT + HJKL
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.move({ direction = "left" }), { repeating = true })
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.move({ direction = "down" }), { repeating = true })
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.move({ direction = "up" }), { repeating = true })
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.move({ direction = "right" }), { repeating = true })

--Resize the currently focused window with $mainMod + CTRL + ALT + HJKL
hl.bind(mainMod .. " + CTRL + ALT + H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + ALT + J", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + ALT + K", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + ALT + L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })

--Move active window to a workspace with $mainMod + SHIFT + HJKL
hl.bind(mainMod .. " + SHIFT + H", function()
	hl.dispatch(hl.dsp.window.move({ workspace = "r-1" }), { repeating = true })
	hl.dispatch(hl.dsp.window.move({ direction = "right" }), { repeating = true })
end)

hl.bind(mainMod .. " + SHIFT + L", function()
	hl.dispatch(hl.dsp.window.move({ workspace = "r+1" }), { repeating = true })
	hl.dispatch(hl.dsp.window.move({ direction = "left" }), { repeating = true })
end)

hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ workspace = "empty" }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ workspace = 1 }), { repeating = true })

for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0

	--Switch workspaces with $mainMod + [0-9]
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))

	--Move active window to a workspace with $mainMod + SHIFT + [0-9]
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

--Multimedia keys for volume and screen brightness
hl.bind(
	"SHIFT + XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%+ -l 1"),
	{ locked = true, repeating = true }
)
hl.bind(
	"SHIFT + XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%- -l 1"),
	{ locked = true, repeating = true }
)
hl.bind(
	mainMod .. " + XF86AudioLowerVolume",
	hl.dsp.exec_cmd("playerctl previous"),
	{ locked = true, repeating = true }
)
hl.bind(mainMod .. " + XF86AudioRaiseVolume", hl.dsp.exec_cmd("playerctl next"), { locked = true, repeating = true })
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+ -l 1"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%- -l 1"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(mainMod .. " + XF86AudioMute", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, repeating = true })
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, repeating = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })
hl.bind("XF86Sleep", hl.dsp.exec_cmd("hyprlock && systemctl suspend"), { locked = true, repeating = true })

--MOUSE BINDS
--Scroll through existing workspaces with $mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

--Move/resize windows with $mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize({ keep_aspect_ratio = true }), { mouse = true })
hl.bind(mainMod .. " + SHIFT + mouse:273", hl.dsp.window.resize(), { mouse = true })

--==================================================================

--==================== WINDOWS AND WORKSPACES ======================
--Refer to https://wiki.hypr.land/Configuring/Basics/Window-Rules/
--And to https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/ for workspace rules

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

--Automatically open the music apps, Easy Effects, OBS, and Pwvucontrol to their own special workspaces
hl.window_rule({ match = { class = "^(tidal-hifi)$" }, workspace = "special:tidal" })
hl.window_rule({ match = { initial_title = "Youtube Music.*" }, workspace = "special:music.youtube" })
hl.window_rule({ match = { class = "^(com.github.wwmm.easyeffects)$" }, workspace = "special:audio" })
hl.window_rule({ match = { class = "^(com.saivert.pwvucontrol)$" }, workspace = "special:volumecontrol" })
hl.window_rule({ match = { class = "^(com.obsproject.Studio)$" }, workspace = "special:obs" })

--Make it so the Password Manager acts like a pop-up from the taskbar
hl.window_rule({
	name = "Password-Manager",
	match = {
		class = "^(org.keepassxc.KeePassXC)$",
	},
	float = true,
	pin = true,
	size = { 940, 500 },
	move = {
		"((monitor_w*1)-window_w-12)",
		"((monitor_h*1)-window_h-57)",
	},
})

--[[
    Make it so LibreWolf's Picture-in-Picture is set to the top right of the screen,
    and pin it so it follows you to whatever workspace you go to
    also make it's opacity always at 100%, whether focused or not.
--]]
hl.window_rule({
	name = "Picture-in-Picture",
	match = {
		title = "^(Picture-in-Picture)$",
	},

	float = true,
	pin = true,
	no_initial_focus = true,
	size = { 640, 360 },
	move = {
		"((monitor_w*1)-window_w-12)",
		12,
	},
	opacity = "1.0 override",
})

--Same for scrcpy (this is more useful if you do Android app development)
hl.window_rule({
	name = "Scrcpy",
	match = {
		class = "^(scrcpy)$",
	},

	float = true,
	pin = true,
	no_initial_focus = true,
	size = { 800, 360 },
	move = {
		"((monitor_w*1)-window_w-12)",
		12,
	},
	opacity = "1.0 override",
})

hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)
--==================================================================

if hl.plugin.dynamic_cursors then
	hl.config({
		plugin = {
			dynamic_cursors = {

				enabled = true,

				mode = "none",

				shake = {

					enabled = true,

					threshold = 5.0,

					base = 4.0,

					speed = 4.0,

					influence = 0.0,

					limit = 5.0,

					timeout = 1500,
				},

				hyprcursor = {

					nearest = true,

					enabled = false,

					resolution = 4,

					fallback = "clientside",
				},
			},
		},
	})
end

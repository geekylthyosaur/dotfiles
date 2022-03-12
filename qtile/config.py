import os, subprocess

from typing import List

from libqtile import bar, layout, widget, hook, extension
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal


mod = "mod4"
terminal = guess_terminal()

colors = {
    'black': '#282828', #282828
    'red': '#ff5555', #ff5555
    'green': '#66cc66', #66cc66
    'yellow': '#f0e060', #f0e060
    'blue': '#7daee3', #7daee3
    'magenta': '#ffaabb', #ffaabb
    'cyan': '#99ffff', #99ffff
    'white': '#fbf1c7', #fbf1c7
}

@hook.subscribe.startup_once
def autostart():
	home = os.path.expanduser('~/.config/qtile/autostart.sh')
	subprocess.run([home])

keys = [
	Key([mod], "h", 
		lazy.layout.left(), 
		desc="Move focus to left"),
	Key([mod], "l", 
		lazy.layout.right(), 
		desc="Move focus to right"),
	Key([mod], "j", 
		lazy.layout.down(), 
		desc="Move focus down"),
	Key([mod], "k", 
		lazy.layout.up(), 
		desc="Move focus up"),
	Key([mod], "c", 
		lazy.next_layout(),
		desc="Move window focus to other window"),
	Key([mod, "shift"], "h", 
		lazy.layout.shuffle_left(),
		desc="Move window to the left"),
	Key([mod, "shift"], "l", 
		lazy.layout.shuffle_right(),
		desc="Move window to the right"),
	Key([mod, "shift"], "j", 
		lazy.layout.shuffle_down(),
		desc="Move window down"),
	Key([mod, "shift"], "k", 
		lazy.layout.shuffle_up(), 
		desc="Move window up"),
	Key([mod, "control"], "h", 
		lazy.layout.grow_left(),
		desc="Grow window to the left"),
	Key([mod, "control"], "l", 
		lazy.layout.grow_right(),
		desc="Grow window to the right"),
	Key([mod, "control"], "j", 
		lazy.layout.grow_down(),
		desc="Grow window down"),
	Key([mod, "control"], "k", 
		lazy.layout.grow_up(), 
		desc="Grow window up"),
	Key([mod], "n", 
		lazy.layout.normalize(), 
		desc="Reset all window sizes"),
	Key([mod, "shift"], "Return", 
		lazy.layout.toggle_split(),
		desc="Toggle between split and unsplit sides of stack"),
	Key([mod], "Return", 
		lazy.spawn(terminal), 
		desc="Launch terminal"),
	Key([mod], "Tab", 
		lazy.layout.next(), 
		desc="Toggle between layouts"),
	Key([mod, "shift"], "q", 
		lazy.window.kill(), 
		desc="Kill focused window"),
	Key([mod, "shift"], "r", 
		lazy.reload_config(), 
		desc="Reload the config"),
	Key([mod, "control", "mod1"], "q", 
		lazy.shutdown(), 
		desc="Shutdown Qtile"),
	Key([mod], "d",
		lazy.run_extension(extension.DmenuRun(
			dmenu_bottom=True,
			fontsize=10,
			dmenu_prompt=">",
	        background=colors['black'],
		    foreground=colors['white'],
	        selected_background=colors['red'],
	        selected_foreground=colors["black"],
		)), 
		desc="Spawn a command using a prompt widget"),
	Key([mod], "f",
		lazy.window.toggle_fullscreen(),
		desc='Toggle fullscreen'),
	Key([mod, "shift"], "f",
		lazy.window.toggle_floating(),
		desc='Toggle fullscreen'),
	Key([mod], "space",
		lazy.widget["keyboardlayout"].next_keyboard(),
		desc='Toggle language'),
	Key([], "XF86AudioMute", 
		lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"),
		desc="Mute audio"),
	Key([], "XF86AudioMicMute", 
		lazy.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle"),
		desc="Mute micro"),
	Key([], "XF86AudioLowerVolume", 
		lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -2%"),
		desc="Lower volume"),
	Key([], "XF86AudioRaiseVolume", 
		lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +2%"),
		desc="Raise volume"),
	Key([], "XF86MonBrightnessDown", 
		lazy.spawn("sh /home/dmytro/scripts/brightness.sh decrease"),
		desc="Lower brightness"),
	Key([], "XF86MonBrightnessUp", 
		lazy.spawn("sh /home/dmytro/scripts/brightness.sh increase"),
		desc="Raise brightness"),
    Key([], "Print",
        lazy.spawn('flameshot gui'),
        desc="Take screenshot"),
    Key([mod, "control"], "s",
        lazy.spawn("systemctl suspend"),
        desc="Suspend"),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
	keys.extend([
		
		Key([mod], i.name, 
			lazy.group[i.name].toscreen(),
			desc="Switch to group {}".format(i.name)),
		Key([mod, "shift"], i.name, 
			lazy.window.togroup(i.name, switch_group=True),
			desc="Switch to & move focused window to group {}".format(i.name)),
	])

layouts = [
	layout.Columns(
		border_focus_stack=['#000000', '#ffffff'], 
		border_width=0,
		margin=5,
		margin_on_single=0,
	),
	#layout.Max(),
	#layout.Stack(num_stacks=2),
	#layout.Bsp(),
	#layout.Matrix(),
	#layout.MonadTall(),
	#layout.MonadWide(),
	#layout.RatioTile(),
	#layout.Tile(),
	#layout.TreeTab(),
	#layout.VerticalTile(),
	#layout.Zoomy(),
]

widget_defaults = dict(
	font='Source Code Pro Semibold',
    fontshadow=None,
	fontsize=13,
)

extension_defaults = dict(
	font='Source Code Pro Semibold',
	fontsize=13,	
)

bar_height = 20
bar_opacity = 1
bar_margin = 0

widgets_foreground = colors['black']
arrow_char = '◢'
back_arrow_char = '◤'

groupbox_widget_background = colors['red']
keyboard_background = colors['green']
battery_background = colors['blue']
volume_background = colors['yellow']
brightness_background = colors['cyan']
clock_background = colors['magenta']


groupbox_widget = [
	widget.GroupBox(
		margin_y = 4,
		margin_x = 0,
		padding_y = 5,
		padding_x = 3,
		borderwidth = 3,
		active = colors['white'],
		inactive = colors['black'],
		highlight_color = groupbox_widget_background,
		highlight_method="line",
		this_current_screen_border = colors['black'],
		this_screen_border = colors ['white'],
		other_current_screen_border = colors['white'],
		other_screen_border = colors['white'],
		foreground = widgets_foreground,
		background = groupbox_widget_background,
		urgent_alert_method = 'text',
		urgent_text = "#ff0000",
	),
	widget.TextBox(
		text = back_arrow_char,
		background = colors['black'],
		foreground = groupbox_widget_background,
		padding = -1,
		fontsize = 40,
	),
]

prompt_widget = [
	widget.Prompt(
		foreground = colors['white'],
		background=colors['black'],
		padding=10,
		prompt=">>> ",
	),
]

window_name_widget = [
	widget.WindowName(
		background = colors['black'],
		foreground = colors['white'],
		format = "{name}",
		max_chars=55,
	),
]

spacer_widget = [
	widget.Spacer(
		background=colors['black'],
	),
]

systray_widget = [
	widget.Systray(),
]

wallpaper_widget = [
	widget.Wallpaper(
		directory="/home/dmytro/pictures/wallpapers/",
        wallpaper='/home/dmytro/pictures/wallpapers/f1',
		random_selection=False,
		label="",
	),
]

keyboard_layout_widget = [
	widget.TextBox(
		text = arrow_char,
		background = colors['black'],
		foreground = keyboard_background,
		padding = -1,
		fontsize = 40,
	),
	widget.KeyboardLayout(
		background = keyboard_background,
		foreground = widgets_foreground,
		configured_keyboards=["us", "ua"],
	),
]

battery_widget = [	
	widget.TextBox(
		text = arrow_char,
		background = keyboard_background,
		foreground = battery_background,
		padding = -1,
		fontsize = 40,
	),
	widget.Battery(
		background = battery_background,
		foreground = widgets_foreground,
		padding = 0,
		unknown_char='AC',
		format="⚡ {percent:2.0%}",
		update_interval=20,
	),
]

volume_widget = [
	widget.TextBox(
		text = arrow_char,
		background = battery_background,
		foreground = volume_background,
		padding = -1,
		fontsize = 40,
	),
	widget.PulseVolume(
		background = volume_background,
		foreground = widgets_foreground,
		padding = 0,
		device="@DEFAULT_SINK@",
		get_volume_command="get-sink-volume",
		volume_app="pactl",
		fmt="🔈 {}",
	),
]

brightness_widget = [
	widget.TextBox(
		text = arrow_char,
		background = volume_background,
		foreground = brightness_background,
		padding = -1,
		fontsize = 40,
	),
	widget.Backlight(
		background = brightness_background,
		foreground = widgets_foreground,
		padding = 0,
		backlight_name="amdgpu_bl0",
		format="🔆 {percent:2.0%}",
	)
]

clock_widget = [
	widget.TextBox(
		text = arrow_char,
		background = brightness_background,
		foreground = clock_background,
		padding = -1,
		fontsize = 40,
	),
	widget.Clock(
		background = clock_background,
		foreground = widgets_foreground,
		padding = 10,
		format='%Y %m %d %a %H:%M:%S',
	),
]

screens = [
	Screen(
		bottom=bar.Bar(
			groupbox_widget
			+ prompt_widget
			+ window_name_widget
			+ wallpaper_widget
			+ keyboard_layout_widget
			+ battery_widget
			+ volume_widget
			+ brightness_widget
			+ clock_widget,
			bar_height,
            opacity=bar_opacity,
            border_width=[0,10,0,10],
            border_color=["000000", clock_background, "000000", groupbox_widget_background],
            margin=bar_margin,
		),
	),
]

mouse = [
	Drag([mod], "Button1", lazy.window.set_position_floating(),
		 start=lazy.window.get_position()),
	Drag([mod], "Button3", lazy.window.set_size_floating(),
		 start=lazy.window.get_size()),
	Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
floating_layout = layout.Floating(float_rules=[
	*layout.Floating.default_float_rules,
	Match(wm_class='confirmreset'),
	Match(wm_class='makebranch'),
	Match(wm_class='maketag'),
	Match(wm_class='ssh-askpass'),
	Match(title='branchdialog'),
	Match(title='pinentry'),
])
auto_fullscreen = True
focus_on_window_activation = "never"
reconfigure_screens = True

auto_minimize = True

wmname = "LG3D"

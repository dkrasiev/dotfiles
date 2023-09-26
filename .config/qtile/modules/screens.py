from libqtile import bar, qtile, widget
from libqtile.config import Screen

from .config import terminal
from .user import spawn_powermenu
from .widgets import volume

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(padding=3, linewidth=0, background="#2f343f"),
                widget.Image(
                    filename="~/.config/qtile/eos-c.png",
                    margin=3,
                    background="#2f343f",
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn("rofi -show combi")
                    },
                ),
                widget.Sep(padding=4, linewidth=0, background="#2f343f"),
                widget.GroupBox(
                    highlight_method="line",
                    this_screen_border="#5294e2",
                    this_current_screen_border="#5294e2",
                    active="#ffffff",
                    inactive="#848e96",
                    background="#2f343f",
                ),
                widget.TextBox(text="", padding=0, fontsize=28, foreground="#2f343f"),
                widget.Prompt(),
                widget.Spacer(length=5),
                widget.WindowName(foreground="#99c0de", fmt="{}"),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.CurrentLayoutIcon(scale=0.75),
                widget.CheckUpdates(
                    update_interval=1800,
                    distro="Arch_yay",
                    display_format="{updates} Updates",
                    foreground="#ffffff",
                    mouse_callbacks={
                        "Button1": lambda: qtile.cmd_spawn(terminal + " -e paru")
                    },
                    background="#2f343f",
                ),
                widget.Systray(icon_size=20),
                widget.TextBox(text="", padding=0, fontsize=28, foreground="#2f343f"),
                volume,
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=28,
                    foreground="#2f343f",
                ),
                widget.TextBox(text="", padding=0, fontsize=28, foreground="#2f343f"),
                widget.Clock(
                    format="󰥔 %Y-%m-%d %a %I:%M %p",
                    background="#2f343f",
                    foreground="#9bd689",
                ),
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=28,
                    foreground="#2f343f",
                ),
                widget.TextBox(
                    text="",
                    mouse_callbacks={
                        "Button1": lambda: spawn_powermenu(),
                    },
                    foreground="#e39378",
                ),
            ],
            30,  # height in px
            background="#404552",  # background color
        ),
    ),
]

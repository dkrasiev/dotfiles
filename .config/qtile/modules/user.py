import os

from libqtile import qtile
from libqtile.lazy import lazy

from .config import terminal

launcher = "rofi -show combi"
powermenu_path = os.path.expanduser("~/.config/rofi/powermenu.sh")


def spawn_launcher_lazy():
    return lazy.spawn(launcher)


def spawn_terminal_lazy():
    return lazy.spawn(terminal)


def spawn_powermenu_lazy():
    return lazy.spawn(powermenu_path)


def spawn_powermenu():
    return qtile.cmd_spawn(powermenu_path)

from libqtile.config import Match

# from libqtile.layout.columns import Columns
from libqtile.layout.floating import Floating

# from libqtile.layout.matrix import Matrix
from libqtile.layout.max import Max

# from libqtile.layout.ratiotile import RatioTile
# from libqtile.layout.slice import Slice
# from libqtile.layout.spiral import Spiral
# from libqtile.layout.stack import Stack
# from libqtile.layout.tile import Tile
# from libqtile.layout.tree import TreeTab
# from libqtile.layout.verticaltile import VerticalTile
from libqtile.layout.xmonad import MonadTall

# from libqtile.layout.bsp import Bsp


# from libqtile.layout.zoomy import Zoomy

layouts = [
    MonadTall(margin=8, border_focus="#5294e2", border_normal="#2c5380"),
    # layout.Columns(border_focus_stack='#d75f5f'),
    Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # Zoomy(),
]

floating_layout = Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

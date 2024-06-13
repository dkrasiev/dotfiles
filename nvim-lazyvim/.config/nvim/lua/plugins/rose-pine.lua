return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    dependencies = {
      {
        'rcarriga/nvim-notify',
        optional = true,
        opts = {
          background_colour = '#000000',
        },
      },
    },
    opts = {
      styles = {
        transparency = true,
      },
    },
  },
}

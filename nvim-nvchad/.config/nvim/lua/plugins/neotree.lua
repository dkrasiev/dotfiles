return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mapping = {
        ["<S-CR>"] = "system_open",
        ["<Space>"] = false, -- disable space until we figure out which-key disabling
        ["[b"] = "prev_source",
        ["]b"] = "next_source",
        O = "system_open",
        Y = "copy_selector",
        h = "parent_or_close",
        l = "child_or_open",
      },
    },
  },
}

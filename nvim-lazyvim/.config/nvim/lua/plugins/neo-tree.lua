return {
  "nvim-neo-tree/neo-tree.nvim",
  optional = true,
  opts = {
    default_component_configs = {
      container = {
        enable_character_fade = false,
      },
      -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
      file_size = {
        enabled = false,
        required_width = 64, -- min width of window required to show this column
      },
      type = {
        enabled = false,
        required_width = 122, -- min width of window required to show this column
      },
      last_modified = {
        enabled = false,
        required_width = 88, -- min width of window required to show this column
      },
      created = {
        enabled = false,
        required_width = 110, -- min width of window required to show this column
      },
      symlink_target = {
        enabled = false,
      },
    },
    commands = {
      parent_or_close = function(state)
        local node = state.tree:get_node()
        if node:has_children() and node:is_expanded() then
          state.commands.toggle_node(state)
        else
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      end,
      child_or_open = function(state)
        local node = state.tree:get_node()
        if node:has_children() then
          if not node:is_expanded() then -- if unexpanded, expand
            state.commands.toggle_node(state)
          else -- if expanded and has children, seleect the next child
            if node.type == "file" then
              state.commands.open(state)
            else
              require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
            end
          end
        else -- if has no children
          state.commands.open(state)
        end
      end,
    },
    window = {
      mappings = {
        h = "parent_or_close",
        l = "child_or_open",
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
      },
    },
  },
}

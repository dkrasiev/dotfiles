-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.completion.codeium-vim" },
  { import = "astrocommunity.completion.cmp-cmdline" },

  { import = "astrocommunity.git.blame-nvim" },
  { import = "astrocommunity.git.git-blame-nvim" },

  { import = "astrocommunity.motion.nvim-surround" },

  -- JS web dev
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.angular" },
  -- misc for web dev
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.prisma" },

  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.kotlin" },
  { import = "astrocommunity.pack.java" },

  { import = "astrocommunity/file-explorer/oil-nvim" },
  { import = "astrocommunity/note-taking/obsidian-nvim" },
  { import = "astrocommunity/fuzzy-finder/telescope-zoxide" },
  { import = "astrocommunity/editing-support/rainbow-delimiters-nvim" },
  { import = "astrocommunity/project/nvim-spectre" },
}

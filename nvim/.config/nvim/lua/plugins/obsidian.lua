return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = { "nvim-lua/plenary.nvim" },

  opts = {
    workspaces = {
      {
        name = "Main",
        path = "~/projects/Obsidian/The Begining",
      },
    },

    disable_frontmatter = true,

    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },

    completion = {
      nvim_cmp = false,
      min_chars = 2,
    },
    ui = {
      enable = false,
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
    },
  },

  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  --   ---@module 'render-markdown'
  --   ---@type render.md.UserConfig
  --   opts = {
  --     code = {
  --       sign = false,
  --       width = "block",
  --       right_pad = 1,
  --     },
  --     heading = {
  --       sign = false,
  --       icons = {},
  --     },
  --     checkbox = {
  --       enabled = false,
  --     },
  --   },
  -- },
}

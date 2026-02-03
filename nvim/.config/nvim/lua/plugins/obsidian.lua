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
      enable = true,
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
    },
  },
}

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    -- enable = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = false, -- Keep main transparency
      styles = {
        sidebars = "transparent", -- Keep sidebar transparency
        floats = "transparent", -- Keep float transparency
      },
    },
  },
}

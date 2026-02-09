return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true, -- Keep main transparency
      styles = {
        sidebars = "transparent", -- Keep sidebar transparency
        floats = "transparent", -- Keep float transparency
      },
    },
  },
}

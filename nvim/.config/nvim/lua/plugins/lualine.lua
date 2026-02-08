return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local function transparency_override(theme)
        for _, section in pairs(theme) do
          if section.a then
            section.a.bg = nil
          end
          if section.b then
            section.b.bg = nil
          end
          if section.c then
            section.c.bg = nil
          end
        end
        return theme
      end

      opts.options = opts.options or {}
      local lualine_theme = require("lualine.themes.tokyonight")
      opts.options.theme = transparency_override(lualine_theme)
    end,
  },
}

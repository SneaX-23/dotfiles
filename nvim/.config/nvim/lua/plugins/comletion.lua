return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      }

      opts.experimental = {
        ghost_text = false,
      }
    end,
  },
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              usePlaceholders = false,
              completeFunctionCalls = false,
              hints = {
                assignVariableTypes = false,
                parameterNames = false,
              },
            },
          },
        },
      },
    },
  },
}

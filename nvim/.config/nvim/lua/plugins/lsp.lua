return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = { severity = { min = vim.diagnostic.severity.ERROR } },
        underline = { severity = { min = vim.diagnostic.severity.ERROR } },
        signs = { severity = { min = vim.diagnostic.severity.ERROR } },
      },
      servers = {
        gopls = {
          settings = {
            gopls = {
              usePlaceholders = false,
              completeFunctionCalls = false,
              analyses = {
                errcheck = false,
              },
              hints = {
                assignVariableTypes = false,
                parameterNames = false,
              },
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                kubernetes = {
                  "*.k8s.yaml",
                  "pod.yaml",
                  "deployment.yaml",
                  "service.yaml",
                },
              },
              validate = true,
              completion = true,
            },
          },
        },
      },
    },
  },
}

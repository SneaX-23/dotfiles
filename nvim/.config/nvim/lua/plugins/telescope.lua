return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-telescope/telescope-project.nvim" },
  keys = {
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
    { "<leader>pp", "<cmd>Telescope project<cr>", desc = "Search Projects" },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
    },
    extensions = {
      project = {
        base_dirs = { "~/projects" },
        hidden_files = true,
        theme = "dropdown",
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("project")
  end,
}

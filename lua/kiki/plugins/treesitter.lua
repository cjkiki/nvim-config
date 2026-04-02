return {
  -- syntax parsing (treesitter)
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy   = false,
    build  = ":TSUpdate",

    config = function()
      require "nvim-treesitter" .setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      require "nvim-treesitter" .install({
        "c",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "vim",
        "vimdoc",
        "diff",
        "gitcommit",
        "gitignore",
        "json",
        "yaml",
        "toml",
        "regex",
      })
    end,
  },

  -- treesitter-context
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },

    opts = {
      enable = true,
      max_lines = 4,
      min_window_height = 20,
      trim_scope = "outer",
    },
  },
}

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
        "cpp",
        "lua",
        "html",
        "css",
        "javascript",
        "tsx",
        "typescript",
        "prisma",
        "graphql",
        "json",
        "bash",
        "make",
        "diff",
        "editorconfig",
        "gitcommit",
        "gitignore",
        "luadoc",
        "toml",
        "yaml",
        "regex",
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline",
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

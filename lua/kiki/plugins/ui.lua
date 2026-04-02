return {
  -- colorscheme (gruber-darker)
  {
    "blazkowolf/gruber-darker.nvim",
    lazy     = false,
    priority = 1000,

    opts = {
      bold = false,
      italic = {
        strings   = false,
        comments  = false,
        operators = false,
        folds     = false
      },
      invert = {
        signs   = false,
        tabline = false,
        visual  = false
      },
      undercurl = true,
      underline = true,
    },

    config = function(_, opts)
      require "gruber-darker" .setup(opts)
      vim.cmd.colorscheme("gruber-darker")
    end,
  },

  -- statusline (lualine)
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
      require "lualine" .setup({
        options = {
          theme = "auto",
          component_separators = {},
          section_separators   = {},
          globalstatus = true,
        },
      })
    end,
  },

  -- icons (dependency)
  { "nvim-tree/nvim-web-devicons", lazy = true },
}

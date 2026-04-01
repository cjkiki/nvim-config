return {
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
  }
}

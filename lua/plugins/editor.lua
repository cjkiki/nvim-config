return {
  {
    "windwp/nvim-autopairs",
    event  = "InsertEnter",
    config = true,

    opts = {
      check_ts  = true,
      ts_config = {
        lua = { "string" },
        c   = { "comment" },
        cpp = { "comment" },
      },
    },
  },

  {
    "numToStr/Comment.nvim",
    opts = {
      padding = true,
      sticky  = true,
      ignore  = nil,
      toggler = {
        line  = "gcc",
        block = "gbc",
      },
      opleader = {
        line   = "gc",
        block  = "gb",
      },
      extra = {
        above = "gca",
        below = "gcb",
        eol   = "gce",
      },
      mappings = {
        basic = true,
        extra = true,
      },
      pre_hook  = nil,
      post_hook = nil,
    },
  },

  { "nvim-lua/plenary.nvim", lazy = true },
}

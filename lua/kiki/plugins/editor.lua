return {
  -- autopairs
  {
    "windwp/nvim-autopairs",
    event  = "InsertEnter",
    config = true,

    opts = {
      check_ts  = true,
      ts_config = {
        lua = { "string" },
        c   = { "comment" },
      },
    },
  },

  -- comment
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

  -- file explorer (nvim-tree)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>ee", "<cmd>NvimTreeToggle<CR>",   desc = "File tree toggle" },
      { "<leader>ef", "<cmd>NvimTreeFindFile<CR>", desc = "Find tree find file" },
    },

    opts = {
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"
        local function map(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, nowait = true, desc = desc })
        end

        api.config.mappings.default_on_attach(bufnr)

        map("l",     api.node.open.edit,             "Open")
        map("h",     api.node.navigate.parent_close, "Close dir")
        map("<C-v>", api.node.open.vertical,         "Open vertical")
        map("<C-x>", api.node.open.horizontal,       "Open horizontal")
      end,

      view = {
        width = 35,
        side  = "left",
        preserve_window_proportions = true,
      },
      renderer = {
        highlight_git = true,
        highlight_opened_files = "name",
        indent_markers = { enable = false },
      },
      filters = {
        dotfiles = false,
      },
      git = { enable = true, ignore = false },
      actions = {
        open_file = {
          quit_on_open = false,
          window_picker = { enable = true },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
      },
    },
  },

  -- utility
  { "nvim-lua/plenary.nvim", lazy = true },
}

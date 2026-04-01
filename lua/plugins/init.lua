require("lazy").setup({
  { import = "plugins.ui" },
  { import = "plugins.editor" },
}, {
  defaults = {
    lazy = true,
    version = false,
  },
  install = {
    colorscheme = { "gruber-darker" },
  },
  checker = { enable = true, notify = false },
  change_detection = { notify = false },
})

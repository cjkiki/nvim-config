require("lazy").setup({
  { import = "plugins.ui" },
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

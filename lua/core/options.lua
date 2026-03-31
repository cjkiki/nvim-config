local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

-- general
opt.nu = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.linebreak = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.splitbelow = true
opt.splitright = true
opt.clipboard = "unnamedplus"
opt.mouse = "a"

-- ui
opt.signcolumn = "yes"
opt.termguicolors = true
opt.showmode = false
opt.laststatus = 3
opt.pumheight = 8

-- tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- search
opt.ignorecase = true
opt.smartcase  = true
opt.hlsearch   = true
opt.incsearch  = true

-- symbol rendering
opt.list = true
opt.listchars = {
  space    = "·",
  tab      = "→ ",
  extends  = "»",
  precedes = "«",
}

opt.fillchars = {
    eob       = " ",
    fold      = " ",
    foldopen  = "▾",
    foldclose = "▸",
    foldsep   = "│",
    diff      = "╱",
    vert      = "│",
}

-- folding
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99

-- completion
opt.completeopt = { "menu", "menuone", "noselect", "noinsert", "popup" }
opt.wildmenu = true
opt.wildmode = "longest:full,full"

-- backup
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.undolevels = 10000

-- performance
opt.updatetime  = 200
opt.timeoutlen  = 300
opt.ttimeoutlen = 10

-- encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- disabled providers
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

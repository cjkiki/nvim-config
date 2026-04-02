local o = vim.opt
local g = vim.g

g.mapleader      = " "
g.maplocalleader = " "

-- general
o.number         = true
o.relativenumber = true
o.cursorline     = true
o.wrap           = false
o.linebreak      = true
o.scrolloff      = 8
o.sidescrolloff  = 8
o.splitbelow     = true
o.splitright     = true
o.clipboard      = "unnamedplus"
o.mouse          = "a"

-- ui
o.signcolumn    = "yes"
o.termguicolors = true
o.showmode      = false
o.laststatus    = 3
o.pumheight     = 8
o.cmdheight     = 1

-- indent
o.tabstop     = 4
o.shiftwidth  = 4
o.expandtab   = true
o.smartindent = true

-- search
o.ignorecase = true
o.smartcase  = true
o.hlsearch   = true
o.incsearch  = true

-- symbol rendering
o.list = true
o.listchars = {
  space    = "·",
  tab      = "→ ",
  extends  = "»",
  precedes = "«",
}

o.fillchars = {
    eob       = " ",
    fold      = " ",
    foldopen  = "▾",
    foldclose = "▸",
    foldsep   = "│",
    diff      = "╱",
    vert      = "│",
}

-- folding
o.foldmethod     = "expr"
o.foldexpr       = "v:lua.vim.treesitter.foldexpr()"
o.foldcolumn     = "0"
o.foldlevel      = 99
o.foldlevelstart = 99

-- completion
o.completeopt = { "menu", "menuone", "noinsert", "popup" }

-- files
o.swapfile    = false
o.backup      = false
o.writebackup = false
o.undofile    = true
o.undolevels  = 10000

-- performance
o.updatetime  = 200
o.timeoutlen  = 300
o.ttimeoutlen = 10

-- encoding
o.encoding     = "utf-8"
o.fileencoding = "utf-8"

-- disabled providers
g.loaded_perl_provider    = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider    = 0

-- netrw file tree
g.loaded_netrw       = 1
g.loaded_netrwPlugin = 1

-- utility functions
local function map(mode, lhs, rhs, desc)
  local opts = { noremap = true, silent = true, desc = desc }
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- insert mode
local function i(lhs, rhs, desc)
  map("i", lhs, rhs, desc)
end

-- normal mode
local function n(lhs, rhs, desc)
  map("n", lhs, rhs, desc)
end

-- visual mode
local function v(lhs, rhs, desc)
  map("v", lhs, rhs, desc)
end

-- terminal mode
local function t(lhs, rhs, desc)
  map("t", lhs, rhs, desc)
end

-- general
i("jk", "<Esc>", "Exit insert mode")
n("Y",  "y$",    "Yank to EOL")
n("J",  "mzJ`z", "Connect lines")
v("P", '"_dP',   "Yank (no register)")
v("D", '"_d',    "Delete (no register)")

-- navigation
n("<C-d>", "<C-d>zz", "Half page down center")
n("<C-u>", "<C-u>zz", "Half page up center")

-- search
n("<Esc>", "<cmd>nohlsearch<CR>", "Clear search highlights")
n("n",     "nzzzv",               "Next highlight center")
n("N",     "Nzzzv",               "Previous highlight center")

-- selection
v("J", ":m '>+1<CR>gv=gv", "Move selection down")
v("K", ":m '<-2<CR>gv=gv", "Move selection up")

-- indent
v("<", "<gv", "Move indent in")
v(">", ">gv", "Move indent out")

-- files
n("<leader>w",  "<cmd>w<CR>",   "Save")
n("<leader>wa", "<cmd>wa<CR>",  "Save all")
n("<leader>q",  "<cmd>q<CR>",   "Quit")
n("<leader>qa", "<cmd>qa!<CR>", "Quit all")

-- buffers
n("<Tab>",      "<cmd>bnext<CR>",      "Next buffer")
n("<S-Tab>",    "<cmd>bprevious<CR>",  "Previous buffer")
n("<leader>bd", "<cmd>bd<CR>",         "Delete buffer")
n("<leader>bf", "<cmd>bd!<CR>",        "Force delete buffer")
n("<leader>bo", "<cmd>%bd|e#|bd#<CR>", "Delete all other buffers")

-- splits
n("<leader>sv", "<C-w>v",         "Split vertically")
n("<leader>sh", "<C-w>s",         "Split horizontally")
n("<leader>se", "<C-w>=",         "Equalize splits")
n("<leader>sx", "<cmd>close<CR>", "Close split")

n("<C-h>", "<C-w>h", "Split left")
n("<C-j>", "<C-w>j", "Split bottom")
n("<C-k>", "<C-w>k", "Split top")
n("<C-l>", "<C-w>l", "Split right")

n("<C-Up",     "<cmd>resize +2<CR>",          "Increase split height")
n("<C-Down>",  "<cmd>resize -2<CR>",          "Decrease split height")
n("<C-Left>",  "<cmd>vertical resize -2<CR>", "Decrease split width")
n("<C-Right>", "<cmd>vertical resize +2<CR>", "Increase split width")

-- quickfix
n("<leader>qn", "<cmd>cnext<CR>",  "Next QF entry")
n("<leader>qp", "<cmd>cprev<CR>",  "Previous QF entry")
n("<leader>ln", "<cmd>lnext<CR>",  "Next loclist entry")
n("<leader>lp", "<cmd>lprev<CR>",  "Previous loclist entry")
n("<leader>co", "<cmd>copen<CR>",  "Open quickfix")
n("<leader>cc", "<cmd>cclose<CR>", "Close quickfix")

-- terminal
n("<leader>tn", "<cmd>terminal<CR>", "New terminal")
t("<Esc>",      "<C-\\><C-n>",       "Exit terminal insert mode")
t("<C-h>",      "<C-\\><C-n><C-w>h", "Terminal split left")
t("<C-j>",      "<C-\\><C-n><C-w>j", "Terminal split bottom")
t("<C-k>",      "<C-\\><C-n><C-w>k", "Terminal split top")
t("<C-l>",      "<C-\\><C-n><C-w>l", "Terminal split right")

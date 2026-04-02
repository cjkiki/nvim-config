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
i("jk",                "<Esc>",  "Exit insert mode")
n("Y",                 "y$",     "Yank to EOL")
n("J",                 "mzJ`z",  "Connect lines")
v("P",                 '"_dP',   "Paste (no register)")
map({ "n", "v" }, "D", '"_d',    "Delete (no register)")

-- navigation
n("<C-d>", "<C-d>zz", "Half page down center")
n("<C-u>", "<C-u>zz", "Half page up center")

-- search
n("<Esc>", "<cmd>noh<CR>", "Clear search highlights")
n("n",     "nzzzv",        "Next search highlight center")
n("N",     "Nzzzv",        "Previous search highlight center")

-- selection
v("J", ":m '>+1<CR>gv=gv", "Move selection down")
v("K", ":m '<-2<CR>gv=gv", "Move selection up")

-- indent
v("<", "<gv", "Indent left")
v(">", ">gv", "Indent right")

-- files
n("<leader>w",  "<cmd>w<CR>",   "Save file")
n("<leader>wa", "<cmd>wa<CR>",  "Save all files")
n("<leader>q",  "<cmd>q<CR>",   "Quit")
n("<leader>qa", "<cmd>qa!<CR>", "Quit all")

-- buffers
n("<Tab>",      "<cmd>bnext<CR>",      "Next buffer")
n("<S-Tab>",    "<cmd>bprevious<CR>",  "Previous buffer")
n("<leader>bd", "<cmd>bd<CR>",         "Delete buffer")
n("<leader>bf", "<cmd>bd!<CR>",        "Force delete buffer")

-- splits
n("<leader>sv", "<C-w>v",         "Split vertically")
n("<leader>sh", "<C-w>s",         "Split horizontally")
n("<leader>se", "<C-w>=",         "Equal splits")
n("<leader>sx", "<cmd>close<CR>", "Close split")

n("<C-h>", "<C-w>h", "Split left")
n("<C-j>", "<C-w>j", "Split bottom")
n("<C-k>", "<C-w>k", "Split top")
n("<C-l>", "<C-w>l", "Split right")

n("<C-Up",     "<cmd>resize +2<CR>",          "Increase height")
n("<C-Down>",  "<cmd>resize -2<CR>",          "Decrease height")
n("<C-Left>",  "<cmd>vertical resize -2<CR>", "Decrease width")
n("<C-Right>", "<cmd>vertical resize +2<CR>", "Increase width")

-- diagnostics
n("<leader>dn", vim.diagnostic.goto_next,  "Next diagnostic")
n("<leader>dp", vim.diagnostic.goto_prev,  "Previous diagnostic")
n("<leader>ld", vim.diagnostic.open_float, "Diagnostic float")
n("<leader>lq", vim.diagnostic.setloclist, "Diagnostic loclist")

-- quickfix
n("<leader>qn", "<cmd>cnext<CR>",  "Next quickfix")
n("<leader>qp", "<cmd>cprev<CR>",  "Previous quickfix")
n("<leader>co", "<cmd>copen<CR>",  "Open quickfix")
n("<leader>cc", "<cmd>cclose<CR>", "Close quickfix")

-- terminal
n("<leader>tn", "<cmd>terminal<CR>", "New terminal")

n("<leader>th", function()
  vim.cmd("botright split | resize 14 | terminal")
end, "New terminal horizontal")

n("<leader>tv", function()
  vim.cmd("vsplit | terminal")
end, "New terminal vertical")

t("<Esc>",      "<C-\\><C-n>",       "Exit terminal insert mode")
t("<C-h>",      "<C-\\><C-n><C-w>h", "Terminal -> left")
t("<C-j>",      "<C-\\><C-n><C-w>j", "Terminal -> bottom")
t("<C-k>",      "<C-\\><C-n><C-w>k", "Terminal -> top")
t("<C-l>",      "<C-\\><C-n><C-w>l", "Terminal -> right")

-- util
n("<leader>rc", "<cmd>source %MYVIMRC<CR>", "Reload config")

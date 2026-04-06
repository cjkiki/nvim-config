-- utility declarations
local api = vim.api

local function augroup(name)
  return api.nvim_create_augroup("kiki_" .. name, { clear = true })
end

-- yank highlight
api.nvim_create_autocmd("TextYankPost", {
  group    = augroup("yank"),
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
  end,
})

-- restore cursor position
api.nvim_create_autocmd("BufReadPost", {
  group    = augroup("restore_cursor"),
  callback = function()
    local mark   = api.nvim_buf_get_mark(0, '"')
    local lcount = api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- strip trailing whitespace on save
api.nvim_create_autocmd("BufWritePre", {
  group    = augroup("trim_whitespace"),
  callback = function()
    if vim.bo.filetype == "markdown" then return end
    if vim.b.large_file then return end
    local view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})

-- resize splits when terminal is resized
api.nvim_create_autocmd("VimResized", {
  group    = augroup("resize_splits"),
  callback = function()
    local cur = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. cur)
  end,
})

-- close these filetypes with q
api.nvim_create_autocmd("FileType", {
    group    = augroup("help_q"),
    pattern  = { "help", "man", "qf", "checkhealth", "lspinfo" },
    callback = function()
        vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true, silent = true })
    end,
})

-- detect large files (> 1MiB) disable heavy features
api.nvim_create_autocmd("BufReadPre", {
  group    = augroup("large_files"),
  callback = function(ev)
    local ok, stat = pcall(vim.loop.fs_stat, ev.match)
    if ok and stat and stat.size > 1024 * 1024 then
      vim.b.large_file       = true
      vim.opt_local.swapfile = false
      vim.opt_local.undofile = false
    end
  end,
})

-- check for file changes when focus returns
api.nvim_create_autocmd({ "FocusGained", "TermLeave" }, {
  group    = augroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- clear search history on startup
api.nvim_create_autocmd("VimEnter", {
  group    = augroup("clear_search"),
  once     = true,
  callback = function()
    vim.fn.setreg("/", "")
  end,
})

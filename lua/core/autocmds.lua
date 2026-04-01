-- utility declarations
local api = vim.api

local function augroup(name)
  return api.nvim_create_augroup("core_" .. name)
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

-- remove trailing whitespace when saving
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

-- align split by terminal resize
api.nvim_create_autocmd("VimResized", {
  group    = augroup("resize_splits"),
  callback = function()
    local cur = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. cur)
  end,
})

-- deactivate syntax highlighting with large files (> 1MiB)
api.nvim_create_autocmd("BufReadPre", {
  group    = augroup("large_files"),
  callback = function(ev)
    local ok, stat = pcall(vim.loop.fs_stat, ev.match)
    if ok and stat and stat.size > 1024 * 1024 then
      vim.opt_local.syntax   = "off"
      vim.opt_local.filetype = ""
      vim.opt_local.swapfile = false
      vim.opt_local.undofile = false
      vim.b.large_file       = true
      vim.notify(
        ("Large file (%s) - syntax highlight deactivated"):format(
          vim.fn.fnamemodify(ev.match, ":t")
        ), vim.log.levels.WARN
      )
    end
  end,
})

-- help / man / qf - q to exit
api.nvim_create_autocmd("FileType", {
  group    = augroup("help_q"),
  pattern  = { "help", "man", "qf", "checkhealth" },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<CR", {
      buffer = true, silent = true
    })
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

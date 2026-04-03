return {
  -- git integration
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },

    opts = {
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = "▎" },
        untracked    = { text = "┆" },
      },
      current_line_blame = false,

      on_attach = function(buf)
        local gs = package.loaded.gitsigns
        local function map(lhs, rhs, desc, mode)
          vim.keymap.set(mode or "n", lhs, rhs, { buffer = buf, desc = desc })
        end

        map("]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next hunk")
        map("[h", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              gs.nav_hunk("prev")
            end
        end, "Prev hunk")

        map("<leader>hs", gs.stage_hunk,   "Stage hunk")
        map("<leader>hr", gs.reset_hunk,   "Reset hunk")
        map("<leader>hS", gs.stage_buffer, "Stage buffer")
        map("<leader>hR", gs.reset_buffer, "Reset buffer")
        map("<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
        map("<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage hunk", "v")
        map("<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset hunk", "v")

        map("<leader>hp", gs.preview_hunk,                    "Preview hunk")
        map("<leader>hd", gs.diffthis,                        "Diff this")
        map("<leader>hD", function() gs.diffthis("~") end,    "Diff this ~")
        map("<leader>gb", gs.toggle_current_line_blame,       "Toggle blame")

        map("ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk", { "o", "x" })
      end,
    },
  },
}

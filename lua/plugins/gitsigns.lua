-- [nfnl] Compiled from ./fnl/plugins/gitsigns.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local function _2_(bufnr)
    local gitsigns = require("gitsigns")
    local function map(mode, l, r, opts)
      opts = (opts or {})
      opts.buffer = bufnr
      return vim.keymap.set(mode, l, r, opts)
    end
    local function _3_()
      if vim.wo.diff then
        return vim.cmd.normal({"]c", bang = true})
      else
        return gitsigns.nav_hunk("next")
      end
    end
    map("n", "]c", _3_)
    local function _5_()
      if vim.wo.diff then
        return vim.cmd.normal({"[c", bang = true})
      else
        return gitsigns.nav_hunk("prev")
      end
    end
    map("n", "[c", _5_)
    map("n", "<leader>gs", gitsigns.stage_hunk)
    map("n", "<leader>gr", gitsigns.reset_hunk)
    local function _7_()
      return gitsigns.stage_hunk({vim.fn.line("."), vim.fn.line("v")})
    end
    map("v", "<leader>gs", _7_)
    local function _8_()
      return gitsigns.reset_hunk({vim.fn.line("."), vim.fn.line("v")})
    end
    map("v", "<leader>gr", _8_)
    map("n", "<leader>gS", gitsigns.stage_buffer)
    map("n", "<leader>gu", gitsigns.undo_stage_hunk)
    map("n", "<leader>gR", gitsigns.reset_buffer)
    map("n", "<leader>gp", gitsigns.preview_hunk)
    local function _9_()
      return gitsigns.blame_line({full = true})
    end
    map("n", "<leader>gb", _9_)
    map("n", "<leader>gb", gitsigns.toggle_current_line_blame)
    map("n", "<leader>gd", gitsigns.diffthis)
    local function _10_()
      return gitsigns.diffthis("~")
    end
    map("n", "<leader>gD", _10_)
    map("n", "<leader>gtd", gitsigns.toggle_deleted)
    return map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end
  return require("gitsigns").setup({on_attach = _2_})
end
return {"gitsigns.nvim", after = _1_, event = "BufEnter"}

-- Mostly remaps of existing keys. New keybinds are generally defined directly
-- in their plugin specs for `lz.n`

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>", "<nop>")

vim.keymap.set("t", "<C-Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- when searching, also center screen and reopen folds
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- The greatest remap of all time -- the primeagen
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "same as `d` but send to black hole register" })
vim.keymap.set({ "n", "v" }, "<leader>D", '"_D', { desc = "same as `D` but send to black hole register" })
-- The real greatest remap(s) of all time -- me
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "yank to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y', { desc = "yank rest of line to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "put after cursor from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "put before cursor from clipboard" })

-- Allow increment/decrement repeatedly in visual
vim.keymap.set("v", "<C-a>", "<C-a>gv")
vim.keymap.set("v", "<C-x>", "<C-x>gv")
vim.keymap.set("v", "g<C-a>", "g<C-a>gv")
vim.keymap.set("v", "g<C-x>", "g<C-x>gv")

vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)

vim.keymap.set("i", "<Tab>", require("scripts.intellitab").indent)

vim.keymap.set({ "n", "i", "v" }, "<C-c>", function()
  vim.diagnostic.config({ virtual_lines = { current_line = not vim.diagnostic.config().virtual_lines.current_line } })
end, { desc = "toggle diagnostics on all lines" })

vim.api.nvim_create_user_command("AutoSync", function()
  local date = os.date("%Y-%m-%d %H:%M:%S")
  local commit_commands = {
    "git add -A",
    string.format([[git commit -m "auto-update(nvim): %s"]], date),
  }
  for _, cmd in ipairs(commit_commands) do
    vim.fn.system(cmd)
  end
  vim.notify("Committed all local changes.", vim.log.levels.INFO)
  vim.cmd("Neogit push")
end, {})

vim.keymap.set("n", "<leader>os", vim.cmd.AutoSync)

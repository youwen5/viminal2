-- Non-exhaustive collection of keymaps. I've decided it's more sane to place
-- plugin specific maps in their respective setup scripts

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>", "<nop>")

vim.keymap.set("t", "<C-Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>mr", function ()
  vim.cmd.CellularAutomaton("make_it_rain")
end)
vim.keymap.set("n", "<leader>bruh", function ()
  vim.cmd.CellularAutomaton("game_of_life")
end)

-- when searching, also center screen and reopen folds
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- The greatest remap of all time -- the primeagen
vim.keymap.set({"n", "v"}, "<leader>d",'"_d', { desc = "same as `d` but send to black hole register"})
vim.keymap.set({"n", "v"}, "<leader>D",'"_D', { desc = "same as `D` but send to black hole register"})
-- The real greatest remap(s) of all time -- me
vim.keymap.set({"n", "v"}, "<leader>y",'"+y', { desc = "yank to clipboard"})
vim.keymap.set({"n", "v"}, "<leader>Y",'"+Y', { desc = "yank rest of line to clipboard"})
vim.keymap.set({"n", "v"}, "<leader>p",'"+p', { desc = "put after cursor from clipboard"})
vim.keymap.set({"n", "v"}, "<leader>P",'"+P', { desc = "put before cursor from clipboard"})

vim.keymap.set("n", "<leader>gg", function ()
  vim.cmd.Neogit()
end, { desc = "Open neogit" })
vim.keymap.set("n", "<leader>gc", function ()
  vim.cmd.Neogit("kind=floating commit")
end, { desc = "Open neogit commit menu" })

vim.keymap.set("n", "<leader>u", function ()
  vim.cmd.UndotreeToggle()
end, {desc = "Toggle undotree"})

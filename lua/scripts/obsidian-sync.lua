vim.api.nvim_create_user_command("VaultSync", function()
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

vim.keymap.set("n", "<leader>vs", vim.cmd.VaultSync)

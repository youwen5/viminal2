return {
  "telescope.nvim",
  after = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })

    require("telescope").load_extension("ui-select")

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader> ", function()
      local is_git = vim.fn.finddir(".git", vim.fn.getcwd() .. ";")
      if is_git then
        builtin.git_files()
      else
        builtin.find_files()
      end
    end, { desc = "Grep through all files tracked by git, or fall back to just cwd" })

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Grep through all files in cwd" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    vim.keymap.set("n", "<leader>/", builtin.live_grep)
    vim.keymap.set("n", "<leader>k", builtin.buffers)
    vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "Go to LSP definition" })
    vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "Go to implementations" })
    vim.keymap.set("n", "<leader>j", builtin.lsp_document_symbols, { desc = "Search through document symbols" })
    vim.keymap.set(
      "n",
      "<leader>fs",
      builtin.lsp_workspace_symbols,
      { desc = "Search through entire workspace symbols" }
    )
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Search through LSP diagnostics" })
  end,
  priority = 60,
}

-- [nfnl] Compiled from ./fnl/plugins/lz-spec.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return require("which-key").setup({delay = 1000})
end
local function _2_()
  return require("typst-preview").setup({dependencies_bin = {tinymist = nixCats("bin.tinymist"), websocat = nixCats("bin.websocat")}})
end
local function _3_()
  return require("mini.ai").setup()
end
local function _4_()
  return require("mini.surround").setup()
end
local function _5_()
  return require("fidget").setup({notification = {override_vim_notify = true, window = {border = "rounded", x_padding = 1, y_padding = 2}}})
end
local function _6_()
  return vim.cmd.CellularAutomaton("make_it_rain")
end
local function _7_()
  return vim.cmd.CellularAutomaton("game_of_life")
end
local function _8_()
  return require("ibl").setup({exclude = {filetypes = {"help", "ministarter", "Trouble", "trouble", "toggleterm"}}, indent = {char = "\226\148\130", tab_char = "\226\148\130"}, scope = {show_end = false, show_start = false}})
end
local function _9_()
  return require("mini.bufremove").setup()
end
local function _10_()
  return MiniBufremove.delete()
end
local function _11_()
  return require("mini.hipatterns").setup()
end
local function _12_()
  return vim.cmd.UndotreeToggle()
end
local function _13_()
  return require("neocord").setup({editing_text = "Hacking %s", logo_tooltip = "The One True Text Editor", terminal_text = "Bypassing the mainframe", workspace_text = "The One True Text Editor"})
end
local function _14_()
  return require("crates").setup({})
end
local function _15_()
  require("lz.n").trigger_load("nvim-lspconfig")
  return require("typescript-tools").setup({})
end
local function _16_()
  require("lsp_lines").setup()
  return vim.diagnostic.config({virtual_lines = {only_current_line = true}, virtual_text = false})
end
local function _17_()
  local lz = require("lz.n")
  lz.trigger_load("telescope.nvim")
  lz.trigger_load("nvim-lspconfig")
  require("tailwind-tools").setup({conceal = {enabled = true}, document_color = {enabled = true}})
  local function _18_()
    return vim.cmd("Telescope tailwind utilities")
  end
  return vim.keymap.set("n", "<leader>ft", _18_, {desc = "Search through TailwindCSS utility classes available in the project."})
end
local function _19_()
  return require("lazydev").setup()
end
local function _20_()
  return require("pomo").setup({notifiers = {{name = "Default", opts = {sticky = false}}, {name = "System"}}, sessions = {grind = {{duration = "45m", name = "Work"}, {duration = "5m", name = "Short Break"}, {duration = "45m", name = "Work"}}, pomodoro = {{duration = "25m", name = "Work"}, {duration = "5m", name = "Short Break"}, {duration = "25m", name = "Work"}, {duration = "5m", name = "Short Break"}, {duration = "25m", name = "Work"}, {duration = "15m", name = "Long Break"}}}})
end
local function _21_()
  require("telescope").load_extension("pomodori")
  return require("telescope").extensions.pomodori.timers()
end
local function _22_()
  local dropbar_api = require("dropbar.api")
  vim.keymap.set("n", "<Leader>;", dropbar_api.pick, {desc = "Pick symbols in winbar"})
  vim.keymap.set("n", "[;", dropbar_api.goto_context_start, {desc = "Go to start of current context"})
  return vim.keymap.set("n", "];", dropbar_api.select_next_context, {desc = "Select next context"})
end
local function _23_()
  require("mini.files").setup({windows = {preview = true, width_preview = 40}})
  local function _24_()
    if (vim.bo.filetype == "ministarter") then
      return MiniFiles.open(nil, false)
    else
      return MiniFiles.open(vim.api.nvim_buf_get_name(0))
    end
  end
  vim.keymap.set("n", "<leader>e", _24_)
  local function _26_()
    return MiniFiles.open(nil, false)
  end
  return vim.keymap.set("n", "<leader>fe", _26_)
end
return {require("plugins.blink-cmp"), require("plugins.telescope"), require("plugins.oil"), require("plugins.harpoon"), require("plugins.lualine"), require("plugins.conform"), require("plugins.lsp-progress"), require("plugins.gitsigns"), require("plugins.autopairs"), require("plugins.trouble"), require("plugins.render-markdown"), require("plugins.toggleterm"), require("plugins.by-lang.latex"), require("plugins.neogit"), require("plugins.obsidian"), require("plugins.starter"), {"vim-wakatime"}, {"clangd_extensions.nvim"}, {"vim-sleuth"}, {"nvim-lspconfig", after = require("lsp").setup, event = "BufEnter"}, {"which-key.nvim", after = _1_}, {"nvim-web-devicons"}, {"markdown-preview.nvim", filetypes = {"markdown"}}, {"typst-preview.nvim", after = _2_, filetypes = {"*.typ"}}, {"mini.ai", after = _3_, event = "BufEnter"}, {"mini.surround", after = _4_, event = "BufEnter"}, {"fidget.nvim", after = _5_}, {"cellular-automaton.nvim", cmd = "CellularAutomaton", keys = {{"<leader>mr", _6_, desc = "A surprise!", mode = "n"}, {"<leader>bruh", _7_, desc = "A surprise!", mode = "n"}}}, {"indent-blankline.nvim", after = _8_}, {"mini.bufremove", after = _9_, keys = {{"<leader>bd", _10_, desc = "Close buffer", mode = {"n", "v"}}}}, {"mini.hipatterns", after = _11_, event = "BufEnter"}, {"undotree", cmd = "UndotreeToggle", keys = {{"<leader>u", _12_, desc = "Toggle undotree", mode = "n"}}}, {"neocord", after = _13_, event = "BufEnter"}, {"crates.nvim", after = _14_, event = "BufRead Cargo.toml"}, {"rustaceanvim"}, {"haskell-tools.nvim"}, {"typescript-tools.nvim", after = _15_, filetypes = {"typescriptreact", "typescript", "javascript", "svelte", "javascriptreact"}}, {"lsp_lines.nvim", after = _16_, event = "LspAttach"}, {"tailwind-tools.nvim", after = _17_}, {"blink-ripgrep", lazy = true}, {"blink.compat", lazy = true}, {"lazydev.nvim", after = _19_, filetypes = {"lua"}}, {"rose-pine", colorscheme = {"rose-pine", "rose-pine-dawn", "rose-pine-moon", "rose-pine-main"}}, {"oxocarbon.nvim", colorscheme = {"oxocarbon"}}, {"pomo-nvim", after = _20_, cmd = {"TimerStart", "TimerRepeat", "TimerSession"}, keys = {{"<leader>fp", _21_, desc = "Manage Pomodori Timers"}}}, {"dropbar.nvim", after = _22_}, {"mini.files", after = _23_}, {"nfnl", ft = {"fennel"}}}

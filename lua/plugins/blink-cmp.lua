-- [nfnl] Compiled from ./fnl/plugins/blink-cmp.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  require("lz.n").trigger_load("blink-ripgrep")
  require("lz.n").trigger_load("blink.compat")
  local function _2_()
    return require("blink-cmp").show({providers = {"ripgrep"}})
  end
  return require("blink.cmp").setup({appearance = {nerd_font_variant = "normal", use_nvim_cmp_as_default = true}, completion = {documentation = {auto_show = true, auto_show_delay_ms = 500, treesitter_highlighting = true, update_delay_ms = 50, window = {border = "rounded"}}, menu = {border = "rounded", draw = {columns = {{"kind_icon", "kind"}, {"label", "label_description", gap = 2}}, treesitter = {"lsp"}}}}, fuzzy = {prebuilt_binaries = {download = false}}, keymap = {["<C-g>"] = {_2_}, ["<C-j>"] = {"snippet_backward", "fallback"}, ["<C-k>"] = {"snippet_forward", "fallback"}, ["<S-Tab>"] = {}, ["<Tab>"] = {}, preset = "default"}, signature = {enabled = true, window = {border = "rounded"}}, sources = {default = {"lsp", "path", "snippets", "buffer"}, per_filetype = {lua = {"lazydev", "lsp", "path", "snippets", "buffer"}, markdown = {"lsp", "snippets", "obsidian", "obsidian_new", "obsidian_tags", "path", "buffer", "markdown"}}, providers = {lazydev = {module = "lazydev.integrations.blink", name = "LazyDev", score_offset = 100}, markdown = {module = "render-markdown.integ.blink", name = "RenderMarkdown"}, obsidian = {module = "blink.compat.source", name = "obsidian"}, obsidian_new = {module = "blink.compat.source", name = "obsidian_new"}, obsidian_tags = {module = "blink.compat.source", name = "obsidian_tags"}, ripgrep = {module = "blink-ripgrep", name = "Ripgrep"}}}})
end
return {"blink.cmp", after = _1_, event = "BufEnter"}

-- [nfnl] ./fnl/plugins/init.fnl
vim.loader.enable()
local plugins = require("plugins.lz-spec")
return require("lz.n").load(plugins)

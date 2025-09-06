local M = {}

M.setup = function()
  local lspconfig = require("lspconfig")

  lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "nixCats" },
        },
        -- unfortunately we won't get nixCats autocomplete with this option
        -- off, but lazydev will be much faster
        --
        -- workspace = {
        --   -- Make the server aware of Neovim runtime files
        --   library = vim.api.nvim_get_runtime_file("", true),
        --   -- library =
        -- },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  })

  lspconfig.nixd.setup({
    nixd = {
      nixpkgs = {
        expr = [[import (builtins.getFlake ")]] .. nixCats("nixdExtras.nixpkgs") .. [[") { }   ]],
      },
      -- options = {
      --   nixos = {
      --     expr = [[(builtins.getFlake "]]
      --       .. nixCats("nixdExtras.flake-path")
      --       .. [[").nixosConfigurations."]]
      --       .. nixCats("nixdExtras.systemCFGname")
      --       .. [[".options]],
      --   },
      --   -- (builtins.getFlake "<path_to_system_flake>").homeConfigurations."<name>".options
      --   ["home-manager"] = {
      --     expr = [[(builtins.getFlake "]]
      --       .. nixCats("nixdExtras.flake-path")
      --       .. [[").homeConfigurations."]]
      --       .. nixCats("nixdExtras.homeCFGname")
      --       .. [[".options]],
      --   },
      -- },
    },
  })
  lspconfig.marksman.setup({})
  lspconfig.tinymist.setup({
    offset_encoding = "utf-8",
  })
  lspconfig.svelte.setup({})
  lspconfig.texlab.setup({})
  lspconfig.clangd.setup({})
  lspconfig.mesonlsp.setup({})
  lspconfig.nushell.setup({})
  lspconfig.harper_ls.setup({ settings = { ["harper-ls"] = { linters = { SentenceCapitalization = false } } } })
end

return M

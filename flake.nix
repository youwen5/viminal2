{
  description = "A Neovim configuration for the stubborn Nixian hacker";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";

    plugins-blink-ripgrep = {
      url = "github:mikavilpas/blink-ripgrep.nvim";
      flake = false;
    };

    plugins-pomo-nvim = {
      url = "github:epwalsh/pomo.nvim";
      flake = false;
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      nixCats,
      ...
    }@inputs:
    let
      inherit (nixCats) utils;
      luaPath = "${./.}";
      forEachSystem = utils.eachSystem nixpkgs.lib.platforms.all;
      extra_pkg_config = {
        # allowUnfree = true;
      };
      inherit
        (forEachSystem (
          system:
          let
            dependencyOverlays = (import ./nix/overlays.nix) ++ [
              # This overlay grabs all the inputs named in the format
              # `plugins-<pluginName>`
              # Once we add this overlay to our nixpkgs, we are able to
              # use `pkgs.neovimPlugins`, which is a set of our plugins.
              (utils.standardPluginOverlay inputs)
              # add any flake overlays here.
            ];
          in
          # these overlays will be wrapped with ${system}
          # and we will call the same utils.eachSystem function
          # later on to access them.
          {
            inherit dependencyOverlays;
          }
        ))
        dependencyOverlays
        ;
      # see :help nixCats.flake.outputs.categories
      # and
      # :help nixCats.flake.outputs.categoryDefinitions.scheme
      categoryDefinitions =
        {
          pkgs,
          settings,
          categories,
          name,
          ...
        }@packageDef:
        {
          # lspsAndRuntimeDeps: this section is for dependencies that should be
          # available at RUN TIME for plugins. Will be available to PATH within
          # neovim terminal this includes LSPs
          lspsAndRuntimeDeps = {
            general = with pkgs; [
              # essential
              ripgrep
              python312Packages.pylatexenc
              fd

              # lsps (minimal because should be provided per-project by nix, but the essentials are included).
              # The idea is that documents (Typst or markdown) and configuration files (TOML, JSON, Nix, etc) are bundled.
              # Everything else is provided per-project.

              nixd # nix language server
              tinymist # Typst
              marksman # markdown
              vale-ls # prose

              # formatters
              nixfmt-rfc-style # recommended nix formatter
              nodePackages_latest.prettier
              taplo # for TOML
              typstyle # for Typst
              rustfmt
              black # python
              stylua

              libnotify # required for pomo.nvim
              neovim-node-client # required for tailwind-tools-nvim's node component
              nodejs # ^^^
            ];
          };

          # install lz.n and treesitter grammars
          startupPlugins = {
            # gitPlugins = with pkgs.neovimPlugins; [ ];
            general = with pkgs.vimPlugins; [
              lz-n
              (nvim-treesitter.withPlugins (
                p:
                (with p; [
                  lua
                  fennel
                  c
                  javascript
                  typescript
                  rust
                  haskell
                  typst
                  latex
                  nix
                  json
                  toml
                  yaml
                  markdown
                  markdown_inline
                  svelte
                  css
                  html
                  vim
                  bash
                  make
                  gitcommit
                  jsonc
                  meson
                  nu
                  tsx
                  elm
                  purescript
                ])
              ))
              # for some reason trigger_load still fails to load this in the
              # proper order
              telescope-ui-select-nvim # replace default vim.ui.select with telescope
              telescope-fzf-native-nvim
            ];
          };

          # plugins which are installed, but not loaded, and will be handled by
          # lz.n (not necessarily lazy loaded)
          optionalPlugins = {
            gitPlugins = with pkgs.neovimPlugins; [
              blink-ripgrep # when you hit <C-g>, blink.cmp will rg through the whole project and use it for completions
              pomo-nvim # pomodoro timers
            ];
            general = with pkgs.vimPlugins; [

              # tools - stuff that adds entirely new functionality
              telescope-nvim
              neogit
              toggleterm-nvim
              undotree
              harpoon2
              mini-files
              oil-nvim

              # QoL - augments existing features to be a little nicer or adds some minor enhancements
              fidget-nvim # the best notifications. unintrusive. also does LSP progress.
              gitsigns-nvim # shows git changed areas in the sidebar
              dropbar-nvim # ide-like breadcrumbs
              mini-ai # adds additional 'a' and 'i' patterns (nothing to do with AI)
              mini-hipatterns # highlight surrounding patterns
              mini-surround # essential. adds 'sa', 'sr', 'sd', etc for surrounding
              vim-sleuth # identifies the indent style in the current file
              mini-bufremove # better buffer removal
              which-key-nvim # hints for keybinds
              nvim-autopairs # automatically pair (), {}, '''', etc

              # lsp / formatting
              trouble-nvim # shows diagnostics in a menu
              lsp_lines-nvim # shows LSP diagnostics in virtual text under the line
              nvim-lspconfig # configures language servers with sane defaults
              conform-nvim # polyglot formatting swiss army knife

              # bar
              lualine-nvim
              lsp-progress-nvim # adds LSP progress and attached LSPs to the bar

              # eye candy
              render-markdown-nvim # renders markdown. works in markdown files and also hover documentation.
              nvim-web-devicons # helps plugins display nerd font icons.
              indent-blankline-nvim # show indent guides
              mini-starter # dashboard

              # completion
              blink-compat # allow nvim-cmp sources to be used with blink
              blink-cmp # the fastest completions

              # productivity
              obsidian-nvim # obsidian zettelkasten workflows in nvim

              # misc
              plenary-nvim # utility functions in lua
              vim-wakatime # coding time tracking
              neocord # discord RPC

              # colorschemes
              rose-pine
              oxocarbon-nvim

              # fun
              cellular-automaton-nvim # a surprise!

              # -- language specific --

              # lua
              lazydev-nvim # lazy loaded lua_ls when developing neovim plugins and configuration

              # TeX
              # texpresso-vim # super fast live TeX preview

              # rust
              crates-nvim # provides intelligent features for Crates.toml
              rustaceanvim # better rust_analyzer experience

              # TS/JS
              typescript-tools-nvim # better typescript-language-server experience
              tailwind-tools-nvim # tailwindcss enhanacements and completions

              # cpp
              clangd_extensions-nvim

              # markdown
              markdown-preview-nvim # view markdown files rendered in a live updating browser window

              # typst
              typst-preview-nvim # view typst documents rendered in a live updating browser window

              # haskell
              haskell-tools-nvim

              # fennel
              nfnl

              # purescript
              purescript-vim
            ];
          };

          # shared libraries to be added to LD_LIBRARY_PATH
          # variable available to nvim runtime
          sharedLibraries = {
            general = with pkgs; [
              # libgit2
            ];
          };
        };
      packageDefinitions = {
        nvim =
          { pkgs, ... }:
          {
            settings = {
              wrapRc = true;
              aliases = [
                "vim"
                "vi"
              ];
            };
            categories = {
              general = true;
              gitPlugins = true;
              customPlugins = true;
              bin = {
                websocat = "${pkgs.websocat}/bin/websocat";
                tinymist = "${pkgs.tinymist}/bin/tinymist";
                # texpresso = "${pkgs.texpresso}/bin/texpresso";
                neovim-node-host = "${pkgs.neovim-node-client}/bin/neovim-node-host";
              };
              nixdExtras = {
                nixpkgs = inputs.nixpkgs.outPath;
                flake-path = inputs.self.outPath;
                system = pkgs.system;
              };
            };
          };
      };
      defaultPackageName = "nvim";
    in
    forEachSystem (
      system:
      let
        nixCatsBuilder = utils.baseBuilder luaPath {
          inherit
            nixpkgs
            system
            dependencyOverlays
            extra_pkg_config
            ;
        } categoryDefinitions packageDefinitions;
        defaultPackage = nixCatsBuilder defaultPackageName;
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages = utils.mkAllWithDefault defaultPackage;

        devShells = {
          default = pkgs.mkShell {
            name = defaultPackageName;
            packages =
              # [ defaultPackage ] ++
              (
                with pkgs;
                [
                  lua-language-server
                  nixfmt-rfc-style
                  stylua
                  fennel-ls
                  fennel
                  fnlfmt
                ]
              );
          };
        };

        formatter = pkgs.treefmt;
      }
    )
    // {
      overlays = utils.makeOverlays luaPath {
        inherit nixpkgs dependencyOverlays extra_pkg_config;
      } categoryDefinitions packageDefinitions defaultPackageName;

      nixosModules.default = utils.mkNixosModules {
        inherit
          defaultPackageName
          dependencyOverlays
          luaPath
          categoryDefinitions
          packageDefinitions
          extra_pkg_config
          nixpkgs
          ;
      };
      homeModule = utils.mkHomeModules {
        inherit
          defaultPackageName
          dependencyOverlays
          luaPath
          categoryDefinitions
          packageDefinitions
          extra_pkg_config
          nixpkgs
          ;
      };
      inherit utils;
      inherit (utils) templates;
    };

}

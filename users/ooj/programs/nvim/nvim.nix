{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      {
        plugin = snacks-nvim;
        type = "lua";
        config = builtins.readFile ./plugins/snacks.lua;
      }
      {
        plugin = which-key-nvim;
        type = "lua";
        config = builtins.readFile ./plugins/wk.lua;
      }
      {
        plugin = lualine-nvim;
        type = "lua";
        config = builtins.readFile ./plugins/lualine.lua;
      }
      {
        plugin = telescope-nvim;
        type = "lua";
        config = builtins.readFile ./plugins/telescope.lua;
      }
      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-lua
        ]));
        type = "lua";
        config = builtins.readFile ./plugins/treesitter.lua;
      }
      {
        plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile ./plugins/cmp.lua;
      }
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile ./plugins/lsp.lua;
      }
      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = builtins.readFile ./plugins/tree.lua;
      }
    ];
    extraLuaConfig = ''
      	${builtins.readFile ./config/remap.lua}
      	${builtins.readFile ./config/config.lua}
    '';
  };
}

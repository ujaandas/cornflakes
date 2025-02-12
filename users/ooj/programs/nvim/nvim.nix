{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      # no config
      telescope-fzf-native-nvim
      lualine-nvim
      nvim-web-devicons
      cmp-nvim-lsp

      # vimscript one-liner config

      # lua one-liner config

      # lua file config
      {
      	plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile ./plugins/lsp.lua;
      }
      {
      	plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile ./plugins/cmp.lua;
      }
      {
      	plugin = telescope-nvim;
        type = "lua";
        config = builtins.readFile ./plugins/telescope.lua;
      }
      {
        plugin = (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-vim
        p.tree-sitter-bash
        p.tree-sitter-lua
        p.tree-sitter-python
        p.tree-sitter-json
        ]));
        type = "lua";
        config = builtins.readFile ./plugins/treesitter.lua;
      }
    ];
    extraLuaConfig = builtins.readFile ./init.lua;
  };
}

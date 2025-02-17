require('nvim-treesitter.configs').setup {
  -- ensure_installed = { "c" }, -- DO NOT USE THIS! DOUBLE-DECLARATIVE == USELESS! BREAKING!!!

  auto_install = false,

  highlight = { enable = true },

  indent = { enable = true },
}
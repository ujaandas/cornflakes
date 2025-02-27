local tree = require("nvim-tree")

tree.setup{
  view = {
    width = 30,
    side = "right",
    mappings = {
      list = {
        { key = "R",                            action = "refresh" },
        { key = "a",                            action = "create" },
        { key = "d",                            action = "remove" },
        { key = "r",                            action = "rename" },
        { key = "x",                            action = "cut" },
        { key = "c",                            action = "copy" },
        { key = "p",                            action = "paste" },
        { key = "y",                            action = "copy_name" },
        { key = "Y",                            action = "copy_path" },
        { key = "ay",                           action = "copy_absolute_path" },
        { key = "[c",                           action = "prev_git_item" },
        { key = "]c",                           action = "next_git_item" },
      }
    }
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  renderer = {
    highlight_git = true,
    highlight_opened_files = "all",
    add_trailing = true,
    group_empty = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌"
        },
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        }
      }
    }
  }
}

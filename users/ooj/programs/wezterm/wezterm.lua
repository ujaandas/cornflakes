local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font configuration
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14.0

-- Color scheme
config.color_scheme = "Catppuccin Mocha"

-- Window configuration
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}
config.window_background_opacity = 0.99
config.text_background_opacity = 1.0
config.window_decorations = "TITLE | RESIZE"

-- Enable and customize tab bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false

-- Tab bar style
config.colors = {
  tab_bar = {
    background = "#1E1E2E",  -- Background color of the tab bar
    active_tab = {
      bg_color = "#89B4FA",  -- Background color of the active tab
      fg_color = "#1E1E2E",  -- Foreground color of the active tab
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#1E1E2E",  -- Background color of inactive tabs
      fg_color = "#A9B1D6",  -- Foreground color of inactive tabs
      intensity = "Normal",
    },
    inactive_tab_hover = {
      bg_color = "#89B4FA",  -- Background color when hovering over inactive tabs
      fg_color = "#1E1E2E",  -- Foreground color when hovering over inactive tabs
      intensity = "Bold",
    },
  },
}

-- Adjust tab bar appearance
config.tab_max_width = 250  -- Max width for tabs
config.use_fancy_tab_bar = false  -- Disable fancy tab bar for flat tabs

-- Cursor style
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 60

-- Scrollback
config.scrollback_lines = 5000

return config
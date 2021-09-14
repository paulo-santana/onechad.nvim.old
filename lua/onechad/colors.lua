local util = require("onechad.util")

local M = {}

---@param config Config
---@return ColorScheme
function M.setup(config)
  config = config or require("onechad.config")

  -- Color Palette
  ---@class ColorScheme
  local colors = {}

  colors = {
    none = "NONE",
    bg_dark = "#1b1f27",
    bg_darker = "#181B22",
    bg = "#1e222a",
    bg_highlight = "#252931",
    terminal_black = "#42464e",
    border = "#2a2e36",
    fg = "#abb2bf",
    fg_dark = "#9aa0ad",
    fg_gutter = "#30343c",
    dark3 = "#42464e",
    comment = "#565c64",
    dark5 = "#67737b",
    blue0 = "#44abdb",
    blue = "#61afef",
    blue1 = "#5cb3df",
    cyan = "#56b6cf",
    blue2 = "#5b89fc",
    blue5 = "#86b1d7",
    blue6 = "#B4F9F8",
    blue7 = "#394b70",
    magenta = "#bb9af7",
    magenta2 = "#ff75a0",
    purple = "#c882e7",
    orange = "#ef9a24",
    orange1 = "#f37b21",
    yellow = "#e5c07b",
    gold = "#ffa71a",
    green = "#98c379",
    green1 = "#a3be8c",
    green2 = "#7efa8c",
    teal = "#519aba",
    red = "#e06c75",
    red1 = "#db4b4b",
    git = { change = "#61afef", add = "#7eca9c", delete = "#e06c75", conflict = "#ff8e44" },
    gitSigns = { add = "#98c379", change = "#61afef", delete = "#e06c75" },
  }
  if config.style == "night" or config.style == "day" or vim.o.background == "light" then
    colors.bg = "#1a1b26"
  end
  util.bg = colors.bg
  util.day_brightness = config.dayBrightness

  colors.diff = {
    add = util.darken(colors.green2, 0.15),
    delete = util.darken(colors.red1, 0.65),
    change = util.darken(colors.blue7, 0.65),
    text = colors.blue7,
  }

  colors.gitSigns = {
    add = util.darken(colors.gitSigns.add, 0.7),
    change = util.darken(colors.gitSigns.change, 0.7),
    delete = util.darken(colors.gitSigns.delete, 0.7),
  }

  colors.git.ignore = colors.dark3
  colors.black = util.darken(colors.bg, 0.8, "#000000")
  colors.border_highlight = colors.border
  colors.border_highlight_lighter = util.brighten(colors.border, 0.2)
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = config.darkSidebar and colors.bg_dark or colors.bg
  colors.bg_float = config.darkFloat and colors.bg_dark or colors.bg

  colors.bg_visual = util.darken(colors.blue7, 0.7)
  colors.bg_search = colors.bg_darker
  colors.fg_sidebar = colors.fg_dark

  colors.error = colors.red1
  colors.warning = colors.yellow
  colors.info = colors.blue2
  colors.hint = colors.teal

  util.color_overrides(colors, config)

  if config.transform_colors and (config.style == "day" or vim.o.background == "light") then
    return util.light_colors(colors)
  end

  return colors
end

return M

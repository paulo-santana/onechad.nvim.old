local util = require("onechad.util")
local theme = require("onechad.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M

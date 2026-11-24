get_visual_selection = function() 
  local vstart = vim.fn.getpos("v")
  local vend = vim.fn.getpos(".")
  local mode = vim.fn.mode()
  local lines = vim.fn.getregion(vstart, vend, { type = mode })
  return table.concat(lines, "\n")
end

require("options")
require("keymap")
require("plugins")
require("config")

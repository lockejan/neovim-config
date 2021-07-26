local view = require "nvim-tree.view"
local tree = {}

tree.open = function()
  require "bufferline.state".set_offset(51, "FileTree")
  require "nvim-tree".find_file(true)
end

tree.close = function()
  require "bufferline.state".set_offset(0)
  require "nvim-tree".close()
end

tree.toggle_tree = function()
  if view.win_open() then
    require "nvim-tree".close()
    require "bufferline.state".set_offset(0)
  else
    require "bufferline.state".set_offset(51, "File Explorer")
    require "nvim-tree".find_file(true)
  end
end

return tree

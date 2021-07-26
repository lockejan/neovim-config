local utils = require("utils")
-- local cmd = vim.cmd

utils.opt("o", "termguicolors", true)
-- cmd 'colorscheme nord'

-- vim.g.gruvbox_italic = 1

-- Example config in lua
-- vim.g.nord_contrast = true
-- vim.g.nord_borders = false
-- vim.g.nord_disable_background = false

-- -- Load the colorscheme
-- require('nord').set()

-- Example config in Lua
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = {hint = "orange", error = "#ff0000"}

-- Load the colorscheme
vim.cmd [[colorscheme tokyonight]]

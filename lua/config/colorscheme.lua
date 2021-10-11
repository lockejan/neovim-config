local utils = require("utils")

utils.opt("o", "termguicolors", true)

vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_italic_variables = false
vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = {hint = "orange", error = "#ff0000"}

-- -- Example config in lua
-- vim.g.nord_contrast = false
-- vim.g.nord_borders = true
-- vim.g.nord_disable_background = true
-- vim.g.nord_italic = true

-- Load the colorscheme
vim.cmd [[colorscheme tokyonight]]

-- require("nord").set()
-- require("monokai").setup {}
-- require('monokai').setup { palette = require('monokai').pro }
-- require('monokai').setup { palette = require('monokai').soda }

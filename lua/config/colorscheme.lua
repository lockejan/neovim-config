local utils = require("utils")

utils.opt("o", "termguicolors", true)

-- vim.g.tokyonight_style = "storm"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- vim.g.tokyonight_colors = {hint = "orange", error = "#ff0000"}

vim.g.nord_contrast = true
-- vim.g.nord_borders = true
vim.g.nord_disable_background = false

-- Load the colorscheme
require("nord").set()

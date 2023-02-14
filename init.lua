local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("keymappings")
require("lazy").setup("plugins")

-- Sensible defaults
require("settings")

-- Core
require("lsp")
require("treesitter")
require("colors")

-- Plugin config
require("config.cmp")
require("config.lir")
require("config.colorizer")
require("config.comment")
require("config.diffview")
-- require("config.fidget")
require("config.formatter")
require("config.gitsigns")
require("config.indent-blankline")
require("config.lualine")
require("config.nvim-dap")
require("config.nvim-lint")
-- require("config.nvim-tree")
require("config.telescope")
require("config.trouble")
require("config.which-key")
require("perfanno").setup()

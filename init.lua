vim.g.mapleader = " "
vim.g.maplocalleader = ","

local fn = vim.fn
local exec = vim.api.nvim_command

-- Sensible defaults
require("settings")

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  exec("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd "autocmd BufWritePost luafile plugins.lua PackerSync" -- Auto compile when there are changes in plugins.lua

-- Install plugins
require("plugins")

-- Key mappings
require("keymappings")

-- Setup Lua language server using submodule
require("lsp")

-- treesitter config
require("treesitter")

-- Autoformat lua code on write
vim.cmd "autocmd BufWritePre *.lua FormatWrite"

-- require('config')
require("config.colorscheme")
require("config.completion")
require("config.diffview")
require("config.fugitive")
require("config.gitsigns")
require("config.lspsaga")
require("config.lualine")
require("config.telescope")
require("config.trouble")
require("config.web-devicons")
require("config.which-key")
require("config.tree")
require("config.formatter")
require("config.nvim-tree")
-- require("config.tokyonight")

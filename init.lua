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
-- Auto compile when there are changes in plugins.lua
vim.cmd "autocmd BufWritePost luafile plugins.lua PackerSync"

-- Install plugins
require("plugins")

-- Key mappings
require("keymappings")

-- Setup Lua language server using submodule
require("lsp")

-- treesitter config
require("treesitter")

-- require("config.bufferline")
-- require("config.lspsaga")
require("config.cmp")
require("config.colorscheme")
require("config.diffview")
require("config.formatter")
require("config.fugitive")
require("config.gitsigns")
require("config.lualine")
require("config.nvim-autotag")
require("config.nvim-tree")
require("config.telescope")
require("config.treesitter-context")
require("config.trouble")
require("config.web-devicons")
require("config.which-key")

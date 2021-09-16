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

-- require('config')
-- require("config.completion")
-- require("config.galaxyline")
-- require("config.lspsaga")
-- require("config.tokyonight")
-- require("config.tree")
-- require("config.bufferline")
require("config.colorizer")
require("config.colorscheme")
require("config.compe")
-- require("config.diffview")
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

function _G.lsp_reinstall_all()
  local lspinstall = require "lspinstall"
  for _, server in ipairs(lspinstall.installed_servers()) do
    lspinstall.install_server(server)
  end
end

vim.cmd "command! -nargs=0 LspReinstallAll call v:lua.lsp_reinstall_all()"

local fn = vim.fn
local exec = vim.api.nvim_command

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  exec("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

-- Setup plugins
require("plugins")

-- Sensible defaults
require("settings")
require("config.trailing")

-- Key mappings
require("keymappings")
require("config.which-key")

-- Language Server Setup
require("lsp")
require("config.cmp")
require("config.trouble")
require("config.formatter")

-- treesitter config
require("treesitter")

-- Git tools
require("config.gitsigns")
require("config.diffview")

-- File handling and exploring
require("config.lualine")
require("config.nvim-tree")
require("config.telescope")

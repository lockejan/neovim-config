-- Auto install packer.nvim if not exists
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.api.nvim_exec(
  [[ augroup Packer
autocmd!
autocmd BufWritePost init.lua PackerCompile
augroup end ]],
  false
)

-- Sensible defaults
require("settings")

-- Setup plugins
require("plugins")
-- require("config.trailing")

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

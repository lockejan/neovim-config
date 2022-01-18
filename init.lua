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

-- Core
require("keymappings")
require("lsp")
require("treesitter")

-- Plugin config
require("config.cmp")
require("config.diffview")
require("config.formatter")
require("config.gitsigns")
require("config.indent-blankline")
require("config.lualine")
require("config.nvim-tree")
require("config.telescope")
require("config.trouble")
require("config.which-key")

-- Auto install packer.nvim if not exists
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

-- impatient
require("impatient")

-- Setup plugins
require("plugins")

-- Sensible defaults
require("settings")

-- Core
require("keymappings")
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

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Load keymappings early (before plugins, as leader key needs to be set)
require("keymappings")

-- Setup lazy.nvim with modular plugin imports
require("lazy").setup({
  spec = {
    -- Import all plugin specs from lua/plugins/*.lua
    { import = "plugins" },
  },
  install = {
    missing = true,
  },
  change_detection = {
    enabled = true,
    notify = true,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "netrwPlugin",
      },
    },
  },
})

-- Sensible defaults (general vim settings)
require("settings")

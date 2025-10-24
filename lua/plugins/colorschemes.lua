-- Colorscheme plugins
-- All colorschemes are lazy-loaded (only the active one will actually load)

return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
  },

  {
    "shaunsingh/nord.nvim",
    lazy = true,
  },

  {
    "andersevenrud/nordic.nvim",
    lazy = true,
  },

  {
    "glepnir/zephyr-nvim",
    lazy = true,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- Load immediately (this is our active colorscheme)
    priority = 1000, -- Load before other plugins
    config = function()
      -- Activate the colorscheme
      vim.cmd("colorscheme kanagawa")
    end,
  },

  {
    "sainnhe/everforest",
    lazy = true,
  },

  {
    "navarasu/onedark.nvim",
    lazy = true,
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    priority = 1000,
    opts = {}, -- Use default options
  },
}

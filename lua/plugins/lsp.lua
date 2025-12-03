-- LSP and language server related plugins

return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "b0o/schemastore.nvim",
      "hrsh7th/cmp-nvim-lsp", -- Needed for capabilities in lua/lsp.lua
    },
    config = function()
      require("lsp")
    end,
  },

  -- JSON/YAML schema support
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },

  -- Rust support via rustaceanvim (replaces rust-tools.nvim)
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false, -- This plugin is already lazy
    ft = { "rust" },
  },

  -- Lua development
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  -- Lua REPL for Neovim development
  {
    "bfredl/nvim-luadev",
    cmd = { "Luadev" },
  },

  -- LSP progress UI
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {},
  },

  -- Highlight symbol under cursor
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("illuminate").configure({
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
          providers = { "lsp" },
        },
      })
    end,
  },

  -- Symbols outline sidebar
  {
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
    opts = {},
  },

  -- Quick LSP warnings+errors navigation
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TroubleToggle" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  -- Code action indicator
  {
    "kosayoda/nvim-lightbulb",
    event = { "CursorHold", "CursorHoldI" },
    dependencies = { "antoinemadec/FixCursorHold.nvim" },
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = { enabled = true },
      })
    end,
  },

  -- EditorConfig support
  {
    "gpanders/editorconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Helm chart support
  {
    "towolf/vim-helm",
    ft = "helm",
  },

  -- Nix language support
  {
    "LnL7/vim-nix",
    ft = "nix",
  },
}

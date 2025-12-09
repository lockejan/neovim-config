-- UI enhancement plugins

return {
  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = "|",
        section_separators = "",
        disabled_filetypes = {},
        always_divide_middle = true,
      },
      sections = {
        lualine_c = {
          {
            "filename",
            file_status = true,
            path = 0, -- 0: Just the filename, 1: Relative path, 2: Absolute path
            shorting_target = 40,
            symbols = {
              modified = "[+]",
              readonly = "[-]",
              unnamed = "[No Name]",
            },
          },
        },
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- Keymap helper
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = 500, -- Time in ms to wait before showing which-key (default is 1000)
    },
  },

  -- Diagnostics and quickfix UI
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Trouble diagnostics" },
      { "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
      { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Document diagnostics" },
      { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list" },
      { "gR", "<cmd>Trouble lsp_references toggle<cr>", desc = "LSP references" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  -- LSP progress notifications
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    tag = "legacy",
    opts = {},
  },

  -- Better vim.ui interfaces (dressing.nvim is archived, using snacks.nvim instead)
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- Enable input and picker modules for vim.ui replacements
      input = { enabled = true },
      picker = {
        enabled = true,
        ui_select = true, -- This replaces vim.ui.select with snacks picker
      },
      notifier = { enabled = true },
      quickfile = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = true },
    },
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    opts = {},
  },

  -- Color highlighter
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },

  -- Cheatsheet
  {
    "sudormrfbin/cheatsheet.nvim",
    cmd = { "Cheatsheet", "CheatsheetEdit" },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
  },

  -- Alternative statusline integration (commented)
  -- { "nvim-lua/lsp-status.nvim" },
}

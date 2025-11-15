-- Editor enhancement plugins for text manipulation, navigation, and editing

return {
  -- Commenting with context awareness
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },

  -- Autopair brackets, quotes, etc.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Surround text objects with brackets, quotes, tags
  {
    "tpope/vim-surround",
    keys = { "ys", "cs", "ds", "S" },
  },

  -- Additional text objects (e.g., da,, di,, etc.)
  {
    "wellle/targets.vim",
    event = { "BufReadPost", "BufNewFile" },
  },

  -- CamelCase and snake_case motion support
  {
    "bkad/CamelCaseMotion",
    keys = {
      { "<leader>w", "<Plug>CamelCaseMotion_w", mode = { "n", "x", "o" }, desc = "CamelCase word forward" },
      { "<leader>b", "<Plug>CamelCaseMotion_b", mode = { "n", "x", "o" }, desc = "CamelCase word backward" },
      { "<leader>e", "<Plug>CamelCaseMotion_e", mode = { "n", "x", "o" }, desc = "CamelCase word end" },
    },
  },

  -- Extend repeat (.) functionality for plugin mappings
  {
    "tpope/vim-repeat",
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Smart incrementing for dates and numbers
  {
    "tpope/vim-speeddating",
    keys = { "<C-a>", "<C-x>" },
  },

  -- Quick navigation with leap motions
  -- TODO: Consider switching to flash.nvim for better match traversal features
  -- flash.nvim offers tab/s-tab cycling between matches, which leap doesn't support
  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "<leader>s", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gS", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function()
      -- Manual mappings (non-deprecated approach)
      -- Note: S is NOT mapped to preserve native vim command (substitute line)
      -- Note: gs is NOT mapped to avoid conflict with switch.vim
      vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
      vim.keymap.set({ "n", "x", "o" }, "<leader>s", "<Plug>(leap-backward)")
      vim.keymap.set({ "n", "x", "o" }, "gS", "<Plug>(leap-from-window)")
    end,
  },

  -- Split and join code blocks (e.g., one-line to multi-line)
  {
    "AndrewRadev/splitjoin.vim",
    keys = {
      { "gJ", desc = "Join code block" },
      -- gS is used by leap.nvim, use <leader>gS instead
      { "<leader>gS", "<cmd>SplitjoinSplit<cr>", desc = "Split code block" },
    },
  },

  -- Switch between predefined cases (e.g., true/false, yes/no)
  {
    "AndrewRadev/switch.vim",
    keys = {
      { "gs", "<cmd>Switch<cr>", desc = "Switch case" },
    },
  },

  -- Multi-cursor editing
  {
    "mg979/vim-visual-multi",
    keys = {
      { "<C-n>", mode = { "n", "x" }, desc = "Add cursor and move to next match" },
      { "<C-Down>", mode = { "n", "i" }, desc = "Add cursor down" },
      { "<C-Up>", mode = { "n", "i" }, desc = "Add cursor up" },
    },
  },

  -- EditorConfig support
  {
    "gpanders/editorconfig.nvim",
    event = { "BufReadPost", "BufNewFile" },
  },

  -- Temporary maximize current split
  {
    "szw/vim-maximizer",
    cmd = { "MaximizerToggle" },
    keys = {
      { "<leader>m", "<cmd>MaximizerToggle!<cr>", desc = "Toggle maximize split" },
    },
  },

  -- Highlight word under cursor and other occurrences
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },

  -- Code outline sidebar
  {
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    keys = {
      { "<leader>so", "<cmd>SymbolsOutline<cr>", desc = "Toggle symbols outline" },
    },
    opts = {},
  },

  -- Parinfer for Lisp/Clojure structural editing
  {
    "gpanders/nvim-parinfer",
    ft = { "clojure", "lisp", "scheme" },
  },
}

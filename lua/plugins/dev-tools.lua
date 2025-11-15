-- Development tools and utilities

return {
  -- Testing framework integration
  {
    "vim-test/vim-test",
    keys = {
      { "t<C-n>", "<cmd>TestNearest<CR>", desc = "Test nearest" },
      { "t<C-f>", "<cmd>TestFile<CR>", desc = "Test file" },
      { "t<C-s>", "<cmd>TestSuite<CR>", desc = "Test suite" },
      { "t<C-l>", "<cmd>TestLast<CR>", desc = "Test last" },
      { "t<C-v>", "<cmd>TestVisit<CR>", desc = "Visit test file" },
    },
  },

  -- GitHub Copilot integration
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },

  -- Copilot Chat interface
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatToggle",
      "CopilotChatExplain",
      "CopilotChatReview",
      "CopilotChatFix",
      "CopilotChatOptimize",
      "CopilotChatDocs",
      "CopilotChatTests",
    },
    opts = {
      debug = true,
    },
  },

  -- SOPS encrypted files support
  {
    "lucidph3nx/nvim-sops",
    event = { "BufEnter" },
    opts = {},
  },

  -- Floating terminal
  {
    "voldikss/vim-floaterm",
    keys = {
      { "<leader>tt", "<cmd>FloatermToggle<CR>", desc = "Toggle floating terminal" },
    },
    cmd = { "FloatermNew", "FloatermToggle" },
  },

  -- Multicursor support
  {
    "mg979/vim-visual-multi",
    keys = {
      { "<C-n>", mode = { "n", "v" } },
      { "<C-Down>", mode = { "n", "v" } },
      { "<C-Up>", mode = { "n", "v" } },
    },
  },

  -- Performance profiling annotations
  {
    "t-troebst/perfanno.nvim",
    cmd = {
      "PerfLoadFlat",
      "PerfLoadCallGraph",
      "PerfLoadFlameGraph",
      "PerfLuaProfileStart",
      "PerfLuaProfileStop",
    },
  },

  -- Treesitter playground for debugging
  {
    "nvim-treesitter/playground",
    cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  -- Parinfer for Lisp-like languages
  {
    "gpanders/nvim-parinfer",
    ft = { "clojure", "fennel", "lisp", "scheme" },
  },
}

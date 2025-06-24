local opts = {
  install = {
    missing = true,
  },
  change_detection = {
    enabled = false,
    notify = true,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "netrwPlugin",
      },
    },
  },
}

require("lazy").setup({
  {
    "mfussenegger/nvim-lint",
  },
  -- { "milisims/nvim-luaref" },
  -- { "nanotee/luv-vimdocs" },
  --  {'hkupty/runes.nvim'}, -- test-framework for nvim-lua-plugins
  -- homecooked
  -- { "~/plugins/broccoli.nvim" },
  -- ui tool to interact with ansible-vault
  -- { '~/plugins/ansible.nvim' },
  -- ui tool to interact with git-team
  -- { '~/plugins/git-team.nvim' },
  --
  {
    "lucidph3nx/nvim-sops",
    event = { "BufEnter" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  -- Color schemes
  { "folke/tokyonight.nvim" },
  { "shaunsingh/nord.nvim" },
  { "andersevenrud/nordic.nvim" },
  { "glepnir/zephyr-nvim" },
  { "rebelot/kanagawa.nvim" },
  { "sainnhe/everforest" },
  { "navarasu/onedark.nvim" },
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },

  -- Fuzzy finding stuff via telescope
  { "fhill2/telescope-ultisnips.nvim" },
  -- { "nvim-telescope/telescope-packer.nvim" },
  { "nvim-telescope/telescope-symbols.nvim" },
  -- {"dhruvmanila/telescope-bookmarks.nvim"},
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  -- { "ibhagwan/fzf-lua" },
  -- { "vijaymarupudi/nvim-fzf" },
  { "jremmen/vim-ripgrep" },

  -- essentials: telescope, nvim-lspconfig, nvim-dap
  -- LSP and completion
  -- simplify usage of lsps
  -- {"williamboman/mason.nvim"},
  { "neovim/nvim-lspconfig" },

  -- { "github/copilot.vim" },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       keymap = {
  --         jump_prev = "[[",
  --         jump_next = "]]",
  --         accept = "<TAB>",
  --         refresh = "gr",
  --         open = "<M-CR>",
  --       },
  --       suggestion = {
  --         auto_trigger = true,
  --       },
  --     })
  --   end,
  -- },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "github/copilot.vim" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },

  { "simrat39/rust-tools.nvim" },
  -- {"tpope/vim-projectionist"},

  -- execute tests
  { "vim-test/vim-test" },
  -- vim.g["test#strategy"] = "neovim"

  -- java lsp support
  -- { "mfussenegger/nvim-jdtls" },

  -- indentation guides
  { "lukas-reineke/indent-blankline.nvim" },
  -- { "tpope/vim-sleuth" },

  -- automatic closing Syntax
  { "RRethy/nvim-treesitter-endwise" },

  -- schema support
  { "b0o/schemastore.nvim" },

  { "j-hui/fidget.nvim", tag = "legacy" },
  -- {"nvim-lua/lsp-status.nvim"}, -- statusline integration from lsp
  -- navigate and highlight symbols via lsp
  { "RRethy/vim-illuminate" },

  { "towolf/vim-helm" },

  -- improved and extended lsp integration
  -- decoration and code actions
  -- use "glepnir/lspsaga.nvim"

  -- Easy LS installation
  -- {"williamboman/nvim-lsp-installer"},

  -- Editor-config
  { "gpanders/editorconfig.nvim" },

  -- autopair of brackets on insert
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- LSP Autocompletion plugin
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- "f3fora/cmp-spell",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      -- "hrsh7th/nvim-pasta",
      "hrsh7th/cmp-path",
      "quangnguyen30192/cmp-nvim-ultisnips",
      "David-Kunz/cmp-npm",
      "andersevenrud/cmp-tmux",
      "dmitmel/cmp-digraphs",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      -- "rcarriga/cmp-dap",
      -- "KadoBOT/cmp-plugins", -- sources for nvim plugins
      -- "davidsierradz/cmp-conventionalcommits",
      -- { "PaterJason/cmp-conjure" },
    },
  },
  -- clojure
  -- { "Olical/conjure" },
  -- {"liquidz/vim-iced"},

  -- db interaction within vim
  -- {"tpope/vim-dadbod"},

  -- pictograms for LSP completion
  { "onsails/lspkind-nvim" },

  -- sidebar with ooutlines
  { "simrat39/symbols-outline.nvim" },

  -- quick LSP warnings+errors navigation
  { "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons" },

  -- Lua development
  { "folke/lua-dev.nvim" },
  { "bfredl/nvim-luadev" },

  -- custom formatter on save
  { "mhartington/formatter.nvim" },

  -- Vim dispatch
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- file explorer and interaction
  { "tpope/vim-vinegar" }, -- improved netrw
  -- {"justinmk/vim-dirvish"},
  -- {"justinmk/vim-sneak"},

  { "LnL7/vim-nix" },
  -- unix commands for vim
  { "tpope/vim-eunuch" },
  -- quickfix nav mappings and more
  { "tpope/vim-unimpaired" },

  -- lua file explorer
  { "nvim-tree/nvim-tree.lua" },

  -- autochange to project root dir
  -- {"airblade/vim-rooter"},
  -- recent project navigation and chdir to project rooter
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({})
    end,
  },

  -- Git Features
  -- git wrapper on steroids
  { "tpope/vim-fugitive" },
  -- {
  --   "TimUntersberger/neogit",
  --   dependencies = "nvim-lua/plenary.nvim",
  --   config = function()
  --     require("neogit").setup({
  --       integrations = {
  --         diffview = true,
  --       },
  --     })
  --   end,
  -- },

  -- git history navigation
  -- {"junegunn/gv.vim"},
  { "sindrets/diffview.nvim" },

  -- Browse git-repos on GH,...
  { "tpope/vim-rhubarb" },

  -- file change indication for git
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Syntax + Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  -- smart rename in scope/file, go to ref/def/usage
  { "nvim-treesitter/nvim-treesitter-refactor" },
  -- displays head of scope on top (e.g. fn/class/method)
  { "romgrk/nvim-treesitter-context" },
  -- colorize parentheses
  { "HiPhish/rainbow-delimiters.nvim" },
  -- additional textobjects for functions, classes,...
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  -- match parentheses and scopes to quickly jump between them
  -- {
  --   "andymass/vim-matchup",
  --   event = "CursorMoved",
  -- },

  -- additional text objects e.g. da,
  { "wellle/targets.vim" },
  { "bkad/CamelCaseMotion" },

  -- open gpg encrypted files securely
  -- {"jamessan/vim-gnupg"},

  -- save/restore vim-session
  -- { "tpope/vim-obsession" },

  -- autoclose html/tsx/...-tags
  { "windwp/nvim-ts-autotag" },

  -- comment codeblocks even in mixed environments
  { "JoosepAlviste/nvim-ts-context-commentstring" },

  -- extensible lua statusline inspired by airline
  { "nvim-lualine/lualine.nvim" },

  -- temporary maximize current split
  { "szw/vim-maximizer" },

  -- commenting using motions
  -- {"tpope/vim-commentary"},
  { "numToStr/Comment.nvim" },
  -- use "b3nj5m1n/kommentary"

  -- surround textobjects with literals using motions
  { "tpope/vim-surround" },

  -- split navigation between vim and tmux
  -- {"christoomey/vim-tmux-navigator"},

  -- {"norcalli/nvim-colorizer.lua"},
  { "NvChad/nvim-colorizer.lua" },

  -- Helpers + Cheatsheet
  { "folke/which-key.nvim" },
  { "sudormrfbin/cheatsheet.nvim" },

  -- decrypt and encrypt ansible-vault stuff
  -- use "danihodovic/vim-ansible-vault"

  -- extend repeatability of motions
  { "tpope/vim-repeat" },

  -- smarter vim-based increasements of dates and numbers
  { "tpope/vim-speeddating" },

  -- improved pattern matching and instant switch case for vars
  -- {"tpope/vim-abolish"},

  -- preview rendered markdown files
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter", --[[ "echasnovski/mini.nvim" ]]
    }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
    end,
  },

  --ui-enhancements
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({})
    end,
  },

  -- SNIPPETS
  { "SirVer/ultisnips" },
  { "honza/vim-snippets" },

  -- TODO TEST
  --  use { 'rcarriga/nvim-notify' }
  -- use { 'jamestthompson3/nvim-remote-containers' } -- Develop inside docker containers
  -- use { 'CRAG666/code_runner.nvim' } -- executor / code runner
  -- use {'nvim-treesitter/nvim-tree-docs'} -- add docs with treesitter
  --  use {'Chaitanyabsprip/present.nvim'}

  -- GH browser
  -- {
  --   "pwntester/octo.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   config = function()
  --     require("octo").setup({ default_remote = { "upstream", "origin", "source", "lockejan" } })
  --   end,
  -- },
  { "mfussenegger/nvim-lint" },
  -- DEBUG
  -- Debugging
  { "nvim-neotest/nvim-nio" },
  { "mfussenegger/nvim-dap" },
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
  },
  -- use({ "mfussenegger/nvim-dap-python", config = function ()
  --         require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
  --     end })
  -- { "nvim-telescope/telescope-dap.nvim" },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  -- { "https://github.com/HiPhish/debugpy.nvim" },
  -- { "jbyuki/one-small-step-for-vimkind" },
  { "nvim-treesitter/playground" },
  { "gpanders/nvim-parinfer" },
  { "ggandor/leap.nvim" }, -- quick moves

  { "AndrewRadev/splitjoin.vim", keys = { "gJ", "gS" } },
  -- use gs to switch predefined cases, e.g. booleans
  { "AndrewRadev/switch.vim" },

  -- {"cormacrelf/dark-notify"},
  -- {"jubnzv/virtual-types.nvim"}, -- virtaul type hints
  -- {"weilbith/nvim-code-action-menu"},
  {
    "kosayoda/nvim-lightbulb",
    dependencies = "antoinemadec/FixCursorHold.nvim",
  }, -- indicate code actions

  -- file explorer
  { "tamago324/lir.nvim" },
  -- {
  --   "stevearc/oil.nvim",
  --   ---@module 'oil'
  --   ---@type oil.SetupOpts
  --   opts = {},
  --   -- Optional dependencies
  --   dependencies = { { "echasnovski/mini.icons", opts = {} } },
  --   -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  -- },

  -- floating window with terminal
  { "voldikss/vim-floaterm" },

  -- multicursors
  { "mg979/vim-visual-multi" },

  { "t-troebst/perfanno.nvim" },
  -- {"windwp/nvim-spectre"},
  -- improve snap for autocmd relying plugins
  -- {
  --   "antoinemadec/FixCursorHold.nvim",
  --   run = function()
  --     vim.g.curshold_updatime = 1000
  --   end,
  -- },

  -- {
  --   "NTBBloodbath/rest.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("rest-nvim").setup({
  --       -- Open request results in a horizontal split
  --       result_split_horizontal = false,
  --       -- Keep the http file buffer above|left when split horizontal|vertical
  --       result_split_in_place = false,
  --       -- Skip SSL verification, useful for unknown certificates
  --       skip_ssl_verification = false,
  --       -- Highlight request on run
  --       highlight = {
  --         enabled = true,
  --         timeout = 150,
  --       },
  --       result = {
  --         -- toggle showing URL, HTTP info, headers at top the of result window
  --         show_url = true,
  --         show_http_info = true,
  --         show_headers = true,
  --       },
  --       -- Jump to request line on run
  --       jump_to_request = false,
  --       env_file = ".env",
  --       custom_dynamic_variables = {},
  --       yank_dry_run = true,
  --     })
  --   end,
  -- },

  -- { "neovimhaskell/haskell-vim", ft = "haskell" },
}, opts)

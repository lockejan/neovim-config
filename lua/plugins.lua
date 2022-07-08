vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- improve startup
  use({ "lewis6991/impatient.nvim" })

  -- Packer can manage itself as an optional plugin
  use({ "wbthomason/packer.nvim", opt = true })

  -- Color schemes
  use("shaunsingh/nord.nvim")
  use("sainnhe/everforest")
  use("navarasu/onedark.nvim")

  -- multicursors
  use({ "mg979/vim-visual-multi" })

  -- Fuzzy finding stuff via telescope
  use("fhill2/telescope-ultisnips.nvim")
  use("nvim-telescope/telescope-packer.nvim")
  -- use("dhruvmanila/telescope-bookmarks.nvim")
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
  })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  -- use({ "jremmen/vim-ripgrep" })

  -- essentials: telescope, nvim-lspconfig, nvim-dap
  -- LSP and completion
  -- simplify usage of lsps
  use("neovim/nvim-lspconfig")
  -- use("tpope/vim-projectionist")
  use("vim-test/vim-test")
  -- use("mfussenegger/nvim-jdtls")

  -- indentation guides
  use("lukas-reineke/indent-blankline.nvim")
  -- use({ "tpope/vim-sleuth" })

  -- automatic closing Syntax
  use({ "RRethy/nvim-treesitter-endwise" })

  -- schema support
  use({ "b0o/schemastore.nvim" })

  -- use({ "j-hui/fidget.nvim" })
  -- use "nvim-lua/lsp-status.nvim"
  use({ "RRethy/vim-illuminate" })

  -- improved and extended lsp integration
  -- decoration and code actions
  -- use "glepnir/lspsaga.nvim"

  -- Easy LS installation
  -- use("williamboman/nvim-lsp-installer")

  -- Editor-config
  use({ "gpanders/editorconfig.nvim" })

  -- autopair of brackets on insert
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })

  -- LSP Autocompletion plugin
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      -- "f3fora/cmp-spell",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "quangnguyen30192/cmp-nvim-ultisnips",
      "David-Kunz/cmp-npm",
      "andersevenrud/cmp-tmux",
      "dmitmel/cmp-digraphs",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "davidsierradz/cmp-conventionalcommits",
    },
  })
  -- clojure
  -- use("Olical/conjure")

  -- db interaction within vim
  -- use("tpope/vim-dadbod")

  -- pictograms for LSP completion
  use("onsails/lspkind-nvim")

  -- sidebar with ooutlines
  -- use("simrat39/symbols-outline.nvim")

  -- quick LSP warnings+errors navigation
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  })

  -- Lua development
  use("folke/lua-dev.nvim")
  -- use("bfredl/nvim-luadev")

  -- custom formatter on save
  use("mhartington/formatter.nvim")

  -- Vim dispatch
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- file explorer and interaction
  use("tpope/vim-vinegar") -- improved netrw
  -- use("justinmk/vim-dirvish")
  -- use("justinmk/vim-sneak")

  -- unix commands for vim
  use("tpope/vim-eunuch")
  use("tpope/vim-unimpaired")

  -- lua file explorer
  -- use("kyazdani42/nvim-tree.lua")

  -- autochange to project root dir
  -- use("airblade/vim-rooter")
  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({})
    end,
  })

  -- Git features
  -- git wrapper on steroids
  use("tpope/vim-fugitive")

  -- git history navigation
  use("junegunn/gv.vim")
  use("sindrets/diffview.nvim")

  -- Browse git-repos on GH,...
  -- use("tpope/vim-rhubarb")

  -- file change indication for git
  use({
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  -- Syntax + Treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  -- smart rename in scope/file, go to ref/def/usage
  use("nvim-treesitter/nvim-treesitter-refactor")
  -- displays head of scope on top (e.g. fn/class/method)
  use("romgrk/nvim-treesitter-context")
  -- colorize parentheses
  use("p00f/nvim-ts-rainbow")
  -- additional textobjects for functions, classes,...
  use("nvim-treesitter/nvim-treesitter-textobjects")
  -- match parentheses and scopes to quickly jump between them
  -- use({
  --   "andymass/vim-matchup",
  --   event = "CursorMoved",
  -- })

  -- additional text objects e.g. da,
  -- use "wellle/targets.vim"

  -- open gpg encrypted files securely
  -- use("jamessan/vim-gnupg")

  -- save/restore vim-session
  use("tpope/vim-obsession")

  -- autoclose html/tsx/...-tags
  use("windwp/nvim-ts-autotag")

  -- comment codeblocks even in mixed environments
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- extensible lua statusline inspired by airline
  use("nvim-lualine/lualine.nvim")

  -- temporary maximize current split
  use("szw/vim-maximizer")

  -- commenting using motions
  -- use("tpope/vim-commentary")
  use("numToStr/Comment.nvim")
  -- use "b3nj5m1n/kommentary"

  -- surround textobjects with literals using motions
  use("tpope/vim-surround")

  -- split navigation between vim and tmux
  -- use("christoomey/vim-tmux-navigator")

  -- use("norcalli/nvim-colorizer.lua")

  -- Helpers + Cheatsheet
  use("folke/which-key.nvim")
  use("sudormrfbin/cheatsheet.nvim")

  -- decrypt and encrypt ansible-vault stuff
  -- use "danihodovic/vim-ansible-vault"

  -- extend repeatability of motions
  use("tpope/vim-repeat")

  -- smarter vim-based increasements of dates and numbers
  use("tpope/vim-speeddating")

  -- improved pattern matching and instant switch case for vars
  -- use("tpope/vim-abolish")

  -- preview rendered markdown files
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
    end,
  })

  --ui-enhancements
  use({
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({})
    end,
  })

  -- SNIPPETS
  use("SirVer/ultisnips")
  use("honza/vim-snippets")

  -- DEBUG
  -- use({ "mfussenegger/nvim-dap" })
  -- use({ "mfussenegger/nvim-dap-python" })
  -- use({ "nvim-telescope/telescope-dap.nvim" })
  -- use("theHamsta/nvim-dap-virtual-text")
  -- use({ "puremourning/vimspector" })
end)

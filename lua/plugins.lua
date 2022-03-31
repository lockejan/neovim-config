vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself as an optional plugin
  use({ "wbthomason/packer.nvim", opt = true })

  -- improve startup
  use({ "lewis6991/impatient.nvim" })

  -- lua-based filetype to speedup starttime
  use("nathom/filetype.nvim")

  -- Color schemes
  -- use { 'sainnhe/gruvbox-material' }
  -- use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  -- use { 'gruvbox-community/gruvbox' }
  -- use("folke/tokyonight.nvim")
  -- use("rebelot/kanagawa.nvim")
  -- use("tanvirtin/monokai.nvim")
  -- use("EdenEast/nightfox.nvim")
  use("shaunsingh/nord.nvim")
  use("sainnhe/everforest")
  -- use("joshdick/onedark.vim")
  -- use("olimorris/onedarkpro.nvim")
  use("navarasu/onedark.nvim")
  use("daschw/leaf.nvim")

  -- Fuzzy finding stuff via telescope
  use("cljoly/telescope-repo.nvim")
  use("fhill2/telescope-ultisnips.nvim")
  use("nvim-telescope/telescope-packer.nvim")
  -- use("dhruvmanila/telescope-bookmarks.nvim")
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
  })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "jremmen/vim-ripgrep" })

  -- essentials: telescope, nvim-lspconfig, nvim-dap
  -- LSP and completion
  -- simplify usage of lsps
  use("neovim/nvim-lspconfig")
  use({ "tami5/lspsaga.nvim" })
  -- use("tpope/vim-projectionist")
  use("vim-test/vim-test")
  use("mfussenegger/nvim-jdtls")

  -- indentation guides
  use("lukas-reineke/indent-blankline.nvim")
  use({ "tpope/vim-sleuth" })

  -- automatic closing Syntax
  use({ "tpope/vim-endwise" })

  -- schema support
  use({ "b0o/schemastore.nvim" })
  -- automatic ctags creation
  -- use("ludovicchabant/vim-gutentags")

  use({ "j-hui/fidget.nvim" })
  use({ "RRethy/vim-illuminate" })
  -- use "nvim-lua/lsp-status.nvim"
  -- use({ "jose-elias-alvarez/null-ls.nvim",
  -- config = function()
  --     require("null-ls").config({})
  --     require("lspconfig")["null-ls"].setup({})
  -- end,
  -- requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}
  -- })

  -- improved and extended lsp integration
  -- decoration and code actions
  -- use "glepnir/lspsaga.nvim"

  -- Easy LS installation
  -- use "kabouzeid/nvim-lspinstall"

  -- Regex explain
  use({
    "bennypowers/nvim-regexplainer",
    config = function()
      require("regexplainer").setup()
    end,
    requires = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  })

  -- autopair of brackets on insert
  use("windwp/nvim-autopairs")
  -- insert or delete parentheses in pairs
  use("jiangmiao/auto-pairs")

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
      -- "PaterJason/cmp-conjure",

      -- "rafaeldelboni/nvim-fennel-lsp-conjure-as-clojure-ide",
      -- "octaltree/cmp-look",
      -- "hrsh7th/cmp-calc",
      -- "hrsh7th/cmp-emoji"
    },
  })

  -- clojure
  -- use("Olical/conjure")

  -- db interaction within vim
  -- use("tpope/vim-dadbod")

  -- pictograms for LSP completion
  use("onsails/lspkind-nvim")

  -- sidebar with ooutlines
  use("simrat39/symbols-outline.nvim")

  -- fn signature while typing
  -- use "ray-x/lsp_signature.nvim"

  -- quick LSP warnings+errors navigation
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  })
  -- use({
  --   "jose-elias-alvarez/null-ls.nvim",
  --   config = function()
  --     require("null-ls").setup()
  --   end,
  --   requires = { "nvim-lua/plenary.nvim" },
  -- })

  -- Lua development
  use("folke/lua-dev.nvim")
  use("bfredl/nvim-luadev")

  -- custom formatter on save
  use("mhartington/formatter.nvim")

  -- Vim dispatch
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- file explorer and interaction
  use("tpope/vim-vinegar") -- improved netrw
  -- use("justinmk/vim-dirvish")
  -- use("justinmk/vim-sneak")

  -- unix commands for vim
  -- use("tpope/vim-eunuch")
  use("tpope/vim-unimpaired")

  -- lua file explorer
  use("kyazdani42/nvim-tree.lua")

  -- autochange to project root dir
  use("airblade/vim-rooter")

  -- Git features
  -- git wrapper on steroids
  use("tpope/vim-fugitive")

  -- git history navigation
  -- use("junegunn/gv.vim")
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
  use("jamessan/vim-gnupg")

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

  use("norcalli/nvim-colorizer.lua")

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
  use("tpope/vim-abolish")

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
      require("dressing").sartup({})
    end,
  })

  -- SNIPPETS
  --use("L3MON4D3/LuaSnip")
  --use("saadparwaiz1/cmp_luasnip")
  use("SirVer/ultisnips")
  use("honza/vim-snippets")

  -- DEBUG with DAP
  use({ "mfussenegger/nvim-dap" })
  use({ "mfussenegger/nvim-dap-python" })
  use({ "nvim-telescope/telescope-dap.nvim" })
  use("theHamsta/nvim-dap-virtual-text")

  -- use { 'mfussenegger/nvim-dap-python' } -- Python
end)

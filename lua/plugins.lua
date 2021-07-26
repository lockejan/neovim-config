return require("packer").startup(
  function()
    -- Packer can manage itself as an optional plugin
    use {"wbthomason/packer.nvim", opt = true}

    -- Color scheme
    -- use { 'sainnhe/gruvbox-material' }
    use "shaunsingh/nord.nvim"
    -- use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    -- use { 'gruvbox-community/gruvbox' }
    use "folke/tokyonight.nvim"

    -- Fuzzy finder
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }

    -- LSP and completion
    use "neovim/nvim-lspconfig"
    use "onsails/lspkind-nvim"
    use "nvim-lua/completion-nvim"
    use "glepnir/lspsaga.nvim"
    use "folke/lsp-colors.nvim"
    use "simrat39/symbols-outline.nvim" -- sidebar
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {}
      end
    }

    -- Lua development
    use "folke/lua-dev.nvim"
    use "mhartington/formatter.nvim"

    -- Vim dispatch
    -- use 'tpope/vim-dispatch' -- compile helper

    -- file explorer and interaction
    -- use 'tpope/vim-vinegar' -- improved netrw
    use "tpope/vim-eunuch" -- unix helper
    use "kyazdani42/nvim-tree.lua" -- lua file explorer
    use "kyazdani42/nvim-web-devicons"
    use "airblade/vim-rooter" -- autochange to project dir

    -- Git features
    use "tpope/vim-fugitive"
    -- use 'junegunn/gv.vim'
    use "sindrets/diffview.nvim"
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      }
    }

    -- Syntax + Treesitter
    use "jiangmiao/auto-pairs"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "p00f/nvim-ts-rainbow"
    use "andymass/vim-matchup"
    use "windwp/nvim-ts-autotag"
    -- use 'sheerun/vim-polyglot'
    -- use { 'JoosepAlviste/nvim-ts-context-commentstring' }

    -- additional plugins
    use "hoob3rt/lualine.nvim"
    use "romgrk/barbar.nvim"
    use "szw/vim-maximizer"
    use "tpope/vim-commentary"
    use "tpope/vim-surround"
    -- use { 'sunjon/shade.nvim' }

    -- use 'norcalli/nvim-colorizer.lua'

    -- Helpers + Cheatsheet
    use "folke/which-key.nvim"
    use "sudormrfbin/cheatsheet.nvim"

    -- Poweruser-helper
    use "tpope/vim-repeat"
    use "tpope/vim-speeddating"
    use "wellle/targets.vim"

    use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview"}

    -- SNIPPETS
    use "honza/vim-snippets"
    use "SirVer/ultisnips"

    -- DEBUG with DAP
    -- use { 'mfussenegger/nvim-dap' }
    -- use { 'nvim-telescope/telescope-dap.nvim' }
    -- use { 'mfussenegger/nvim-dap-python' } -- Python
  end
)

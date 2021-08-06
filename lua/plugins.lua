return require("packer").startup(
  function()
    -- Packer can manage itself as an optional plugin
    use({"wbthomason/packer.nvim", opt = true})

    -- Color scheme
    -- use { 'sainnhe/gruvbox-material' }
    use "shaunsingh/nord.nvim"
    -- use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    -- use { 'gruvbox-community/gruvbox' }
    use "folke/tokyonight.nvim"
    use "tpope/vim-rhubarb"
    -- use {
    --   "glepnir/galaxyline.nvim",
    --   branch = "main",
    --   requires = {"kyazdani42/nvim-web-devicons", opt = true}
    -- }

    -- Fuzzy finder
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }

    -- LSP and completion
    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"
    use "onsails/lspkind-nvim"
    -- use "nvim-lua/completion-nvim"
    use "hrsh7th/nvim-compe" -- Autocompletion plugin
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

    use "cappyzawa/trim.nvim"

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
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "nvim-treesitter/nvim-treesitter-refactor"
    use "romgrk/nvim-treesitter-context"
    use "p00f/nvim-ts-rainbow"
    use {
      "andymass/vim-matchup",
      event = "CursorMoved"
    }

    use "windwp/nvim-ts-autotag"
    -- use 'sheerun/vim-polyglot'
    -- use { 'JoosepAlviste/nvim-ts-context-commentstring' }

    -- additional plugins
    -- use "hoob3rt/lualine.nvim"
    use "shadmansaleh/lualine.nvim"
    use {"akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons"}
    -- use "romgrk/barbar.nvim"
    use "szw/vim-maximizer"
    use "tpope/vim-commentary"
    -- use "b3nj5m1n/kommentary"
    use "tpope/vim-surround"
    use "christoomey/vim-tmux-navigator"
    -- use { 'sunjon/shade.nvim' }

    use "norcalli/nvim-colorizer.lua"

    -- Helpers + Cheatsheet
    use "folke/which-key.nvim"
    use "sudormrfbin/cheatsheet.nvim"
    use "danihodovic/vim-ansible-vault"

    -- Poweruser-helper
    use "tpope/vim-repeat"
    use "tpope/vim-speeddating"
    use "wellle/targets.vim"

    use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview"}

    -- SNIPPETS
    use "honza/vim-snippets"
    use "SirVer/ultisnips"
    use "L3MON4D3/LuaSnip"

    -- DEBUG with DAP
    -- use { 'mfussenegger/nvim-dap' }
    -- use { 'nvim-telescope/telescope-dap.nvim' }
    -- use { 'mfussenegger/nvim-dap-python' } -- Python
  end
)

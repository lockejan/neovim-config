vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd([[packadd packer.nvim]])

require("packer").init({ max_jobs = 16 })
return require("packer").startup({
  function(use)
    -- Packer can manage itself as an optional plugin
    use({ "wbthomason/packer.nvim", opt = true })

    -- improve startup
    use({ "lewis6991/impatient.nvim" })

    -- Packer can manage itself as an optional plugin
    use({ "wbthomason/packer.nvim", opt = true })

    -- Color schemes
    use("folke/tokyonight.nvim")
    use("shaunsingh/nord.nvim")
    -- use("andersevenrud/nordic.nvim")
    use("glepnir/zephyr-nvim")
    use("rebelot/kanagawa.nvim")
    use("sainnhe/everforest")
    use("navarasu/onedark.nvim")
    use("ellisonleao/gruvbox.nvim")
    --
    -- Fuzzy finding stuff via telescope
    use("fhill2/telescope-ultisnips.nvim")
    use("nvim-telescope/telescope-packer.nvim")
    -- use("dhruvmanila/telescope-bookmarks.nvim")
    use({
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    -- use({ "ibhagwan/fzf-lua" })
    -- use({ "vijaymarupudi/nvim-fzf" })
    use({ "jremmen/vim-ripgrep" })

    -- essentials: telescope, nvim-lspconfig, nvim-dap
    -- LSP and completion
    -- simplify usage of lsps
    -- use("williamboman/mason.nvim")
    use("neovim/nvim-lspconfig")
    -- use("tpope/vim-projectionist")

    -- execute tests
    use("vim-test/vim-test")
    vim.g["test#strategy"] = "neovim"

    -- java lsp support
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
    -- navigate and highlight symbols via lsp
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
        use("PaterJason/cmp-conjure"),
      },
    })
    -- clojure
    use("Olical/conjure")
    -- use("liquidz/vim-iced")

    -- db interaction within vim
    -- use("tpope/vim-dadbod")

    -- LSP TypeScript enhancements
    use({ "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils" })
    -- pictograms for LSP completion
    use("onsails/lspkind-nvim")

    -- sidebar with ooutlines
    use("simrat39/symbols-outline.nvim")

    -- quick LSP warnings+errors navigation
    use({
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    })

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
    use("tpope/vim-eunuch")
    -- quickfix nav mappings and more
    use("tpope/vim-unimpaired")

    -- lua file explorer
    -- use("kyazdani42/nvim-tree.lua")

    -- autochange to project root dir
    -- use("airblade/vim-rooter")
    -- recent project navigation and chdir to project rooter
    use({
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup({})
      end,
    })

    -- Git Features
    -- git wrapper on steroids
    -- use("tpope/vim-fugitive")
    use({
      "TimUntersberger/neogit",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("neogit").setup({
          integrations = {
            diffview = true,
          },
        })
      end,
    })

    -- git history navigation
    -- use("junegunn/gv.vim")
    use("sindrets/diffview.nvim")

    -- Browse git-repos on GH,...
    use("tpope/vim-rhubarb")

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
    use("wellle/targets.vim")
    use("bkad/CamelCaseMotion")

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
    use("NvChad/nvim-colorizer.lua")

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

    -- TODO TEST
    --  use { 'rcarriga/nvim-notify' }
    -- use { 'jamestthompson3/nvim-remote-containers' } -- Develop inside docker containers
    -- use { 'CRAG666/code_runner.nvim' } -- executor / code runner
    -- use {'nvim-treesitter/nvim-tree-docs'} -- add docs with treesitter
    --  use {'Chaitanyabsprip/present.nvim'}

    -- GH browser
    use({
      "pwntester/octo.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "kyazdani42/nvim-web-devicons",
      },
      config = function()
        require("octo").setup({default_remote = {"upstream", "origin","source","lockejan"}})
      end,
    })
    -- use { 'mfussenegger/nvim-lint' }
    -- DEBUG
    -- Debugging
    use({ "mfussenegger/nvim-dap" })
    use({
      "leoluz/nvim-dap-go",
      config = function()
        require("dap-go").setup()
      end,
    })
    use({
      "rcarriga/nvim-dap-ui",
      config = function()
        require("dapui").setup()
      end,
    })
    -- use({ "mfussenegger/nvim-dap-python", config = function ()
    --         require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
    --     end })
    -- use({ "nvim-telescope/telescope-dap.nvim" })
    use({
      "theHamsta/nvim-dap-virtual-text",
      config = function()
        require("nvim-dap-virtual-text").setup()
      end,
    })
    -- use({ "https://github.com/HiPhish/debugpy.nvim" })
    -- use({ "jbyuki/one-small-step-for-vimkind" })
    use("nvim-treesitter/playground")
    -- use("gpanders/nvim-parinfer")
     use("ggandor/leap.nvim") -- quick moves

    use({ "AndrewRadev/splitjoin.vim", keys = { "gJ", "gS" } })
    use({ "AndrewRadev/switch.vim" })

    -- use("cormacrelf/dark-notify")
    -- use("jubnzv/virtual-types.nvim") -- virtaul type hints
    -- use("weilbith/nvim-code-action-menu")
    use({
      "kosayoda/nvim-lightbulb",
      requires = "antoinemadec/FixCursorHold.nvim",
    }) -- indicate code actions

    -- file explorer
    use({ "tamago324/lir.nvim" })

    -- floating window with terminal
    use("voldikss/vim-floaterm")

    -- multicursors
    use({ "mg979/vim-visual-multi" })

    use({ "t-troebst/perfanno.nvim" })
    -- use("windwp/nvim-spectre")
    -- improve snap for autocmd relying plugins
    -- use({
    --   "antoinemadec/FixCursorHold.nvim",
    --   run = function()
    --     vim.g.curshold_updatime = 1000
    --   end,
    -- })

    -- use({
    --   "NTBBloodbath/rest.nvim",
    --   requires = { "nvim-lua/plenary.nvim" },
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
    -- })

    -- use({ "neovimhaskell/haskell-vim", ft = "haskell" })
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})

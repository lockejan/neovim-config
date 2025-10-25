-- Treesitter syntax highlighting and code manipulation plugins

return {
  -- Core treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-refactor",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-endwise",
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "HiPhish/rainbow-delimiters.nvim",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "css",
          "dockerfile",
          "gitcommit",
          "html",
          "lua",
          "markdown",
          "nix",
          "python",
          "rust",
          "vim",
          "yaml",
        },
        sync_install = true,
        auto_install = true,
        ignore_install = {},
        modules = {},

        highlight = {
          enable = true,
          disable = {},
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        endwise = {
          enable = true,
        },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = 1000,
        },
        matchup = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["aC"] = "@conditional.outer",
              ["iC"] = "@conditional.inner",
              ["ad"] = "@comment.outer",
              ["ae"] = "@block.outer",
              ["am"] = "@call.outer",
              ["al"] = "@loop.outer",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
          autopairs = { enable = true },
          lsp_interop = {
            enable = true,
            border = "none",
            peek_definition_code = {
              ["<leader>df"] = "@function.outer",
              ["<leader>dF"] = "@class.outer",
            },
            peek_type_definition_code = {
              ["<leader>TF"] = "@class.outer",
            },
          },
          refactor = {
            highlight_definitions = {
              enable = true,
              clear_on_cursor_move = true,
            },
            highlight_current_scope = { enable = true },
            smart_rename = {
              enable = true,
              keymaps = {
                smart_rename = "grr",
              },
            },
            navigation = {
              enable = true,
              keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
              },
            },
          },
        },
      })

      -- Custom parser configs
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.jsonc.filetype_to_parsername = "json"
      parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

      -- Context commentstring setup
      require("ts_context_commentstring").setup({})
      vim.g.skip_ts_context_commentstring_module = true

      -- Folding setup
      vim.cmd([[set foldmethod=expr]])
      vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])
      vim.cmd([[set nofoldenable]])
    end,
  },

  -- Sticky context header (shows current function/class at top)
  {
    "romgrk/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      enable = true,
      throttle = true,
    },
  },

  -- Treesitter playground for debugging
  {
    "nvim-treesitter/playground",
    cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
  },

  -- Additional dependencies (lazy loaded via treesitter)
  { "nvim-treesitter/nvim-treesitter-refactor", lazy = true },
  { "nvim-treesitter/nvim-treesitter-textobjects", lazy = true },
  { "RRethy/nvim-treesitter-endwise", lazy = true },
  { "windwp/nvim-ts-autotag", lazy = true },
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  { "HiPhish/rainbow-delimiters.nvim", lazy = true },
}

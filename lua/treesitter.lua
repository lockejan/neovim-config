require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = {
    enable = true, -- false will disable the whole extension
    use_languagetree = true,
    disable = {},
  },
  indent = {
    enable = false,
    -- disable_filetype = { "python" },
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
  rainbow = {
    enable = true,
    extended_mode = true,
    -- colors = {},
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  },
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
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
        -- ["id"] = "@rhs.inner",
        -- ["ad"] = "@lhs.inner",
        -- ["iM"] = "@frame.inner",
        -- ["ai"] = "@parameter.outer",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
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
        -- Set to false if you have an `updatetime` of ~100.
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

-- add markdown
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.jsonc.filetype_to_parsername = "json"
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
parser_config.markdown = {
  install_info = {
    url = "https://github.com/ikatyang/tree-sitter-markdown",
    files = { "src/parser.c", "src/scanner.cc" },
  },
}

require("treesitter-context").setup({ enable = true, throttle = true })

vim.cmd([[set foldlevel=20]])
vim.cmd([[set foldmethod=expr]])
vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])
vim.cmd([[hi rainbowcol1 guifg=#c678dd]])

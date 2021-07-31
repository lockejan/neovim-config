require "nvim-treesitter.configs".setup {
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "comment",
    "cpp",
    "css",
    "go",
    "graphql",
    "html",
    "javascript",
    "jsonc",
    "latex",
    "lua",
    -- "markdown",
    "nix",
    "php",
    "python",
    "regex",
    "rust",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "vue",
    "yaml"
    -- "json",
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    use_languagetree = true,
    disable = {}
  },
  indent = {
    enable = false
    -- disable_filetype = {"python"}
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm"
    }
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
  },
  matchup = {
    enable = true -- mandatory, false will disable the whole extension
  },
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable = true
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
        ["ic"] = "@class.inner"
      }
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer"
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer"
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer"
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer"
      }
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner"
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner"
      }
    },
    lsp_interop = {
      enable = true,
      border = "none",
      peek_definition_code = {
        ["df"] = "@function.outer",
        ["dF"] = "@class.outer"
      }
    }
  }
}

-- add markdown
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.jsonc.used_by = "json"
parser_config.tsx.used_by = {"javascript", "typescript.tsx"}
parser_config.markdown = {
  install_info = {
    url = "https://github.com/ikatyang/tree-sitter-markdown",
    files = {"src/parser.c", "src/scanner.cc"}
  }
}

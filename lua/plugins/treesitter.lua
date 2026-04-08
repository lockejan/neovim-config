-- Treesitter syntax highlighting and code manipulation plugins

return {
  -- Core treesitter (main branch for Neovim 0.12+)
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").setup({})

      -- Install parsers
      require("nvim-treesitter").install({
        "bash",
        "c",
        "css",
        "dockerfile",
        "gitcommit",
        "html",
        "lua",
        "markdown",
        "markdown_inline",
        "nix",
        "python",
        "rust",
        "vim",
        "vimdoc",
        "yaml",
      })

      -- Enable treesitter highlighting and indentation for all filetypes
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      -- Folding
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.opt.foldenable = false
    end,
  },

  -- Textobjects (main branch for Neovim 0.12+)
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      local ts_select = require("nvim-treesitter-textobjects.select")
      local ts_move = require("nvim-treesitter-textobjects.move")
      local ts_swap = require("nvim-treesitter-textobjects.swap")

      -- Selection keymaps
      local select_maps = {
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
      }
      for key, query in pairs(select_maps) do
        vim.keymap.set({ "x", "o" }, key, function()
          ts_select.select_textobject(query, "textobjects")
        end)
      end

      -- Move keymaps
      local move_maps = {
        { "]m", "goto_next_start", "@function.outer" },
        { "]]", "goto_next_start", "@class.outer" },
        { "]M", "goto_next_end", "@function.outer" },
        { "][", "goto_next_end", "@class.outer" },
        { "[m", "goto_previous_start", "@function.outer" },
        { "[[", "goto_previous_start", "@class.outer" },
        { "[M", "goto_previous_end", "@function.outer" },
        { "[]", "goto_previous_end", "@class.outer" },
      }
      for _, map in ipairs(move_maps) do
        vim.keymap.set({ "n", "x", "o" }, map[1], function()
          ts_move[map[2]](map[3], "textobjects")
        end)
      end

      -- Swap keymaps
      vim.keymap.set("n", "<leader>a", function()
        ts_swap.swap_next("@parameter.inner", "textobjects")
      end)
      vim.keymap.set("n", "<leader>A", function()
        ts_swap.swap_previous("@parameter.inner", "textobjects")
      end)
    end,
  },

  -- Sticky context header (shows current function/class at top)
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      enable = true,
      throttle = true,
    },
  },

  -- Endwise (auto-close do/end, if/end, etc.)
  {
    "RRethy/nvim-treesitter-endwise",
    event = "InsertEnter",
    config = function()
      require("nvim-treesitter-endwise").setup({})
    end,
  },

  -- Auto-close and rename HTML tags
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },

  -- Context-aware commentstring
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    config = function()
      require("ts_context_commentstring").setup({})
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },

  -- Rainbow delimiters
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPost", "BufNewFile" },
  },
}

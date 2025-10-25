-- File navigation, fuzzy finding, and project management plugins

return {
  -- Telescope fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader><space>", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
      { "<leader>ff", "<cmd>lua require('telescope.builtin').fd({previewer = false})<CR>", desc = "Find files (no preview)" },
      { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>of", "<cmd>Telescope oldfiles<cr>", desc = "Find old files" },
      { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>sg", "<cmd>Telescope git_files<cr>", desc = "Find git files" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Search help" },
      { "<leader>sp", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search buffer" },
      { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Grep string" },
      { "<leader>sv", '"zy:Telescope grep_string default_text=<C-r>z<cr>', desc = "Grep visual selection", mode = "v" },
      { "<leader>sc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
      { "<leader>sd", "<cmd>Telescope git_bcommits<cr>", desc = "Git buffer commits" },
      { "<leader>sB", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Search keymaps" },
      { "<leader>us", "<cmd>Telescope ultisnips<cr>", desc = "Search snippets" },
      { "<leader>op", "<cmd>Telescope projects<cr>", desc = "Search projects" },
      { "<leader>cs", "<cmd>Telescope colorscheme<cr>", desc = "Change colorscheme" },
      { "<space>g", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy find in buffer" },
      { "<space>G", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    },
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local actions = require("telescope.actions")
      local action_layout = require("telescope.actions.layout")

      require("telescope").setup({
        defaults = {
          mappings = {
            n = {
              ["q"] = actions.close,
              ["esc"] = actions.close,
              ["<M-p>"] = action_layout.toggle_preview,
            },
            i = {
              ["<M-p>"] = action_layout.toggle_preview,
            },
          },
        },
        pickers = {
          find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          bookmarks = {
            selected_browser = "brave",
            url_open_command = "open",
          },
        },
      })

      -- Load extensions
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("projects")
      require("telescope").load_extension("ultisnips")

      -- Visual selection search support
      local tb = require("telescope.builtin")
      local opts = { noremap = true, silent = true }

      vim.keymap.set("v", "<space>g", function()
        local text = vim.getVisualSelection()
        tb.current_buffer_fuzzy_find({ default_text = text })
      end, opts)

      vim.keymap.set("v", "<space>G", function()
        local text = vim.getVisualSelection()
        tb.live_grep({ default_text = text })
      end, opts)
    end,
  },

  -- Telescope extensions
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = true,
  },

  {
    "fhill2/telescope-ultisnips.nvim",
    lazy = true,
  },

  {
    "nvim-telescope/telescope-symbols.nvim",
    lazy = true,
  },

  -- { "nvim-telescope/telescope-packer.nvim" },
  -- {"dhruvmanila/telescope-bookmarks.nvim"},

  -- Ripgrep integration
  {
    "jremmen/vim-ripgrep",
    cmd = { "Rg" },
  },

  -- Alternative fuzzy finders (commented)
  -- { "ibhagwan/fzf-lua" },
  -- { "vijaymarupudi/nvim-fzf" },

  -- Project management
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup({})
    end,
  },

  -- File explorers
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile", "NvimTreeOpen" },
    keys = {
      { "<leader>et", "<cmd>NvimTreeToggle<cr>", desc = "Toggle nvim-tree" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({})
    end,
  },

  {
    "tamago324/lir.nvim",
    keys = {
      { "-", "<cmd>edit %:h<CR>", desc = "Open lir in current directory" },
      { "<leader>ee", "<cmd>lua require'lir.float'.toggle()<CR>", desc = "Toggle lir float" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local actions = require("lir.actions")
      local mark_actions = require("lir.mark.actions")
      local clipboard_actions = require("lir.clipboard.actions")

      require("lir").setup({
        show_hidden_files = false,
        devicons = { enable = true },
        mappings = {
          ["l"] = actions.edit,
          ["<C-s>"] = actions.split,
          ["<C-v>"] = actions.vsplit,
          ["<C-t>"] = actions.tabedit,
          ["h"] = actions.up,
          ["q"] = actions.quit,
          ["K"] = actions.mkdir,
          ["N"] = actions.newfile,
          ["R"] = actions.rename,
          ["@"] = actions.cd,
          ["Y"] = actions.yank_path,
          ["."] = actions.toggle_show_hidden,
          ["D"] = actions.delete,
          ["J"] = function()
            mark_actions.toggle_mark()
            vim.cmd("normal! j")
          end,
          ["C"] = clipboard_actions.copy,
          ["X"] = clipboard_actions.cut,
          ["P"] = clipboard_actions.paste,
        },
        float = {
          winblend = 0,
          curdir_window = {
            enable = false,
            highlight_dirname = false,
          },
        },
        hide_cursor = false,
        on_init = function()
          -- use visual mode
          vim.api.nvim_buf_set_keymap(
            0,
            "x",
            "J",
            ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
            { noremap = true, silent = true }
          )

          -- echo cwd
          vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
        end,
      })

      -- Custom folder icon
      require("nvim-web-devicons").set_icon({
        lir_folder_icon = {
          icon = "",
          color = "#7ebae4",
          name = "LirFolderNode",
        },
      })
    end,
  },

  -- Alternative file explorers (commented)
  -- {"justinmk/vim-dirvish"},
  -- {"justinmk/vim-sneak"},
  -- {
  --   "stevearc/oil.nvim",
  --   opts = {},
  --   dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- },
}

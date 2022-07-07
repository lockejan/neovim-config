local map = require("utils").map
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

-- Global remapping
require("telescope").setup({
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
        ["esc"] = actions.close,
        ["<M-p>"] = action_layout.toggle_preview,
      },
      i = {
        -- ["<M-q>"] = actions.close,
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
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    bookmarks = {
      -- Available: 'brave', 'google_chrome', 'safari', 'firefox', 'firefox_dev'
      selected_browser = "brave",

      -- Either provide a shell command to open the URL
      url_open_command = "open",

      -- Or provide the plugin name which is already installed
      -- Available: 'vim_external', 'open_browser'
      -- url_open_plugin = nil,
      -- firefox_profile_name = nil,
    },
  },
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("projects")
-- require("telescope").load_extension("repo")
require("telescope").load_extension("ultisnips")
require("telescope").load_extension("packer")
-- require("telescope").load_extension("bookmarks")

--Add leader shortcuts
map("n", "<leader><space>", "<cmd>Telescope buffers<CR>")
-- map(
--   "n",
--   "<leader>gd",
--   "<cmd>lua require'telescope'.extensions.repo.list{fd_opts=[[]]}<CR>"
-- )
map("n", "<leader>ff", [[<cmd>lua require('telescope.builtin').fd({previewer = false})<CR>]])
map("n", "<leader>sh", "<cmd>Telescope help_tags<cr>")
map("n", "<leader>sp", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
map("n", "<leader>sw", "<cmd>Telescope grep_string<cr>")
map("v", "<leader>sv", '"zy:Telescope grep_string default_text=<C-r>z<cr>')
map("n", "<leader>sg", "<cmd>Telescope git_files<cr>")
map("n", "<leader>sG", "<cmd>Telescope find_files<cr>")
map("n", "<leader>sc", "<cmd>Telescope git_commits<cr>")
map("n", "<leader>sd", "<cmd>Telescope git_bcommits<cr>")
map("n", "<leader>sB", "<cmd>Telescope git_branches<cr>")
-- map("n", "<leader>ss", "<cmd>Telescope git_status<cr>")
-- map("n", "<leader>ss", "<cmd>Telescope ultisnips<cr>")
map("n", "<leader>sP", "<cmd>Telescope packer<cr>")
-- map("n", "<leader>op", "<cmd>Telescope projects<cr>")
map("n", "<leader>cs", "<cmd>Telescope colorscheme<cr>")

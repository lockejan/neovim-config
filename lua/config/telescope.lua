local map = vim.api.nvim_set_keymap
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
require("telescope").load_extension("repo")
require("telescope").load_extension("ultisnips")
require("telescope").load_extension("packer")
-- require("telescope").load_extension("bookmarks")

--Add leader shortcuts
map("n", "<leader><space>", [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
map(
  "n",
  "<leader>gd",
  "<cmd>lua require'telescope'.extensions.repo.list{fd_opts=[[]]}<CR>",
  { noremap = true, silent = true }
)
map(
  "n",
  "<leader>sf",
  [[<cmd>lua require('telescope.builtin').fd({previewer = false})<CR>]],
  { noremap = true, silent = true }
)
map(
  "n",
  "<leader>sb",
  [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
  { noremap = true, silent = true }
)
map("n", "<leader>sh", [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
map("n", "<leader>sp", [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
map("n", "<leader>?", [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })
map("n", "<leader>sg", "<cmd>lua require('config.telescope-config').project_files()<cr>", { noremap = true })
map("n", "<leader>sc", "<cmd>Telescope git_commits<cr>", { noremap = true })
map("n", "<leader>sd", "<cmd>Telescope git_bcommits<cr>", { noremap = true })
map("n", "<leader>sb", "<cmd>Telescope git_branches<cr>", { noremap = true })
-- map("n", "<leader>sb", "<cmd>Telescope buffers<cr>", {noremap = true})
-- map("n", "<leader>sd", [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], {noremap = true, silent = true})

local utils = require("utils")

-- " Find files using Telescope command-line sugar.
utils.map("n", "<leader>ff", "<cmd>Telescope fd<cr>")
utils.map("n", "<leader>fo", "<cmd>Telescope frecency<cr>")
utils.map("n", "<leader>fg", "<cmd>Telescope git_files<cr>")
utils.map("n", "<leader>fc", "<cmd>Telescope git_commits<cr>")
utils.map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
utils.map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

local actions = require("telescope.actions")
-- Global remapping
------------------------------
require("telescope").setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case" -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}
require("telescope").load_extension("fzf")

--Add leader shortcuts
vim.api.nvim_set_keymap(
  "n",
  "<leader><space>",
  [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>sf",
  [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>sb",
  [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>sh",
  [[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>st",
  [[<cmd>lua require('telescope.builtin').tags()<CR>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>sd",
  [[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>sp",
  [[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>so",
  [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>?",
  [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
  {noremap = true, silent = true}
)

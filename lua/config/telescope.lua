-- if !exists('g:loaded_telescope') | finish | endif

local utils = require('utils')

-- " Find files using Telescope command-line sugar.
utils.map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
utils.map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
utils.map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
utils.map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- nnoremap <silent> ;f <cmd>Telescope find_files<cr>
-- nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
-- nnoremap <silent> \\ <cmd>Telescope buffers<cr>
-- nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
require('telescope').load_extension('fzf')

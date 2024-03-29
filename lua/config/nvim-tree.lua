-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require("nvim-tree").setup({
  disable_netrw = false,
  hijack_netrw = false,
  -- open_on_setup = false,
  -- ignore_ft_on_setup = {},
  -- auto_close = false,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  respect_buf_cwd = true,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = { ".DS_Store" },
  },
  git = {
    enable = false,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    hide_root_folder = false,
    side = "left",
    -- auto_resize = true,
    mappings = {
      custom_only = false,
      list = {},
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
})

vim.cmd("autocmd BufWinEnter NvimTree setlocal cursorline")
--
-- NvimTree Shortcuts
vim.api.nvim_set_keymap("n", "<leader>fe", ":NvimTreeFindFile<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>we", ":NvimTreeToggle<CR>", { noremap = true })

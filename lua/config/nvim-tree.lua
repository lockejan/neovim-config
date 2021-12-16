-- vim.g.nvim_tree_disable_default_keybindings = 1
-- vim.g.nvim_tree_auto_open = 1
-- vim.g.nvim_tree_follow = 1
-- vim.g.nvim_tree_auto_ignore_ft = {}
-- vim.g.nvim_tree_indent_markers = 1
-- vim.g.nvim_tree_git_hl = 1

require("nvim-tree").setup({
  disable_netrw = false,
  hijack_netrw = false,
  open_on_setup = false,
  auto_close = true,
  open_on_tab = false,
  update_cwd = false,
  hijack_cursor = false,
  -- system_open = {
  --     cmd = "",
  --     args = "",
  -- },
  ignore_ft_on_setup = { "dashboard", "startify" },
  update_to_buf_dir = {
    enable = true,
    auto_open = true,
  },
  -- lsp_diagnostics = true,
  view = {
    side = "left",
    width = 40,
    auto_resize = true,
  },
  filters = {
    dotfiles = false,
    custom = { ".DS_Store" },
  },
  git = {
    ignore = true,
  },
})

vim.cmd("autocmd BufWinEnter NvimTree setlocal cursorline")

vim.g.nvim_tree_ignore = {".DS_Store"}
-- vim.g.nvim_tree_gitignore = 1
-- vim.g.nvim_tree_auto_open = 1
-- vim.g.nvim_tree_auto_close = 0
-- vim.g.nvim_tree_follow = 1
-- vim.g.nvim_tree_auto_ignore_ft = {"dashboard", "startify"}
-- vim.g.nvim_tree_indent_markers = 1
-- vim.g.nvim_tree_git_hl = 1
-- vim.g.nvim_tree_disable_netrw = 1
-- vim.g.nvim_tree_lsp_diagnostics = 1
-- vim.g.nvim_tree_disable_default_keybindings = 1

require("nvim-tree").setup {
  view = {
    width = 40
  }
}

-- -- utils.map("n", "<leader>ef", ":lua require'config.tree'.toggle_tree()<CR>")
vim.cmd("autocmd BufWinEnter NvimTree setlocal cursorline")

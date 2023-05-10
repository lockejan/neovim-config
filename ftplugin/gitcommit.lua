local map = vim.api.nvim_set_keymap

map("n", "<A-m>", "<Cmd>lua require'telescope.builtin'.symbols{ sources = {'gitmoji'} }<CR>", { noremap = true })
map("i", "<A-m>", "<Cmd>lua require'telescope.builtin'.symbols{ sources = {'gitmoji'} }<CR>", { noremap = true })

local map = vim.api.nvim_set_keymap

map("n", "<A-o>", "<Cmd>PyrightOrganizeImports<CR>", { noremap = true })
map("n","t<C-s>", ":lua require('dap').continue()", {noremap = true})
map("n","t<C-d>", ":lua require('dap').debug_test()<CR>", {noremap = true})
-- map("n","t<C-d>", ":lua require('dap-python').test_runner = 'pytest|django|unittest'", {noremap = true})

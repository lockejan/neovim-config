local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- center matching line
map("n", "<leader>n", "nzz", { noremap = true })
map("n", "<leader>N", "Nzz", { noremap = true })

-- map("n", "<C-c>", "<cmd>nohl<CR>", { noremap = true }) -- Clear highlights -- <c-l> became default in core
map("n", "<leader>,", ":e ~/.config/nvim/init.lua<CR>", { noremap = true })
map("n", "<C-s>", ":w | luafile %<CR>", { noremap = true })
map("n", "<leader>ls", ":ls<CR>", { noremap = true })
map("n", "<leader>cd", ":cd %:p:h<CR>", { noremap = true })
map("n", "<leader>w", ":write<CR>", { noremap = true })

-- Undo break points
map("i", ",", ",<c-g>u", { noremap = true })
map("i", ".", ".<c-g>u", { noremap = true })
map("i", "!", "!<c-g>u", { noremap = true })
map("i", "?", "?<c-g>u", { noremap = true })

-- Visual shifting (does not exit Visual mode)
map("v", "<", "<gv", { noremap = true })
map("v", ">", ">gv", { noremap = true })

-- Quit visual mode
-- map("v", "v", "<Esc>", { noremap = true })

-- Quick command mode
-- map("n", "<CR>", ":", { noremap = true })
map("n", "<leader>of", ":Telescope oldfiles<CR>", { noremap = true })

vim.o.wildcharm = 9
-- vim.o.wildcharm = vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-i>", true, false, true), "n", false)
-- vim.cmd([[ set wildcharm=<C-i> ]])
-- vim.opt.wildcharm = vim.fn.char2nr("^I")
map("n", "<leader>bb", ":buffer<Space><C-i>", { noremap = true })

-- szw/vim-maximizer
map("n", "<leader>m", ":MaximizerToggle!<CR>", { noremap = true })

-- Trim trailing whitespace.
map("n", "<leader>tw", ":%s/\\s\\+$//e<cr>", { noremap = true })

--Add move line shortcuts
map("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
map("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })

--Remap escape to leave terminal mode
map("t", "<Esc>", [[<c-\><c-n>]], { noremap = true })

map("n", "<leader>ps", ":PackerSync<CR>", { noremap = true })

-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
  if vim.o.mouse == "a" then
    vim.cmd([[IndentBlanklineDisable]])
    vim.wo.signcolumn = "no"
    vim.o.mouse = "v"
    vim.wo.number = false
    print("Mouse disabled")
  else
    vim.cmd([[IndentBlanklineEnable]])
    vim.wo.signcolumn = "yes"
    vim.o.mouse = "a"
    vim.wo.number = true
    print("Mouse enabled")
  end
end

map("n", "<leader>bm", "<cmd>lua ToggleMouse()<cr>", { noremap = true })

-- custom replace
-- map("n", "<silent> s*", "<cmd>let @/='<'.expand('<cword>').'>'<cr>cgn", { noremap = true })

-- fugitive
map("n", "<leader>gs", ":G<CR>", { noremap = true })
map("n", "<leader>gb", ":G praise<CR>", { noremap = true })
map("n", "<leader>gc", ":G commit<cr>", { noremap = true })
map("n", "<leader>gd", ":tabe %<cr>:Gvdiffsplit!<CR>", { noremap = true })
map("n", "<leader>gD", ":DiffviewOpen<cr>", { noremap = true })
-- map("n", "<leader>gm", ":tabe %<cr>:Gvdiffsplit! main<CR>", { noremap = true })
-- map("n", "<leader>gM", ":DiffviewOpen main<cr>", { noremap = true })
map("n", "<leader>gl", ":Git log<cr>", { noremap = true })
map("n", "<leader>gp", ":Git push<cr>", { noremap = true })
map("n", "<leader>ll", ":diffget LOCAL<cr>", { noremap = true })
map("n", "<leader>rr", ":diffget REMOTE<cr>", { noremap = true })

-- close all open buffers
map("n", "<leader>Q", ":bufdo bdelete<cr>", { noremap = true })

-- lsp shortcuts
map("n", "<leader>li", ":LspInfo<CR>", { noremap = true, silent = true })
map("n", "<leader>lr", ":LspRestart<CR>", { noremap = true, silent = true })
-- map("n", "l<C-s>", ":LspStop<Space><C-i>", { noremap = true, silent = true })

-- visit file even if not present
map("n", "gF", ":edit <cfile><cr>", { noremap = true })

map("n", "<leader>x", ":!open %<cr>", { noremap = true })

-- vim-test
-- these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
map("n", "t<C-n>", ":TestNearest<CR>", { noremap = true, silent = true })
map("n", "t<C-f>", ":TestFile<CR>", { noremap = true, silent = true })
map("n", "t<C-s>", ":TestSuite<CR>", { noremap = true, silent = true })
map("n", "t<C-l>", ":TestLast<CR>", { noremap = true, silent = true })
map("n", "t<C-v>", ":TestVisit<CR>", { noremap = true, silent = true })

-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
  if vim.o.mouse == "a" then
    vim.cmd([[IndentBlanklineDisable]])
    vim.wo.signcolumn = "no"
    vim.o.mouse = "v"
    vim.wo.number = false
    print("Mouse disabled")
  else
    vim.cmd([[IndentBlanklineEnable]])
    vim.wo.signcolumn = "yes"
    vim.o.mouse = "a"
    vim.wo.number = true
    print("Mouse enabled")
  end
end

map("n", "<leader>tm", "<cmd>lua ToggleMouse()<cr>", { noremap = true })

--Disable numbers in terminal mode
vim.cmd([[
  augroup Terminal
    autocmd!
    au TermOpen * set nonu
  augroup end
]])

-- quick help
vim.api.nvim_set_keymap("n", "<leader>gh", ":h <C-R><C-W><CR>", { noremap = true })

-- duplicate line
vim.api.nvim_set_keymap("n", "<A-d>", ":t.<CR>", { noremap = true })

-- autoexpand current file dir
-- cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
--

-- ansible vault
vim.api.nvim_set_keymap("n", "<leader>dv", ":!ansible-vault decrypt %<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ev", ":!ansible-vault encrypt %<CR>", { noremap = true })

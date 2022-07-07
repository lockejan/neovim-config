local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

function vim.getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg("v")
  vim.fn.setreg("v", {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ""
  end
end

-- search visual selection
local tb = require("telescope.builtin")
local opts = { noremap = true, silent = true }

map("n", "<space>g", ":Telescope current_buffer_fuzzy_find<cr>", opts)
vim.keymap.set("v", "<space>g", function()
  local text = vim.getVisualSelection()
  tb.current_buffer_fuzzy_find({ default_text = text })
end, opts)

map("n", "<space>G", ":Telescope live_grep<cr>", opts)
vim.keymap.set("v", "<space>G", function()
  local text = vim.getVisualSelection()
  tb.live_grep({ default_text = text })
end, opts)

-- replace visual selection

-- Fix the & cmd Tip 93
map("n", "&", ":&&<CR>", opts)
map("x", "&", ":&&<CR>", opts)

-- center matching line
map("n", "<leader>n", "nzz", opts)
map("n", "<leader>N", "Nzz", opts)

-- map("n", "<C-c>", "<cmd>nohl<CR>", opts) -- Clear highlights -- <c-l> became default in core
map("n", "<leader>,", ":e ~/.config/nvim/init.lua<CR>", opts)
map("n", "<leader><C-s>", ":w | luafile %<CR>", opts)
map("n", "<C-s>", ":w<CR>", opts)
map("n", "<leader>ls", ":ls<CR>", opts)
map("n", "<leader>cd", ":cd %:p:h<CR>", opts)
map("n", "<leader>w", ":write<CR>", opts)

-- Undo break points
map("i", ",", ",<c-g>u", opts)
map("i", ".", ".<c-g>u", opts)
map("i", "!", "!<c-g>u", opts)
map("i", "?", "?<c-g>u", opts)

-- Visual shifting (does not exit Visual mode)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Quit visual mode
-- map("v", "v", "<Esc>", opts)

-- Quick command mode
-- map("n", "<CR>", ":", opts)
map("n", "<leader>of", ":Telescope oldfiles<CR>", opts)

vim.o.wildcharm = 9
-- vim.o.wildcharm = vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-i>", true, false, true), "n", false)
-- vim.cmd([[ set wildcharm=<C-i> ]])
-- vim.opt.wildcharm = vim.fn.char2nr("^I")
map("n", "<leader>bb", ":buffer<Space><C-i>", opts)
map("n", "<leader>bd", ":bdelete<CR>", opts)
map("n", "<leader>bw", ":%bd|e#|bd#<CR>", opts)
map("n", "<leader><C-f>", ":set ft=<C-i>", opts)

-- szw/vim-maximizer
map("n", "<leader>m", ":MaximizerToggle!<CR>", opts)

-- Trim trailing whitespace.
map("n", "<leader>tw", ":%s/\\s\\+$//e<cr>", opts)

--Add move line shortcuts
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

--Remap escape to leave terminal mode
map("t", "<Esc>", [[<c-\><c-n>]], opts)

map("n", "<leader>ps", ":PackerSync<CR>", opts)

map("n", "<leader>tc", "<cmd>tabclose<cr>", opts)
map("n", "<leader>tn", "<cmd>tabnext<cr>", opts)
map("n", "<leader>te", "<cmd>tabnew<cr>", opts)

-- custom replace
-- map("n", "<silent> s*", "<cmd>let @/='<'.expand('<cword>').'>'<cr>cgn", opts)

-- fugitive
map("n", "<leader>gs", ":G<CR>", opts)
map("n", "<leader>gb", ":G praise<CR>", opts)
map("n", "<leader>gc", ":G commit<cr>", opts)
map("n", "<leader>ga", ":G commit --amend<cr>", opts)
-- map("n", "<leader>gd", ":tabe %<cr>:Gvdiffsplit!<CR>", opts)
map("n", "<leader>gD", ":DiffviewOpen<cr>", opts)
map("n", "<leader>gF", ":DiffviewFileHistory<cr>", opts)
map("n", "<leader>gtd", ":G team disable<cr>", opts)
map("n", "<leader>gte", ":G team ", opts)
-- map("n", "<leader>gm", ":tabe %<cr>:Gvdiffsplit! main<CR>", opts)
-- map("n", "<leader>gM", ":DiffviewOpen main<cr>", opts)
map("n", "<leader>gl", ":Git log<cr>", opts)
map("n", "<leader>gp", ":Git push<cr>", opts)
map("n", "<leader>ll", ":diffget LOCAL<cr>", opts)
map("n", "<leader>rr", ":diffget REMOTE<cr>", opts)

-- close all open buffers
map("n", "<leader>Q", ":bufdo bdelete<cr>", opts)

-- lsp shortcuts
map("n", "<leader>li", ":LspInfo<CR>", opts)
map("n", "<leader>lr", ":LspRestart<CR>", opts)
-- map("n", "l<C-s>", ":LspStop<Space><C-i>", opts)

-- visit file even if not present
map("n", "gF", ":edit <cfile><cr>", opts)

map("n", "<leader>x", ":!open %<cr>", opts)

-- vim-test
-- these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
map("n", "t<C-n>", ":TestNearest<CR>", opts)
map("n", "t<C-f>", ":TestFile<CR>", opts)
map("n", "t<C-s>", ":TestSuite<CR>", opts)
map("n", "t<C-l>", ":TestLast<CR>", opts)
map("n", "t<C-v>", ":TestVisit<CR>", opts)

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

map("n", "<leader>tm", "<cmd>lua ToggleMouse()<cr>", opts)

--Disable numbers in terminal mode
vim.cmd([[
  augroup Terminal
    autocmd!
    au TermOpen * set nonu
  augroup end
]])

-- quick help
vim.api.nvim_set_keymap("n", "<leader>gh", ":h <C-R><C-W><CR>", opts)

-- duplicate line
vim.api.nvim_set_keymap("n", "<A-d>", ":t.<CR>", opts)
vim.api.nvim_set_keymap("v", "<A-d>", ":t.<CR>", opts)

-- autoexpand current file dir
-- cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

-- tmp diff
vim.api.nvim_set_keymap("n", "<leader>ds", ":windo diffthis<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>df", ":Gitsigns diffthis<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>do", ":diffoff!<CR>", opts)

-- ansible vault
vim.api.nvim_set_keymap("n", "<leader>vd", ":!ansible-vault decrypt %<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ve", ":!ansible-vault encrypt %<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>vv", ":!ansible-vault view %<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>so", ":SymbolsOutline<CR>", opts)

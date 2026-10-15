local map = require("utils").map

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- replace visual selection

-- Fix the & cmd Tip 93
map("n", "&", ":&&<CR>")
map("x", "&", ":&&<CR>")

-- center matching line
map("n", "<leader>n", "nzz")
map("n", "<leader>N", "Nzz")

-- map("n", "<C-c>", "<cmd>nohl<CR>") -- Clear highlights -- <c-l> became default in core
map("n", "<leader>,", ":e ~/.config/nvim/init.lua<CR>")
map("n", "<leader><C-s>", ":w | luafile %<CR>")
map("n", "<C-s>", ":w<CR>")
map("n", "<leader>ls", ":ls<CR>")
map("n", "<leader>cd", ":cd %:p:h<CR>")
-- map("n", "<leader>w", ":write<CR>")

-- Undo break points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "?", "?<c-g>u")

-- Visual shifting (does not exit Visual mode)
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Quit visual mode
-- map("v", "v", "<Esc>")

-- Quick command mode
-- map("n", "<CR>", ":")
map("n", "<leader>ef", ":Lexplore<CR>")

vim.o.wildcharm = 9
-- vim.o.wildcharm = vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-i>", true, false, true), "n", false)
-- vim.cmd([[ set wildcharm=<C-i> ]])
-- vim.opt.wildcharm = vim.fn.char2nr("^I")
-- map("n", "<leader>bb", ":buffer<Space><C-i>")
map("n", "<leader>bd", ":bdelete<CR>")
-- map("n", "<leader>wb", ":%bd|e#|bd#<CR>")
map("n", "<leader><C-f>", ":set ft=<C-i>")

-- Trim trailing whitespace.
map("n", "<leader>tw", ":%s/\\s\\+$//e<cr>")

--Add move line shortcuts
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

--Remap escape to leave terminal mode
map("t", "<Esc>", [[<c-\><c-n>]])

map("n", "<leader>ps", ":Lazy sync<CR>")

map("n", "<leader>tc", "<cmd>tabclose<cr>")
map("n", "<leader>tn", "<cmd>tabnext<cr>")
map("n", "<leader>te", "<cmd>tabnew<cr>")

-- custom replace
-- map("n", "<silent> s*", "<cmd>let @/='<'.expand('<cword>').'>'<cr>cgn")

-- Git related mappings
map("n", "<leader>gs", ":Git<CR>")
map("n", "<leader>gc", ":Git commit<cr>")
-- map("n", "<leader>gb", ":G praise<CR>")
-- map("n", "<leader>ga", ":G commit --amend<cr>")
-- map("n", "<leader>gd", ":tabe %<cr>:Gvdiffsplit!<CR>")
-- map("n", "<leader>gD", ":DiffviewOpen<cr>")
-- map("n", "<leader>gF", ":DiffviewFileHistory<cr>")
-- map("n", "<leader>gtd", ":G team disable<cr>")
-- map("n", "<leader>gte", ":G team ")
-- map("n", "<leader>gm", ":tabe %<cr>:Gvdiffsplit! main<CR>")
-- map("n", "<leader>gM", ":DiffviewOpen main<cr>")
-- map("n", "<leader>gl", ":Git log<cr>")
-- map("n", "<leader>gp", ":Git push<cr>")

-- close all open buffers
map("n", "<leader>Q", ":bufdo bdelete<cr>")

-- lsp shortcuts
map("n", "<leader>li", ":checkhealth vim.lsp<CR>")
map("n", "<leader>lr", ":lsp restart<CR>")
-- map("n", "l<C-s>", ":LspStop<Space><C-i>")

-- visit file even if not present
map("n", "gF", ":edit <cfile><cr>")

-- Disabled: conflicts with Trouble keybindings (<leader>xx, <leader>xw, etc.)
-- map("n", "<leader>x", ":!open %<cr>")

-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
  if vim.o.mouse == "a" then
    vim.cmd([[IBLDisable]])
    vim.wo.signcolumn = "no"
    vim.o.mouse = "v"
    vim.wo.number = false
    print("Mouse disabled")
  else
    vim.cmd([[IBLEnable]])
    vim.wo.signcolumn = "yes"
    vim.o.mouse = "a"
    vim.wo.number = true
    print("Mouse enabled")
  end
end
map("n", "<leader>tm", "<cmd>lua ToggleMouse()<cr>")

-- Quickly inspect spell errors on demand
ToggleSpell = function()
  if vim.o.spell == true then
    vim.o.spell = false
  else
    vim.o.spell = true
  end
end
map("n", "<leader>ts", "<cmd>lua ToggleSpell()<cr>")

-- quick help
map("n", "<leader>gh", ":h <C-R><C-W><CR>")

-- duplicate line
map("n", "<A-d>", ":t.-1<CR>")
map("v", "<A-d>", ":t.-1<CR>")

-- Format selection (handled by conform.nvim in lua/plugins/formatting.lua)
-- map("v", "<A-f>", ":FormatWrite<CR>")
-- map("n", "<A-f>", ":FormatWrite<CR>")

-- autoexpand current file dir
-- cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

-- ansible vault
map("n", "<leader>vd", ":!ansible-vault decrypt %<CR>")
map("n", "<leader>ve", ":!ansible-vault encrypt %<CR>")
map("n", "<leader>vv", ":!ansible-vault view %<CR>")

-- base64
map("v", "<leader>be", "c<c-r>=system('base64 --wrap=0',          @\")<cr><esc>")
map("v", "<leader>bd", "c<c-r>=system('base64 --decode --wrap=0', @\")<cr><esc>")


-- copy to clipboard_name
map("v", "<leader>y", [["+y]])
map("n", "<leader>y", [["+yy]])

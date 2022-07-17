local map = require("utils").map

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

map("n", "<space>g", ":Telescope current_buffer_fuzzy_find<cr>")
vim.keymap.set("v", "<space>g", function()
  local text = vim.getVisualSelection()
  tb.current_buffer_fuzzy_find({ default_text = text })
end, opts)

map("n", "<space>G", ":Telescope live_grep<cr>")
vim.keymap.set("v", "<space>G", function()
  local text = vim.getVisualSelection()
  tb.live_grep({ default_text = text })
end, opts)

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
map("n", "<leader>w", ":write<CR>")

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
map("n", "<leader>of", ":Telescope oldfiles<CR>")

vim.o.wildcharm = 9
-- vim.o.wildcharm = vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-i>", true, false, true), "n", false)
-- vim.cmd([[ set wildcharm=<C-i> ]])
-- vim.opt.wildcharm = vim.fn.char2nr("^I")
map("n", "<leader>bb", ":buffer<Space><C-i>")
map("n", "<leader>bd", ":bdelete<CR>")
map("n", "<leader>bw", ":%bd|e#|bd#<CR>")
map("n", "<leader><C-f>", ":set ft=<C-i>")

-- szw/vim-maximizer
map("n", "<leader>m", ":MaximizerToggle!<CR>")

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

map("n", "<leader>ps", ":PackerSync<CR>")

map("n", "<leader>tc", "<cmd>tabclose<cr>")
map("n", "<leader>tn", "<cmd>tabnext<cr>")
map("n", "<leader>te", "<cmd>tabnew<cr>")

-- custom replace
-- map("n", "<silent> s*", "<cmd>let @/='<'.expand('<cword>').'>'<cr>cgn")

-- fugitive
map("n", "<leader>gs", ":G<CR>")
map("n", "<leader>gb", ":G praise<CR>")
map("n", "<leader>gc", ":G commit<cr>")
map("n", "<leader>ga", ":G commit --amend<cr>")
-- map("n", "<leader>gd", ":tabe %<cr>:Gvdiffsplit!<CR>")
map("n", "<leader>gD", ":DiffviewOpen<cr>")
map("n", "<leader>gF", ":DiffviewFileHistory<cr>")
map("n", "<leader>gtd", ":G team disable<cr>")
map("n", "<leader>gte", ":G team ")
-- map("n", "<leader>gm", ":tabe %<cr>:Gvdiffsplit! main<CR>")
-- map("n", "<leader>gM", ":DiffviewOpen main<cr>")
map("n", "<leader>gl", ":Git log<cr>")
map("n", "<leader>gp", ":Git push<cr>")
map("n", "<leader>ll", ":diffget LOCAL<cr>")
map("n", "<leader>rr", ":diffget REMOTE<cr>")

-- close all open buffers
map("n", "<leader>Q", ":bufdo bdelete<cr>")

-- lsp shortcuts
map("n", "<leader>li", ":LspInfo<CR>")
map("n", "<leader>lr", ":LspRestart<CR>")
-- map("n", "l<C-s>", ":LspStop<Space><C-i>")

-- visit file even if not present
map("n", "gF", ":edit <cfile><cr>")

map("n", "<leader>x", ":!open %<cr>")

-- vim-test
-- these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
map("n", "t<C-n>", ":TestNearest<CR>")
map("n", "t<C-f>", ":TestFile<CR>")
map("n", "t<C-s>", ":TestSuite<CR>")
map("n", "t<C-l>", ":TestLast<CR>")
map("n", "t<C-v>", ":TestVisit<CR>")

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

--Disable numbers in terminal mode
vim.cmd([[
  augroup Terminal
    autocmd!
    au TermOpen * set nonu
  augroup end
]])

-- quick help
map("n", "<leader>gh", ":h <C-R><C-W><CR>")

-- duplicate line
map("n", "<A-d>", ":t.-1<CR>")
map("v", "<A-d>", ":t.-1<CR>")

-- autoexpand current file dir
-- cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

-- tmp diff
map("n", "<leader>ds", ":windo diffthis<CR>")
map("n", "<leader>df", ":Gitsigns diffthis<CR>")
map("n", "<leader>do", ":diffoff!<CR>")

-- ansible vault
map("n", "<leader>vd", ":!ansible-vault decrypt %<CR>")
map("n", "<leader>ve", ":!ansible-vault encrypt %<CR>")
map("n", "<leader>vv", ":!ansible-vault view %<CR>")

map("n", "<leader>so", ":SymbolsOutline<CR>")

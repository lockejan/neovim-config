local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<C-l>", "<cmd>noh<CR>", {noremap = true}) -- Clear highlights
map("n", "<leader>,", ":e ~/.config/nvim/init.lua<CR>", {noremap = true})
map("n", "<C-s>", ":luafile %<CR>", {noremap = true})
map("n", "<leader>ls", ":ls<CR>", {noremap = true})
map("n", "<leader>cd", ":cd %:p:h<CR>", {noremap = true})
map("n", "<Leader>w", ":write<CR>", {noremap = true})

-- Undo break points
map("i", ",", ",<c-g>u", {noremap = true})
map("i", ".", ".<c-g>u", {noremap = true})
map("i", "!", "!<c-g>u", {noremap = true})
map("i", "?", "?<c-g>u", {noremap = true})

-- moving text
map("n", "<leader>k", ":m .-2<CR>==", {noremap = true})
map("n", "<leader>j", ":m .+1<CR>==", {noremap = true})
map("i", "<C-j>", "<esc>:m .+2<CR>==", {noremap = true})
map("i", "<C-k>", "<esc>:m .-2<CR>==", {noremap = true})

map("x", "K", ":move '<-2<CR>gv-gv", {noremap = true})
map("x", "J", ":move '>+1<CR>gv-gv", {noremap = true})

-- Move visual selection vertically
map("x", "K", ":move '<-2<CR>gv-gv", {noremap = true})
map("x", "J", ":move '>+1<CR>gv-gv", {noremap = true})

-- Visual shifting (does not exit Visual mode)
map("v", "<", "<gv", {noremap = true})
map("v", ">", ">gv", {noremap = true})

-- Quit visual mode
map("v", "v", "<Esc>", {noremap = true})

-- Quick command mode
map("n", "<CR>", ":", {noremap = true})
map("n", "<leader>of", ":browse oldfiles<CR>", {noremap = true})

-- Bash like
map("i", "<C-a>", "<Home>", {noremap = true})
map("i", "<C-e>", "<End>", {noremap = true})
map("i", "<C-d>", "<Delete>", {noremap = true})

-- Buffer
map("n", "<leader>bn", ":bnext<CR>", {noremap = true})
map("n", "<leader>bp", ":bprevious<CR>", {noremap = true})
map("n", "<leader>bd", ":bdelete<CR>", {noremap = true})

-- szw/vim-maximizer
map("n", "<leader>m", ":MaximizerToggle!<CR>", {noremap = true})

map("n", "<leader>fe", ":NvimTreeFindFile<CR>", {noremap = true})
map("n", "<leader>ef", ":NvimTreeToggle<CR>", {noremap = true})

-- Y yank until the end of line
map("n", "Y", "y$", {noremap = true})

-- Trim trailing whitespace.
map("n", "<leader>tw", ":%s/\\s\\+$//e<cr>", {noremap = true})
-- map("n", "<C-c>", "<Esc>", { noremap = true })

--Add move line shortcuts
map("n", "<A-j>", ":m .+1<CR>==", {noremap = true})
map("n", "<A-k>", ":m .-2<CR>==", {noremap = true})
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", {noremap = true})
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", {noremap = true})
map("v", "<A-j>", ":m '>+1<CR>gv=gv", {noremap = true})
map("v", "<A-k>", ":m '<-2<CR>gv=gv", {noremap = true})

--Remap escape to leave terminal mode
map("t", "<Esc>", [[<c-\><c-n>]], {noremap = true})

map("n", "<leader>ps", ":PackerSync<CR>", {noremap = true})

-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
  if vim.o.mouse == "a" then
    vim.cmd [[IndentBlanklineDisable]]
    vim.wo.signcolumn = "no"
    vim.o.mouse = "v"
    vim.wo.number = false
    print "Mouse disabled"
  else
    vim.cmd [[IndentBlanklineEnable]]
    vim.wo.signcolumn = "yes"
    vim.o.mouse = "a"
    vim.wo.number = true
    print "Mouse enabled"
  end
end

map("n", "<leader>bm", "<cmd>lua ToggleMouse()<cr>", {noremap = true})

-- fugitive
map("n", "<Leader>gs", "<cmd>G<CR>", {noremap = true})

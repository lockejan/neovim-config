local utils = require("utils")
local map = vim.api.nvim_set_keymap

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

utils.map("x", "K", ":move '<-2<CR>gv-gv")
utils.map("x", "J", ":move '>+1<CR>gv-gv")

-- Move visual selection vertically
utils.map("x", "K", ":move '<-2<CR>gv-gv")
utils.map("x", "J", ":move '>+1<CR>gv-gv")

-- Visual shifting (does not exit Visual mode)
utils.map("v", "<", "<gv")
utils.map("v", ">", ">gv")

-- Quit visual mode
utils.map("v", "v", "<Esc>")

-- Quick command mode
utils.map("n", "<CR>", ":")
utils.map("n", "<leader>of", ":browse oldfiles<CR>")

-- Bash like
utils.map("i", "<C-a>", "<Home>")
utils.map("i", "<C-e>", "<End>")
utils.map("i", "<C-d>", "<Delete>")

-- Buffer
map("n", "<leader>bn", ":bnext<CR>", {noremap = true})
map("n", "<leader>bp", ":bprevious<CR>", {noremap = true})
utils.map("n", "<leader>bd", ":bdelete<CR>")

-- szw/vim-maximizer
utils.map("n", "<leader>m", ":MaximizerToggle!<CR>")

utils.map("n", "<leader>fe", ":NvimTreeFindFile<CR>")
utils.map("n", "<leader>ef", ":NvimTreeToggle<CR>")

-- secure gopass
vim.cmd "au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile"

-- Y yank until the end of line
map("n", "Y", "y$", {noremap = true})

-- Trim trailing whitespace.
utils.map("n", "<leader>tw", ":%s/\\s\\+$//e<cr>")
-- utils.map("n", "<C-c>", "<Esc>")

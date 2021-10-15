local utils = require("utils")

local map = vim.api.nvim_set_keymap

map("n", "<C-l>", "<cmd>noh<CR>", {noremap = true}) -- Clear highlights

map("n", "<leader>,", ":e ~/.config/nvim/init.lua<CR>", {noremap = true})
-- nnoremap <C-S> :so %<CR>
map("n", "<leader>ls", ":ls<CR>", {noremap = true})
map("n", "<leader>bn", ":bn<CR>", {noremap = true})
map("n", "<leader>bp", ":bp<CR>", {noremap = true})
map("n", "<leader>cd", ":cd %:p:h<CR>", {noremap = true})

-- -- Use alt + hjkl to resize windows
-- nnoremap <M-j>    :resize -2<CR>
-- nnoremap <M-k>    :resize +2<CR>
-- nnoremap <M-h>    :vertical resize -2<CR>
-- nnoremap <M-l>    :vertical resize +2<CR>

-- map('n', '<Leader>w', ':write<CR>', {noremap = true})

-- Keeping it centered
-- map("n", "n", "nzzzv", {noremap = true})
-- map("n", "N", "Nzzzv", {noremap = true})
-- map("n", "J", "mzJ`z", {noremap = true})
-- vim.api.nvim_set_keymap("n", "<Leader>w", ":write<CR>", {noremap = true})

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
-- utils.map("n", "<A-.>", ":BufferNext<CR>")
-- utils.map("n", "<A-,>", ":BufferPrevious<CR>")
utils.map("n", "<leader>.", ":BufferPick<CR>")
utils.map("n", "<A-1>", ":BufferGoto 1<CR>")
utils.map("n", "<A-2>", ":BufferGoto 2<CR>")
utils.map("n", "<A-3>", ":BufferGoto 3<CR>")
utils.map("n", "<A-4>", ":BufferGoto 4<CR>")
utils.map("n", "<A-5>", ":BufferGoto 5<CR>")
utils.map("n", "<A-6>", ":BufferGoto 6<CR>")
utils.map("n", "<A-7>", ":BufferGoto 7<CR>")
utils.map("n", "<A-8>", ":BufferGoto 8<CR>")
utils.map("n", "<A-0>", ":BufferFirst<CR>")
utils.map("n", "<A-9>", ":BufferLast<CR>")

utils.map("n", "<leader>da", ":BufferCloseAllButCurrent<CR>")
utils.map("n", "<leader>dl", ":BufferCloseBuffersLeft<CR>")
utils.map("n", "<leader>dr", ":BufferCloseBuffersRight<CR>")
-- utils.map("n", "<leader>p", ":BufferPrevious<CR>")
-- utils.map("n", "<leader>bn", ":BufferNext<CR>")
utils.map("n", "<leader>bd", ":bdelete<CR>")

-- szw/vim-maximizer
utils.map("n", "<leader>m", ":MaximizerToggle!<CR>")

utils.map("n", "<leader>fe", ":NvimTreeFindFile<CR>")
utils.map("n", "<leader>ef", ":NvimTreeToggle<CR>")

-- secure gopass
vim.cmd "au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile"

-- Y yank until the end of line
vim.api.nvim_set_keymap("n", "Y", "y$", {noremap = true})

-- Trim trailing whitespace.
utils.map("n", "<leader>tw", ":%s/\\s\\+$//e<cr>")

local utils = require("utils")

utils.map("n", "<C-l>", "<cmd>noh<CR>") -- Clear highlights

-- let maplocalleader = "ö"
utils.map("n", "<leader>,", ":e ~/.config/nvim/init.lua<CR>")
-- nnoremap <C-S> :so %<CR>
utils.map("n", "<leader>ls", ":ls<CR>")
utils.map("n", "<leader>cd", ":cd %:p:h<CR>")

-- delete without yanking
-- nnoremap <leader>d "_dd
-- vnoremap <leader>d "_dd

-- replace currently selected text with default register
-- without yanking it
-- vnoremap <leader>p "_dP
-- nnoremap <leader>p "0p

-- Better nav for omnicomplete
-- inoremap <expr> <c-j> ("\<C-n>")
-- inoremap <expr> <c-k> ("\<C-p>")

-- -- Use alt + hjkl to resize windows
-- nnoremap <M-j>    :resize -2<CR>
-- nnoremap <M-k>    :resize +2<CR>
-- nnoremap <M-h>    :vertical resize -2<CR>
-- nnoremap <M-l>    :vertical resize +2<CR>

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
utils.map("n", "<leader>p", ":BufferPrevious<CR>")
utils.map("n", "<leader>bn", ":BufferNext<CR>")
utils.map("n", "<leader>bc", ":bdelete<CR>")

-- szw/vim-maximizer
utils.map("n", "<leader>m", ":MaximizerToggle!<CR>")

utils.map("n", "<leader>ef", ":NvimTreeToggle<CR>")
-- utils.map("n", "<leader>ef", ":lua require'config.tree'.toggle_tree()<CR>")
-- utils.map("n", "<leader>q", ":lua require'config.tree'.close()<CR>")

-- secure gopass
vim.cmd "au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile"

-- Y yank until the end of line
vim.api.nvim_set_keymap("n", "Y", "y$", {noremap = true})

-- Trim trailing whitespace.
utils.map("n", "<leader>tw", ":%s/\\s\\+$//e<cr>")

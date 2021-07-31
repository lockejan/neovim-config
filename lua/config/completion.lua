local utils = require("utils")

utils.opt("o", "completeopt", "menuone,noinsert,noselect")

vim.cmd [[set shortmess+=c]]

vim.g.completion_confirm_key = "<CR>"
vim.g.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}

-- <Tab> to navigate the completion menu
utils.map("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
utils.map("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

vim.g.diagnostic_enable_virtual_text = 1
vim.g.completion_enable_snippet = "UltiSnips"
-- if !exists('g:loaded_completion') | finish | endif

-- set completeopt=menuone,noinsert,noselect

-- " Use <Tab> and <S-Tab> to navigate through popup menu
-- inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

-- let g:completion_confirm_key = ""
-- imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
--                  \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

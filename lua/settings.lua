local utils = require('utils')

local cmd = vim.cmd
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)

utils.opt('o', 'hidden', true)
utils.opt('o', 'mouse', 'a')
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 8) -- Minumum lines to keep above and below cursor
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')

utils.opt('w', 'number', true)
utils.opt('w', 'list', true)
utils.opt('w', 'spell', true)
utils.opt('w', 'wrap', true)
utils.opt('w', 'cursorline', true)
utils.opt('w', 'colorcolumn', '80')


-- (set nvim.o.updatetime 500)
-- (set nvim.o.timeoutlen 500)
-- (set nvim.o.sessionoptions "blank,curdir,folds,help,tabpages,winsize")
-- (set nvim.o.inccommand :split)

-- vim.g.python3_host_prog="~/.pyenv/versions/neovim3/bin/python"

-- "set autochdir                           " Your working directory will always be the same as your working directory
-- set autoindent
-- set autoread		" auto re-read files if unmodified inside Vim
-- " set backspace=indent,eol,start
-- " set clipboard=unnamedplus               " Copy paste between vim and everything else
-- " set clipboard="+
-- set confirm
-- set cursorline
-- set diffopt+=vertical
-- set encoding=UTF-8
-- set expandtab    " Tabs are spaces, not tabs
-- set shiftwidth=4
-- set formatoptions-=cro                  " Stop newline continution of comments
-- set history=50		" keep 50 lines of command line history
-- set hidden "no warning when switching between unsaved buffers
-- set nohlsearch                   " No Highlight search terms
-- set ignorecase     " Case insensitive search
-- set incsearch                  " Find as you type search
-- set laststatus=2	" always display the status bar
-- set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
-- set number
-- " set pumheight=20         " makes popup menu smaller
vim.ruler=true		--" show the cursor position all the time
-- vim.api.nvim_set_option('ruler', true)

-- set shiftround		" shifting lines round the indentation to the nearest multiple of "shiftwidth"
-- set shortmess=atOI " No help Uganda information, and overwrite read messages to avoid PRESS ENTER prompts
-- set showcmd		" display incomplete commands
-- set showmatch      " Show matching brackets/parentthesis
-- set showtabline=2
-- set smartcase      " ... but case sensitive when uc present
-- set smartindent
-- set smarttab                   " Smart tab
-- set softtabstop=4  " Let backspace delete indent
vim.spelllang=en_us,de_de
-- set tabstop=4      " An indentation every four columns
-- set ttimeout		" time out for key codes
-- set ttimeoutlen=100	" wait up to 100ms after Esc for special key
-- set title	 	" set windows title
-- set whichwrap+=<,>,h,l  " Allow backspace and cursor keys to cross line boundaries
-- set wildmenu		" disply cline tan complete options as a menu


-- " ignore filetypes
vim.opt.wildignore:append{ '*swp','*.class','*.pyc','*.png','*.jpg','*.gif','*.zip' }
vim.opt.wildignore:append{ '*/tmp/*','*.o','*.obj','*.so' }

-- " systemwide clipboard
if vim.fn.has('unnamedplus') == 1 then
    utils.opt('o', 'clipboard', 'unnamed,unnamedplus')
else
    vim.opt.clipboard.append({ 'unnamedplus' })
end

-- write undo for file changes
if vim.fn.has('persistent_undo') == 1 then
    utils.opt('o', 'undofile' ,true )
    utils.opt('o', 'undolevels' ,1000 )
    utils.opt('o', 'undoreload' ,10000 )
end

utils.opt('o', 'clipboard', 'unnamed,unnamedplus')

vim.g.netrw_bufsettings = 'noma nomod nonu nowrap ro buflisted'
-- utils.opt('b','gitsigns_status','')
-- vim.g.statusline:append{%{get(b:,'gitsigns_status','')}}
-- Highlight on yank
cmd 'au TextYankPost * silent! lua vim.highlight.on_yank {higroup=”IncSearch”, timeout=150, on_visual = false}'

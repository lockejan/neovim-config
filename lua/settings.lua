-- Do not source the default filetype.vim
-- vim.g.did_load_filetypes = 1

-- Disable neovim python support
vim.g.loaded_python_provider = 0

-- Preview incremental substitution
vim.o.inccommand = "split"

--Make line numbers default
vim.wo.number = true

-- Decrease updatetime of swap
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- vim.api.nvim_set_option("ruler", true) --" show the cursor position all the time (default)
-- vim.o.shortmess = "IToOlxfitn"
vim.o.autowrite = true
vim.o.breakindent = true -- indent wrapped lines accordingly
vim.o.cursorline = true -- display cursorline
vim.o.expandtab = true -- Tabs are spaces, not tabs
-- vim.o.hidden = true -- switch buffers without save (default)
vim.o.ignorecase = true -- Ignore case for search
-- vim.o.joinspaces = false -- No double spaces with join after a dot (default)
vim.o.lazyredraw = true -- faster macro execute
vim.o.list = true -- Show some invisible characters (tabs...
vim.o.mouse = "a" -- enable mouse mode
vim.o.number = true -- Show line number
-- vim.o.pumblend = 10 -- Popup blend
vim.o.pumheight = 30 -- Maximum number of entries in a popup
vim.o.scrolloff = 8 -- Minumum lines to keep above and below cursor
-- vim.o.sessionoptions = {"buffers", "curdir", "tabpages", "winsize"}
-- vim.o.shell = "/bin/bash"
-- vim.o.shiftround = true -- Round indent
vim.o.shiftwidth = 4 -- Size of an indent
-- vim.o.showmode = false -- dont show mode since we have a statusline
vim.o.sidescrolloff = 8 -- Columns of context
-- vim.o.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.smartcase = true -- Don't ignore case with capitals
vim.o.smartindent = true -- Insert indents automatically
vim.o.splitbelow = true -- Put new windows below current
vim.o.splitright = true -- Put new windows right of current
vim.o.tabstop = 4 -- Number of spaces tabs count for
vim.o.termguicolors = true -- True color support
vim.o.undofile = true
vim.o.undolevels = 10000
-- vim.o.colorcolumn = '80'
vim.o.wildmode = "longest:full,full" -- Command-line completion mode
-- vim.o.wrap = false -- Disable line wrap

vim.opt.spell = true
vim.opt.spelllang = { "en_us", "de_de" }

vim.g.onedark_terminal_italics = 1
vim.cmd([[colorscheme onedark]])

-- disable unwanted core plugins
local disabled_built_ins = {
  -- "netrw",
  -- "netrwPlugin",
  -- "netrwSettings",
  -- "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "tutor_mode_plugin",
  "rrhelper",
  "spellfile_plugin",
  "matchit",
  "matchitparen",
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

-- Use proper syntax highlighting in code blocks
local fences = {
  "lua",
  -- "vim",
  "json",
  "typescript",
  "javascript",
  "js=javascript",
  "ts=typescript",
  "shell=sh",
  "python",
  "sh",
  "console=sh",
}
vim.g.markdown_fenced_languages = fences

-- show cursor line only in active window
vim.cmd([[
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
]])

-- go to last loc when opening a buffer
vim.cmd([[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
]])

-- " ignore filetypes
-- vim.o.wildignore:append {"*swp", "*.class", "*.pyc", "*.png", "*.jpg", "*.gif", "*.zip"}
-- vim.o.wildignore:append {"*/tmp/*", "*.o", "*.obj", "*.so"}

-- -- " systemwide clipboard
-- utils.opt("o", "clipboard", "unnamed,unnamedplus")

-- Highlight on yank
vim.cmd([[
    au TextYankPost * silent! lua vim.highlight.on_yank { timeout=150, on_visual = true }
    ]])

--Disable numbers in terminal mode
vim.api.nvim_exec(
  [[
  augroup Terminal
    autocmd!
    au TermOpen * set nonu
  augroup end
]],
  false
)

-- secure gopass
vim.cmd("au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile")

require("nvim-web-devicons").setup({})

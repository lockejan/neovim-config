# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Neovim (0.12+) configuration written in Lua using lazy.nvim as the plugin manager. It lives in a home-manager dotfiles repo; external tools (language servers, formatters, linters) are installed via Nix in `~/dotfiles/home-manager/modules/neovim.nix`, not via Mason.

## Architecture

### Initialization Flow

`init.lua`:

1. **Bootstrap**: lazy.nvim is auto-installed if not present
2. **Keymappings**: `lua/keymappings.lua` loads first (sets the leader key)
3. **Plugin Setup**: lazy.nvim imports every spec in `lua/plugins/*.lua`
4. **Core Settings**: `lua/settings.lua`

Core systems (LSP, Treesitter, colorscheme) are initialized via `config` functions in their plugin specs rather than direct requires in init.lua.

### Module Structure

- **lua/plugins/*.lua**: lazy.nvim specs grouped by area (completion, dap, dev-tools, editor, files, formatting, git, lsp, treesitter, ui, colorschemes). Plugin configuration is inline via `opts`/`config`. Define each plugin in exactly one file — lazy.nvim silently merges duplicate specs.
- **lua/lsp.lua**: Diagnostics config and LSP setup. Loaded from the nvim-lspconfig spec in `lua/plugins/lsp.lua`.
- **lua/settings.lua**: Editor options, autocommands (all in the `user_settings` augroup) and debug globals (`P`, `RELOAD`, `R`).
- **lua/keymappings.lua**: Global keybindings. Leader is space. Plugin-specific mappings belong in that plugin's lazy `keys` instead.
- **lua/utils.lua**: `map()` helper — wraps `vim.keymap.set` with `silent = true` by default.

### LSP Architecture

`lua/lsp.lua` uses the Neovim 0.11+ API; nvim-lspconfig only supplies the `lsp/*.lua` server defaults:
- `vim.lsp.config("*", {...})` — shared capabilities (from cmp-nvim-lsp)
- `vim.lsp.config(name, {...})` — per-server overrides, merged with lspconfig defaults
- `vim.lsp.enable({...})` — a server only starts if it is in this list
- Keymaps are set buffer-locally in an `LspAttach` autocmd (no `on_attach`)

Enabled servers: ansiblels, bashls, clangd, cssls, dockerls, eslint, html, helm_ls, jsonls, lua_ls, gopls, nil_ls, ruff, terraformls, ts_ls, yamlls, plus vue_ls and texlab conditionally.

Special configurations:
- **Vue**: hybrid mode (vue-language-server v3+). `vue_ls` handles template/style; `ts_ls` handles `<script>` via `@vue/typescript-plugin`, whose path is resolved at runtime from the Nix `vue-language-server` binary.
- **texlab**: only enabled when `texlab` is on PATH (provide it ad hoc, e.g. `nix shell nixpkgs#texlab`).
- **lua_ls**: Neovim runtime/plugin types come from lazydev.nvim — do not add the runtime to `workspace.library` (it makes startup slow).
- **jsonls**: schemas from schemastore.nvim. **yamlls**: GitHub workflow and Threagile schemas.
- **rustaceanvim**: Rust support via its own plugin, not via `vim.lsp.enable`.

Diagnostics: configured once via `vim.diagnostic.config()` in `lua/lsp.lua` (no virtual text; float on CursorHold). Don't call `vim.diagnostic.config()` from other plugin configs — later calls override it.

### Completion System

nvim-cmp (`lua/plugins/completion.lua`):
- LuaSnip for snippets (friendly-snippets + honza/vim-snippets via the snipmate loader)
- Sources: LSP, LuaSnip, signature help, nvim_lua, path, npm, buffer, tmux, digraphs
- Integrates with nvim-autopairs
- `<Tab>` falls back to Copilot when the completion menu isn't visible

### Telescope Integration

Telescope (`lua/plugins/files.lua`):
- `fd` for find_files
- fzf-native and project.nvim extensions
- Visual-selection search via `vim.fn.getregion()`

snacks.nvim is also loaded (input, picker as `vim.ui.select`, notifier, words, bigfile).

## Common Commands

### Plugin Management
```vim
:Lazy sync    " update plugins (also <leader>ps)
:Lazy         " open Lazy UI
```
Commit `lazy-lock.json` changes together with the spec change that caused them.

### Testing
vim-test: `t<C-n>` nearest, `t<C-f>` file, `t<C-s>` suite, `t<C-l>` last, `t<C-v>` visit test file.

### Formatting & Linting
- Formatting via conform.nvim (`lua/plugins/formatting.lua`), format-on-save for selected filetypes
- Linting via nvim-lint (same file)
- `<A-f>` - Format current file/selection
- `<space>F` - Format via LSP

### Git Workflows
- vim-fugitive, gitsigns, diffview.nvim
- `<leader>gs` - `:Git` status, `<leader>gc` - `:Git commit`
- `<leader>df` - Gitsigns diff current file
- `<leader>dv` - DiffviewFileHistory for current file
- `<leader>dc` - Close diffview

### Navigation
- `<C-p>` - Find files
- `<leader>ff` - Find files (no preview)
- `<leader>sp` - Live grep
- `<leader><space>` - Buffer switcher
- `<leader>op` - Projects picker
- `<leader>so` - Symbols outline (outline.nvim)

### LSP Operations
- `gd` / `gD` - Definition / declaration
- `gr` - References, `gR` - References in Telescope
- `K` - Hover
- `<space>ca` - Code actions, `<space>rn` - Rename
- `[d` / `]d` - Previous / next diagnostic (Neovim defaults)
- `<leader>li` - `:checkhealth vim.lsp`, `<leader>lr` - `:lsp restart`
- Core defaults also apply: `grn`, `gra`, `grr`, `gri`, `grt`, `gO`

### Debug Adapter Protocol (DAP)
nvim-dap, nvim-dap-ui and nvim-dap-go (`lua/plugins/dap.lua`) lazy-load on their keys (e.g. `<F5>`).

## Development Notes

### Lua Development
- lazydev.nvim for Neovim Lua development
- nvim-luadev for REPL-like Lua evaluation (`:Luadev`)
- Helpers in settings.lua: `P(v)` pretty print, `RELOAD(module)`, `R(name)` reload and require

### Configuration Reload
- `<leader>,` - Edit init.lua
- `<leader><C-s>` - Save and source current Lua file (autocmds use cleared augroups, so re-sourcing is safe)

### File Type Specifics
- HTML files detected as htmldjango
- Markdown and git commits have spellcheck enabled
- EditorConfig is built into Neovim (no plugin)
- Big files (>1.5 MB or minified) get filetype `bigfile` via snacks.nvim; treesitter, LSP, cmp and colorizer skip them

### NixOS Integration
Language servers and tools come from `~/dotfiles/home-manager/modules/neovim.nix`. Language groups there can be toggled; e.g. `latexPackages` is commented out. The Python/Node/Perl/Ruby providers are disabled.

### Security Considerations
- gopass files: No swap, backup, or undo files
- Ansible vault shortcuts: `<leader>vd/ve/vv` for decrypt/encrypt/view

## Plugin Dependencies

When modifying plugins:
- lazy.nvim handles automatic installation
- Some plugins require external tools (fd, rg/ripgrep, make)
- Treesitter parsers do not auto-install (nvim-treesitter `main` branch); add them to the `install({...})` list in lua/plugins/treesitter.lua, including parsers needed for injections (e.g. `diff` for gitcommit)
- Prefer Neovim core features over plugins where core covers it (commenting, EditorConfig, `:grep` with rg, diagnostic keymaps)

## Special Patterns

### Lazy Loading
- CopilotChat.nvim builds tiktoken on install
- nvim-sops lazy loads on BufEnter
- Telescope fzf-native requires make for building

### Custom Text Objects
Via targets.vim, CamelCaseMotion, and nvim-treesitter-textobjects:
- `af/if` - Function outer/inner
- `ac/ic` - Class outer/inner
- `aC/iC` - Conditional outer/inner

### Treesitter Integration
Highlighting and indentation are started per buffer from a FileType autocmd (skipped for `bigfile`). Folding uses treesitter but is disabled by default:
```lua
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false
```

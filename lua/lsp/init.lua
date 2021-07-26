local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- Lua LSP
local sumneko_root_path = vim.fn.stdpath("cache") .. "/nlua/sumneko_lua"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

-- Your custom attach function for nvim-lspconfig goes here.
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings
  local opts = {noremap = true, silent = true}

  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- formatting
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end

  require("completion").on_attach(client, bufnr)
end

local luadev =
  require("lua-dev").setup(
  {
    -- add any options here, or leave empty to use the default settings
    lspconfig = {
      on_attach = on_attach,
      cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"}
    }
  }
)

local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup(luadev)

-- docker
lspconfig.dockerls.setup {}

-- pyright
lspconfig.pyright.setup {}

-- nix lsp
-- require'lspconfig'.rnix.setup{}

-- tex
-- require'lspconfig'.texlab.setup{}

-- Yaml
lspconfig.yamlls.setup {}

require("lspkind").init(
  {
    -- enables text annotations
    -- default: true
    with_text = true,
    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    -- default: 'default'
    preset = "codicons",
    -- override preset symbols
    -- default: {}
    symbol_map = {
      Text = "",
      Method = "ƒ",
      Function = "",
      Constructor = "",
      Variable = "",
      Class = "",
      Interface = "ﰮ",
      Module = "",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "了",
      Keyword = "",
      Snippet = "﬌",
      Color = "",
      File = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = ""
    }
  }
)

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ""
    }
  }
)

-- Typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  filetypes = {"typescript", "typescriptreact", "typescript.tsx"}
}

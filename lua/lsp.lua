-- disable virtual_text diagnostics in buffer
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = false,
  signs = true,
  update_in_insert = true,
  severity_sort = false,
})

vim.diagnostic.config({
  virtual_text = {
    source = "always", -- Or "if_many"
  },
  float = {
    source = "always", -- Or "if_many"
  },
})

-- diagnostic signs in column
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local nvim_lsp = require("lspconfig")

-- diagnostic preview on cursor visit
-- vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]])

-- Your custom attach function for nvim-lspconfig goes here.
local opts = { silent = true }
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set("n", "<space>wl", function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", bufopts)
  vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end

local lsp_flags = {
  debounce_text_changes = 150,
}

local servers = {
  -- "ansiblels",
  "bashls",
  "clangd",
  -- "clojure_lsp",
  "cssls",
  "dockerls",
  "eslint",
  "elmls",
  "html",
  -- "hls",
  "gopls",
  -- "intelephense",
  "rnix",
  "pyright",
  -- "tsserver",
  "vimls",
}

--Enable (broadcasting) snippet capability for completion
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, server in pairs(servers) do
  nvim_lsp[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
  })
end

nvim_lsp.tsserver.setup({
  init_options = require("nvim-lsp-ts-utils").init_options,
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
})

local node_mods =
  "/Users/lockejan/dotfiles/home-manager/configs/nvim/node_modules/@ansible/ansible-language-server/bin/"
nvim_lsp.ansiblels.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  cmd = { node_mods .. "ansible-language-server", "--stdio" },
})

local pid = vim.fn.getpid()
nvim_lsp.omnisharp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
})

nvim_lsp.rust_analyzer.setup({
  cmd = { "rustup", "run", "nightly", "rust-analyzer" },
  capabilities = capabilities,
  flags = lsp_flags,
  on_attach = on_attach,
})

nvim_lsp.yamlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://raw.githubusercontent.com/Threagile/threagile/master/support/schema.json"] = "/*.threagile.yaml",
      },
    },
  },
})

nvim_lsp.jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
})

-- Lua LSP
-- local luadev = require("lua-dev").setup({
--   lspconfig = {
--     on_attach = on_attach,
--     capabilities = capabilities,
-- flags = lsp_flags,
--     cmd = { "lua-language-server" },
--   },
-- })
-- nvim_lsp.sumneko_lua.setup(luadev)

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = runtime_path,
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

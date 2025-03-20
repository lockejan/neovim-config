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
    style = "minimal",
    border = "rounded",
    source = "always", -- Or "if_many"
  },
})

-- diagnostic signs in column
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
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

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local function opts_with_desc(desc)
    local buffer_opts = { noremap = true, silent = true, buffer = bufnr }
    return { unpack(buffer_opts), desc = desc }
  end
  -- Mappings
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts_with_desc("Go to declaration"))
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts_with_desc("Go to definition"))
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts_with_desc("Show hover"))
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts_with_desc("Go to implementation"))
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts_with_desc("Show signature help"))
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts_with_desc("Add workspace folder"))
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts_with_desc("Remove workspace folder"))
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts_with_desc("List workspace folders"))
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts_with_desc("Go to type definition"))
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts_with_desc("Rename symbol"))
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts_with_desc("Code action"))
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts_with_desc("Show references"))
  vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts_with_desc("Show references with Telescope"))
  vim.keymap.set("n", "<space>F", function()
    vim.lsp.buf.format({ async = true })
  end, opts_with_desc("Format code via LSP"))
end

local lsp_flags = {
  debounce_text_changes = 150,
}

local servers = {
  -- "ansible-language-server",
  "bashls",
  "clangd",
  -- "clojure_lsp",
  "cssls",
  "dockerls",
  "eslint",
  -- "elmls",
  "html",
  "helm_ls",
  -- "hls",
  "gopls",
  "nil_ls",
  -- "pyright",
  "ruff",
  "terraformls",
  "texlab",
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

nvim_lsp.ansiblels.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  cmd = { "ansible-language-server", "--stdio" },
})

nvim_lsp.volar.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  cmd = { "vue-language-server", "--stdio" },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    vue = {
      -- disable hybrid mode
      hybridMode = false,
    },
  },
})

-- nvim_lsp.rust_analyzer.setup({
--   cmd = { "rustup", "run", "nightly", "rust-analyzer" },
--   capabilities = capabilities,
--   flags = lsp_flags,
--   on_attach = on_attach,
-- })

-- nvim_lsp.rust_analyzer.setup({
--   on_attach = on_attach,
--     capabilities = capabilities,
--     flags = lsp_flags,
--   settings = {
--     ["rust-analyzer"] = {
--       imports = {
--         granularity = {
--           group = "module",
--         },
--         prefix = "self",
--       },
--       cargo = {
--         buildScripts = {
--           enable = true,
--         },
--       },
--       procMacro = {
--         enable = true,
--       },
--     },
--   },
-- })

local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
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

nvim_lsp.lua_ls.setup({
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
        checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

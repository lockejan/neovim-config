vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  virtual_text = false, -- shown in a float on CursorHold instead
  virtual_lines = false,
  float = {
    style = "minimal",
    border = "rounded",
    source = true,
    focusable = false,
  },
  -- diagnostic signs in column
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
    },
  },
})

local augroup = vim.api.nvim_create_augroup("user_lsp", { clear = true })

-- diagnostic preview on cursor visit
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = augroup,
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor", prefix = " " })
  end,
})

-- [d / ]d (diagnostic navigation) are Neovim defaults
local opts = { silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Buffer-local mappings once a server attaches.
-- Core also provides grn, gra, grr, gri, grt, gO and K / <C-s> by default.
vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup,
  callback = function(ev)
    local function map(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { silent = true, buffer = ev.buf, desc = desc })
    end

    map("gD", vim.lsp.buf.declaration, "Go to declaration")
    map("gd", vim.lsp.buf.definition, "Go to definition")
    map("K", vim.lsp.buf.hover, "Show hover")
    map("gI", vim.lsp.buf.implementation, "Go to implementation")
    map("<C-k>", vim.lsp.buf.signature_help, "Show signature help")
    map("<space>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
    map("<space>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
    map("<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "List workspace folders")
    map("<space>D", vim.lsp.buf.type_definition, "Go to type definition")
    map("<space>rn", vim.lsp.buf.rename, "Rename symbol")
    map("<space>ca", vim.lsp.buf.code_action, "Code action")
    map("gr", vim.lsp.buf.references, "Show references")
    map("gR", "<cmd>Telescope lsp_references<CR>", "Show references with Telescope")
    map("<space>F", function()
      vim.lsp.buf.format({ async = true })
    end, "Format code via LSP")
  end,
})

-- Shared settings for every server (merged with nvim-lspconfig's lsp/*.lua defaults)
vim.lsp.config("*", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://raw.githubusercontent.com/Threagile/threagile/master/support/schema.json"] = "/*.threagile.yaml",
      },
    },
  },
})

vim.lsp.config("jsonls", {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})

-- Neovim runtime/plugin types are provided by lazydev.nvim
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

-- Vue (v3+ hybrid mode): vue_ls handles template/style, ts_ls handles <script>
-- via @vue/typescript-plugin. The plugin ships inside the (nix) vue-language-server
-- package, so resolve it from the binary to keep versions in sync.
local vue_ls_bin = vim.fn.exepath("vue-language-server")
if vue_ls_bin ~= "" then
  local vue_root = vim.fs.dirname(vim.fs.dirname(vim.uv.fs_realpath(vue_ls_bin)))
  local vue_plugin = vim.fs.joinpath(vue_root, "lib/language-tools/packages/typescript-plugin")
  vim.lsp.config("ts_ls", {
    init_options = {
      plugins = {
        { name = "@vue/typescript-plugin", location = vue_plugin, languages = { "vue" } },
      },
    },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  })
  vim.lsp.enable("vue_ls")
end

-- Only rarely needed (CV); provide it on demand, e.g. `nix shell nixpkgs#texlab`
if vim.fn.executable("texlab") == 1 then
  vim.lsp.enable("texlab")
end

vim.lsp.enable({
  "ansiblels",
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
  "jsonls",
  "lua_ls",
  "gopls",
  "nil_ls",
  -- "pyright",
  "ruff",
  "terraformls",
  "ts_ls",
  "yamlls",
})

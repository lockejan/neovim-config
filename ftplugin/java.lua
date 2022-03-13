local map = vim.api.nvim_set_keymap

-- jdtls
map("n", "<A-o>", "<Cmd>lua require'jdtls'.organize_imports()<CR>", { noremap = true })
map("n", "<leader>ev", "<Cmd>lua require('jdtls').extract_variable()<CR>", { noremap = true })
map("v", "<leader>ev", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", { noremap = true })
map("n", "<leader>ec", "<Cmd>lua require('jdtls').extract_constant()<CR>", { noremap = true })
map("v", "<leader>ec", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", { noremap = true })
map("v", "<leader>em", "<Esc><Cmd>lua require('jdtls').extract_method()<CR>", { noremap = true })

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local home = vim.fn.expand("$HOME")
local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" })

local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.level=ALL",
    "-noverify",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    home .. "/jdtls/jdt-language-server-latest/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
    "-configuration",
    home .. "/jdtls/jdt-language-server-latest/config_mac",
    "-data",
    root_dir .. project_name,
  },

  capabilities = capabilities,
  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {},
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {},
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require("jdtls").start_or_attach(config)

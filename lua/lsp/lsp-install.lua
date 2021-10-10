local function setup_servers()
  require "lspinstall".setup()

  local servers = require "lspinstall".installed_servers()
  for _, server in pairs(servers) do
    require "lspconfig"[server].setup {}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "lspinstall".post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

function _G.lsp_reinstall_all()
  local lspinstall = require "lspinstall"
  for _, server in ipairs(lspinstall.installed_servers()) do
    lspinstall.install_server(server)
  end
end

vim.cmd "command! -nargs=0 LspReinstallAll call v:lua.lsp_reinstall_all()"

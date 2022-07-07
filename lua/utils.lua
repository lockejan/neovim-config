local M = {}

M.map = function(mode, mapping, cmd, opts)
  if opts == nil then
    opts = {}
  end

  if next(opts) == nil then
    return vim.api.nvim_set_keymap(mode, mapping, cmd, { noremap = true, silent = true })
  end
  return vim.api.nvim_set_keymap(mode, mapping, cmd, opts)
end

return M

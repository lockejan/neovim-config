require("lint").linters_by_ft = {
  markdown = { "vale" },
  nix = { "statix" },
}
vim.api.nvim_create_autocmd({ "TextChanged" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

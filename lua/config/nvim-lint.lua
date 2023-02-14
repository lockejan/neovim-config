require("lint").linters_by_ft = {
  -- markdown = { "vale" },
  -- python = { "bandit","flake8","mypy" "pyflakes"},
  -- clojure = { "cl-kondo" },
  -- haskell = {"hlint"}
  nix = { "statix" },
}
vim.api.nvim_create_autocmd({ "TextChanged" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

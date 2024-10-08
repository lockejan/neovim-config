require("lint").linters_by_ft = {
  -- markdown = { "vale" },
  -- python = { "bandit","flake8","mypy" "pyflakes"},
  -- clojure = { "cl-kondo" },
  -- haskell = {"hlint"}
  nix = { "statix" },
  dockerfile = { "hadolint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { ".github/**/*.yaml", ".github/**/*.yml" },
  callback = function()
    require("lint").try_lint("actionlint")
  end,
})

require("formatter").setup({
  logging = false,
  filetype = {
    javascript = {
      function()
        return {
          exe = "prettier",
          args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
          stdin = true,
        }
      end,
    },
    clojure = {
      function()
        return {
          exe = "cljstyle",
          args = { "pipe" },
          stdin = true,
          cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
        }
      end,
    },
    rust = {
      function()
        return {
          exe = "rustfmt",
          args = { "--emit=stdout" },
          stdin = true,
        }
      end,
    },
    nix = {
      function()
        return {
          exe = "nixfmt",
          args = {},
          stdin = true,
        }
      end,
    },
    lua = {
      function()
        return {
          exe = "stylua",
          args = { "-" },
          stdin = true,
        }
      end,
    },
    python = {
      function()
        return {
          exe = "yapf",
          args = { "--style", "pep8" },
          stdin = true,
        }
      end,
    },
    cpp = {
      function()
        return {
          exe = "clang-format",
          args = {},
          stdin = true,
          cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
        }
      end,
    },
    shell = {
      function()
        return {
          exe = "shfmt -i 2 -ci -bn", -- google code style
          args = {},
          stdin = true,
        }
      end,
    },
  },
})

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua,*.clj,*.py,*.nix,*.sh Format
augroup END
]],
  true
)

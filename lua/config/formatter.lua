local shell_fmt = function()
  return {
    exe = "shfmt", -- google code style
    args = { "-i", 2, "-ci", "-bn" },
    stdin = true,
  }
end

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
    java = {
      function()
        return {
          exe = "google-java-format",
          args = { "-" },
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
          exe = "nixpkgs-fmt",
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
    terraform = {
      function()
        return {
          exe = "terraform",
          args = { "fmt", "-" },
          stdin = true,
        }
      end,
    },
    zsh = { shell_fmt },
    sh = { shell_fmt },
    bash = { shell_fmt },
  },
})

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua,*.clj,*.py,*.nix,*.sh,*.java Format
augroup END
]],
  true
)

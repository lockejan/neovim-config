-- Code formatting and linting plugins

return {
  -- Modern async formatter
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {
        "<A-f>",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = { "n", "v" },
        desc = "Format buffer or selection",
      },
    },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          json = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          markdown = { "prettier" },
          yaml = { "prettier" },
          java = { "google-java-format" },
          clojure = { "cljstyle" },
          rust = { "rustfmt" },
          nix = { "nixpkgs_fmt" },
          lua = { "stylua" },
          python = { "black" },
          cpp = { "clang_format" },
          c = { "clang_format" },
          terraform = { "terraform_fmt" },
          zsh = { "shfmt" },
          sh = { "shfmt" },
          bash = { "shfmt" },
        },

        -- Customize formatter options
        formatters = {
          shfmt = {
            prepend_args = { "-i", "2", "-ci", "-bn" },
          },
          prettier = {
            prepend_args = { "--single-quote" },
          },
          black = {
            prepend_args = { "-q" },
          },
        },

        -- Format on save for specified filetypes
        format_on_save = function(bufnr)
          -- Get the filetype
          local ft = vim.bo[bufnr].filetype

          -- Only format these filetypes on save
          local format_on_save_fts = {
            javascript = true,
            typescript = true,
            rust = true,
            lua = true,
            clojure = true,
            python = true,
            nix = true,
            sh = true,
            bash = true,
            zsh = true,
            java = true,
          }

          if format_on_save_fts[ft] then
            return {
              timeout_ms = 2000, -- Increased from 500ms to 2000ms for slower formatters like black
              lsp_fallback = true,
            }
          end
        end,
      })
    end,
  },

  -- Linting
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        nix = { "statix" },
        dockerfile = { "hadolint" },
        -- Commented out linters from original config (uncomment if needed):
        -- markdown = { "vale" },
        -- python = { "bandit", "flake8", "mypy", "pyflakes" },
        -- clojure = { "clj-kondo" },
        -- haskell = { "hlint" },
      }

      -- Configure diagnostic signs with Nerd Font icons
      local signs = {
        Error = "󰅚 ",
        Warn = "󰀪 ",
        Hint = "󰌶 ",
        Info = " ",
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- Configure diagnostic display
      vim.diagnostic.config({
        virtual_text = false, -- Disable inline virtual text, use float instead
        float = {
          source = "always", -- Always show source in floating window
          border = "rounded",
          focusable = false,
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Show diagnostic popup on hover
      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "always",
            prefix = " ",
            scope = "cursor",
          }
          vim.diagnostic.open_float(nil, opts)
        end,
      })

      -- Create lint function
      local function do_lint()
        -- Try general linting first
        lint.try_lint()

        -- Check for GitHub Actions files specifically
        local filename = vim.fn.expand("%:p")
        if filename:match("%.github/.*%.ya?ml$") then
          lint.try_lint("actionlint")
        end
      end

      -- Lint on buffer enter, save, and after editing
      local lint_augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
        group = lint_augroup,
        callback = do_lint,
      })

      vim.api.nvim_create_autocmd({ "BufEnter" }, {
        group = lint_augroup,
        callback = function()
          -- Small delay to ensure buffer is fully loaded
          vim.defer_fn(do_lint, 10)
        end,
      })

      vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
        group = lint_augroup,
        callback = do_lint,
      })

      -- Lint current buffer immediately on plugin load
      do_lint()
    end,
  },
}

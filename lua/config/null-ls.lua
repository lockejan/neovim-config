require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.formatting.nixfmt,
    require("null-ls").builtins.formatting.yapf,
    require("null-ls").builtins.formatting.shfmt,
    require("null-ls").builtins.diagnostics.eslint,
    -- require("null-ls").builtins.completion.spell,
  },
})

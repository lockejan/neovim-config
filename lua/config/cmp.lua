vim.o.completeopt = "menu,menuone,noselect"

-- Setup nvim-cmp.
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
-- cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"

cmp.setup({
  formatting = {
    format = require("lspkind").cmp_format({
      with_text = true,
      maxwidth = 50,
      menu = {
        path = "[Path]",
        buffer = "[Buffer]",
        luasnip = "[LuaSnip]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        spell = "[Spell]",
        npm = "[NPM]",
        -- conjure = "[Conjure]",
        tmux = "[Tmux]",
        ultisnips = "[UltiSnips]",
      },
    }),
  },
  snippet = {
    expand = function(args)
      -- require("luasnip").lsp_expand(args.body)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
  }),
  sources = cmp.config.sources({
    { name = "luasnip" },
    { name = "npm", keyword_length = 4 },
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "nvim_lua" },
    { name = "path" },
    -- { name = "conventionalcommits" },
    {
      name = "buffer",
      keyword_length = 2,
      -- priority = 50,
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    },
    -- { name = "spell", keyword_length = 3 },
    -- { name = "digraphs" },
    -- { name = "conjure" },
    { name = "tmux" },
    { name = "ultisnips" },
  }),
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
})

-- cmp.setup.filetype("gitcommit", {
--   sources = cmp.config.sources({
--     { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
--   }, {
--     { name = "buffer" },
--   }),
-- })

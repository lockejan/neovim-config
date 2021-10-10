vim.o.completeopt = "menu,menuone,noinsert"

-- Setup nvim-cmp.
local cmp = require "cmp"

cmp.setup(
  {
    formatting = {
      format = require("lspkind").cmp_format(
        {
          with_text = true,
          menu = ({
            path = "[Path]",
            buffer = "[Buffer]",
            luasnip = "[LuaSnip]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[Lua]",
            spell = "[Spell]",
            tmux = "[Tmux]",
            ultisnips = "[UltiSnips]"
          })
        }
      )
    },
    snippet = {
      expand = function(args)
        -- For `luasnip` user.
        -- require("luasnip").lsp_expand(args.body)

        -- For `ultisnips` user.
        vim.fn["UltiSnips#Anon"](args.body)
      end
    },
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm(
        {
          select = true,
          behavior = cmp.ConfirmBehavior.Replace
        }
      )
    },
    sources = {
      {name = "buffer"},
      --     {name = "calc"},
      --     {name = "cmp_tabnine"},
      --     {name = "emoji"},
      --     {name = "look"},
      {name = "luasnip"},
      {name = "nvim_lsp"},
      {name = "nvim_lua"},
      {name = "path"},
      {name = "spell"},
      {name = "tmux"},
      {name = "ultisnips"}
    }
  }
)

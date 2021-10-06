vim.o.completeopt = "menu,menuone,noselect"

-- Setup nvim-cmp.
local cmp = require "cmp"

cmp.setup(
  {
    formatting = {
      format = function(entry, vim_item)
        -- fancy icons and a name of kind
        vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
        -- set a name for each source
        vim_item.menu =
          ({
          -- calc = "[Calc]",
          -- emoji = "[Emoji]"
          -- look = "[Look]",
          path = "[Path]",
          buffer = "[Buffer]",
          luasnip = "[LuaSnip]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          spell = "[Spell]",
          tmux = "[Tmux]",
          ultisnips = "[UltiSnips]"
        })[entry.source.name]
        return vim_item
      end
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

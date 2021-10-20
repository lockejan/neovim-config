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
            -- luasnip = "[LuaSnip]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[Lua]",
            spell = "[Spell]",
            tags = "[Tag]",
            tmux = "[Tmux]",
            ultisnips = "[UltiSnips]"
          })
        }
      )
    },
    snippet = {
      expand = function(args)
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
      -- {name = "luasnip"},
      {name = "nvim_lsp"},
      {name = "nvim_lua"},
      {name = "path"},
      {name = "spell"},
      {name = "tags"},
      {name = "tmux"},
      {name = "ultisnips"}
    }
  }
)

-- autopairs setup
require("nvim-autopairs").setup {}
-- you need setup cmp first put this after cmp.setup()
require("nvim-autopairs.completion.cmp").setup(
  {
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
    auto_select = true, -- automatically select the first item
    insert = false, -- use insert confirm behavior instead of replace
    map_char = {
      -- modifies the function or method delimiter by filetypes
      all = "(",
      tex = "{"
    }
  }
)

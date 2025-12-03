-- Completion and snippet plugins

return {
  -- LuaSnip snippet engine (replaces UltiSnips)
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      -- Snippet collection
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local ls = require("luasnip")

      -- Load snippets from friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Load snippets from honza/vim-snippets and custom snippets/ directory
      require("luasnip.loaders.from_snipmate").lazy_load()

      -- Snippet navigation is handled by Tab/S-Tab in cmp mappings below
      -- No separate keybindings needed here
      vim.keymap.set({ "i" }, "<C-K>", function()
        ls.expand()
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-L>", function()
        ls.jump(1)
      end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-J>", function()
        ls.jump(-1)
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
    end,
  },

  -- Snippet collection (replaces honza/vim-snippets)
  {
    "rafamadriz/friendly-snippets",
    lazy = true,
  },

  -- Keep honza/vim-snippets for compatibility (LuaSnip can load them)
  {
    "honza/vim-snippets",
    lazy = true,
  },

  -- Pictograms for LSP completion
  {
    "onsails/lspkind-nvim",
    lazy = true,
  },

  -- Completion sources
  { "hrsh7th/cmp-buffer", lazy = true },
  { "hrsh7th/cmp-path", lazy = true },
  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "hrsh7th/cmp-nvim-lua", lazy = true },
  { "hrsh7th/cmp-nvim-lsp-signature-help", lazy = true },
  { "saadparwaiz1/cmp_luasnip", lazy = true },
  { "David-Kunz/cmp-npm", lazy = true, ft = { "json" } },
  { "andersevenrud/cmp-tmux", lazy = true },
  { "dmitmel/cmp-digraphs", lazy = true },

  -- Main completion plugin
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "saadparwaiz1/cmp_luasnip",
      "David-Kunz/cmp-npm",
      "andersevenrud/cmp-tmux",
      "dmitmel/cmp-digraphs",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      -- Set completeopt
      vim.o.completeopt = "menu,menuone,noselect"

      -- Integrate with nvim-autopairs
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      cmp.setup({
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
            menu = {
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              path = "[Path]",
              npm = "[NPM]",
              tmux = "[Tmux]",
              digraphs = "[Digraph]",
              nvim_lsp_signature_help = "[Signature]",
            },
          }),
        },

        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
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
          -- Use Ctrl-n/Ctrl-p for completion navigation (Tab reserved for Copilot)
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          -- Tab/S-Tab: Let Copilot handle these (fallback when cmp not visible)
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback() -- Copilot will handle this
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip", priority = 750 },
          { name = "nvim_lsp_signature_help", priority = 700 },
          { name = "nvim_lua", priority = 650 },
          { name = "path", priority = 500 },
          { name = "npm", keyword_length = 4, priority = 400 },
          {
            name = "buffer",
            keyword_length = 2,
            priority = 300,
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
            },
          },
          { name = "tmux", priority = 200 },
          { name = "digraphs", priority = 100 },
        }),

        experimental = {
          ghost_text = true,
        },
      })
    end,
  },
}

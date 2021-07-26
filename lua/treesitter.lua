-- if !exists('g:loaded_nvim_treesitter')
--   echom "Not loaded treesitter"
--   finish
-- endif

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ensure_installed = {
  --   "tsx",
  --   "toml",
  --   "fish",
  --   "php",
  --   "json",
  --   "yaml",
  --   "swift",
  --   "html",
  --   "scss"
  -- },
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},
  },
  indent = {
    enable = false,
    -- disable_filetype = {"python"}
  },
   rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  },
   matchup = {
    enable = true              -- mandatory, false will disable the whole extension
  },
   autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }

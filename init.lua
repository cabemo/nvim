-- Import configurations
-- Main configurations
vim.cmd([[
  source ~/.config/nvim/config/coc.vim
  source ~/.config/nvim/config/airline.vim
  source ~/.config/nvim/config/variables.vim
  source ~/.config/nvim/config/mappings.vim
  source ~/.config/nvim/config/fzf.vim
"  source ~/.config/nvim/config/langclient.vim
  source ~/.config/nvim/config/rooter.vim
  source ~/.config/nvim/config/conflict-marker.vim

  " Gruvbox
  autocmd vimenter * ++nested colorscheme gruvbox
  " Faster
  set updatetime=100
  set termguicolors " this variable must be enabled for colors to be applied properly
  set statusline+=%F
]])

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
  Plug('junegunn/fzf', { run = ':call fzf#install()' })
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
  Plug('neoclide/coc.nvim', {branch = 'release'})
--  Plug('autozimu/LanguageClient-neovim', { branch = 'next', run = 'bash install.sh' })
--  Plug('iamcco/markdown-preview.nvim', { run = 'cd app && yarn install'  })
--  Plug 'jparise/vim-graphql'
  Plug 'airblade/vim-gitgutter'
--  Plug('mg979/vim-visual-multi', {branch = 'master'})
--  Plug 'dense-analysis/ale'
--  Plug 'peitalin/vim-jsx-typescript'
  Plug 'https://github.com/rhysd/conflict-marker.vim'
  Plug 'gruvbox-community/gruvbox'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'whiteinge/diffconflicts'
  Plug 'tpope/vim-surround'
--  Plug 'feline-nvim/feline.nvim'
  Plug 'easymotion/vim-easymotion'
--  Plug 'jupyter-vim/jupyter-vim'
--  Plug('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
--  Plug 'mfussenegger/nvim-dap'
--  Plug 'leoluz/nvim-dap-go'
--  Plug 'rcarriga/nvim-dap-ui'
--  Plug 'theHamsta/nvim-dap-virtual-text'
  Plug 'tpope/vim-fugitive'
--  Plug 'nvim-treesitter/playground'
--  Plug 'lewis6991/nvim-treesitter-context'
  Plug 'jiangmiao/auto-pairs'
  Plug 'github/copilot.vim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/tagbar'
vim.call('plug#end')

require('colorizer').setup()

-- require "nvim-treesitter.configs".setup({
--   ensure_installed = { "go", "lua" },
--   auto_install = true,
--   highlight = {
--     enable = true
--   },
--   indent = {
--     enable = true
--   },
--   playground = {
--     enable = true,
--     disable = {},
--     updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
--     persist_queries = false, -- Whether the query persists across vim sessions
--     keybindings = {
--       toggle_query_editor = 'o',
--       toggle_hl_groups = 'i',
--       toggle_injected_languages = 't',
--       toggle_anonymous_nodes = 'a',
--       toggle_language_display = 'I',
--       focus_language = 'f',
--       unfocus_language = 'F',
--       update = 'R',
--       goto_node = '<cr>',
--       show_help = '?',
--     },
--   },
--   query_linter = {
--     enable = true,
--     use_virtual_text = true,
--     lint_events = {"BufWrite", "CursorHold"},
--   },
-- })

-- require("dap-go").setup()

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
-- require("dapui").setup({
--   layouts = {
--     {
--       elements = {
--       -- Elements can be strings or table with id and size keys.
--         { id = "scopes", size = 0.25 },
--         "breakpoints",
--         "stacks",
--         "watches",
--       },
--       size = 0.35, -- 40 columns
--       position = "left",
--     },
--     {
--       elements = {
--         "repl",
--       },
--       size = 0.25, -- 25% of total lines
--       position = "bottom",
--     },
--   },
-- })
require("nvim-web-devicons").setup({
  default = true
})
require("nvim-tree").setup({
  respect_buf_cwd = true,
  create_in_closed_folder = true,
  renderer = {
    highlight_git = true,
    indent_markers = { enable = false },
    highlight_opened_files = "name",
    root_folder_modifier = ':~',
    add_trailing = true,
    group_empty = false,
    special_files = { 'README.md', 'Makefile', 'MAKEFILE' },
    icons = {
      padding = ' ',
      symlink_arrow = ' -> ',
      show = {
        file = true,
        folder = true,
        git = true
      },
      glyphs = {
       default = '',
       symlink = '',
       git = {
         unstaged = "✗",
         staged = "✓",
         unmerged = "",
         renamed = "➜",
         untracked = "★",
         deleted = "",
         ignored = "◌"
         },
       folder = {
         arrow_closed = "➙",
         arrow_open = "➘",
         default = "",
         open = "",
         empty = "",
         empty_open = "",
         symlink = "",
         symlink_open = "",
         }
     }
      }
    }
})

---depends om https://github.com/feline-nvim/feline.nvim
-- local present, feline = pcall(require, "feline")

-- if not present then
--  return
--end

--local theme = {
--  aqua = "#7AB0DF",
--  bg = "#1C212A",
--  blue = "#5FB0FC",
--  cyan = "#70C0BA",
--  darkred = "#FB7373",
--  fg = "#C7C7CA",
--  gray = "#222730",
--  green = "#79DCAA",
--  lime = "#54CED6",
--  orange = "#FFD064",
--  pink = "#D997C8",
--  purple = "#C397D8",
--  red = "#F87070",
--  yellow = "#FFE59E"
--}
--
--local mode_theme = {
--  ["NORMAL"] = theme.green,
--  ["OP"] = theme.cyan,
--  ["INSERT"] = theme.aqua,
--  ["VISUAL"] = theme.yellow,
--  ["LINES"] = theme.darkred,
--  ["BLOCK"] = theme.orange,
--  ["REPLACE"] = theme.purple,
--  ["V-REPLACE"] = theme.pink,
--  ["ENTER"] = theme.pink,
--  ["MORE"] = theme.pink,
--  ["SELECT"] = theme.darkred,
--  ["SHELL"] = theme.cyan,
--  ["TERM"] = theme.lime,
--  ["NONE"] = theme.gray,
--  ["COMMAND"] = theme.blue,
--}
--
--local component = {}
--
--component.vim_mode = {
--  provider = function()
--    return vim.api.nvim_get_mode().mode:upper()
--  end,
--  hl = function()
--    return {
--      fg = "bg",
--      bg = require("feline.providers.vi_mode").get_mode_color(),
--      style = "bold",
--      name = "NeovimModeHLColor",
--    }
--  end,
--  left_sep = "block",
--  right_sep = "block",
--}
--
--component.git_branch = {
--  provider = "git_branch",
--  hl = {
--    fg = "fg",
--    bg = "bg",
--    style = "bold",
--  },
--  left_sep = "block",
--  right_sep = "",
--}
--
--component.git_add = {
--  provider = "git_diff_added",
--  hl = {
--    fg = "green",
--    bg = "bg",
--  },
--  left_sep = "",
--  right_sep = "",
--}
--
--component.git_delete = {
--  provider = "git_diff_removed",
--  hl = {
--    fg = "red",
--    bg = "bg",
--  },
--  left_sep = "",
--  right_sep = "",
--}
--
--component.git_change = {
--  provider = "git_diff_changed",
--  hl = {
--    fg = "purple",
--    bg = "bg",
--  },
--  left_sep = "",
--  right_sep = "",
--}
--
--component.separator = {
--  provider = "",
--  hl = {
--    fg = "bg",
--    bg = "bg",
--  },
--}
--
--component.diagnostic_errors = {
--  provider = "diagnostic_errors",
--  hl = {
--    fg = "red",
--  },
--}
--
--component.diagnostic_warnings = {
--  provider = "diagnostic_warnings",
--  hl = {
--    fg = "yellow",
--  },
--}
--
--component.diagnostic_hints = {
--  provider = "diagnostic_hints",
--  hl = {
--    fg = "aqua",
--  },
--}
--
--component.diagnostic_info = {
--  provider = "diagnostic_info",
--}
--
--component.lsp = {
--  provider = function()
--    if not rawget(vim, "lsp") then
--      return ""
--    end
--
--    local progress = vim.lsp.util.get_progress_messages()[1]
--    if vim.o.columns < 120 then
--      return ""
--    end
--
--    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
--    if #clients ~= 0 then
--      if progress then
--        local spinners = {
--          "◜ ",
--          "◠ ",
--          "◝ ",
--          "◞ ",
--          "◡ ",
--          "◟ ",
--        }
--        local ms = vim.loop.hrtime() / 1000000
--        local frame = math.floor(ms / 120) % #spinners
--        local content = string.format("%%<%s", spinners[frame + 1])
--        return content or ""
--      else
--        return "לּ LSP"
--      end
--    end
--    return ""
--  end,
--  hl = function()
--    local progress = vim.lsp.util.get_progress_messages()[1]
--    return {
--      fg = progress and "yellow" or "green",
--      bg = "gray",
--      style = "bold",
--    }
--  end,
--  left_sep = "",
--  right_sep = "block",
--}
--
--component.file_type = {
--  provider = {
--    name = "file_type",
--    opts = {
--      filetype_icon = true,
--    },
--  },
--  hl = {
--    fg = "fg",
--    bg = "gray",
--  },
--  left_sep = "block",
--  right_sep = "block",
--}
--
--component.scroll_bar = {
--  provider = function()
--    local chars = {
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--      " ",
--    }
--    local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
--    local position = math.floor(line_ratio * 100)
--
--    if position <= 5 then
--      position = " TOP"
--    elseif position >= 95 then
--      position = " BOT"
--    else
--      position = chars[math.floor(line_ratio * #chars)] .. position
--    end
--    return position
--  end,
--  hl = function()
--    local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
--    local fg
--    local style
--
--    if position <= 5 then
--      fg = "aqua"
--      style = "bold"
--    elseif position >= 95 then
--      fg = "red"
--      style = "bold"
--    else
--      fg = "purple"
--      style = nil
--    end
--    return {
--      fg = fg,
--      style = "bold",
--      bg = "bg",
--    }
--  end,
--  left_sep = "block",
--  right_sep = "block",
--}
--
--local left = {}
--local middle = {}
--local right = {
--  component.vim_mode,
--  component.file_type,
--  component.lsp,
--  component.git_branch,
--  component.git_add,
--  component.git_delete,
--  component.git_change,
--  component.separator,
--  component.diagnostic_errors,
--  component.diagnostic_warnings,
--  component.diagnostic_info,
--  component.diagnostic_hints,
--  component.scroll_bar,
--}
--
--local components = {
--  active = {
--    left,
--    middle,
--    right,
--  },
--}
--
--feline.setup({
--  components = components,
--  theme = theme,
--  vi_mode_colors = mode_theme,
--})
-- require'treesitter-context'.setup()

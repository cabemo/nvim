-- Import configurations
-- Main configurations
vim.cmd([[
  source ~/.config/nvim/config/variables.vim
  source ~/.config/nvim/config/mappings.vim
  source ~/.config/nvim/config/fzf.vim
  source ~/.config/nvim/config/coc.vim
  source ~/.config/nvim/config/ale.vim
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
  Plug('iamcco/markdown-preview.nvim', { run = 'cd app && yarn install'  })
  Plug 'jparise/vim-graphql'
  Plug 'airblade/vim-gitgutter'
  Plug('mg979/vim-visual-multi', {branch = 'master'})
  Plug 'dense-analysis/ale'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'https://github.com/rhysd/conflict-marker.vim'
  Plug 'gruvbox-community/gruvbox'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'whiteinge/diffconflicts'
  Plug 'tpope/vim-surround'
  Plug 'feline-nvim/feline.nvim'
  Plug 'easymotion/vim-easymotion'
  Plug 'jupyter-vim/jupyter-vim'
  Plug('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  Plug 'mfussenegger/nvim-dap'
  Plug 'leoluz/nvim-dap-go'
  Plug 'rcarriga/nvim-dap-ui'
  Plug 'theHamsta/nvim-dap-virtual-text'
  Plug 'tpope/vim-fugitive'
  Plug 'nvim-treesitter/playground'
  Plug 'lewis6991/nvim-treesitter-context'
  Plug 'jiangmiao/auto-pairs'
  Plug 'github/copilot.vim'
--  Plug 'ray-x/go.nvim'
--  Plug 'ray-x/guihua.lua''
vim.call('plug#end')


require "nvim-treesitter.configs".setup({
  ensure_installed = { "go", "lua" },
  auto_install = true,
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
})

require("dap-go").setup()

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
require("dapui").setup({
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 0.35, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
})
require("feline").setup()
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

require'treesitter-context'.setup()

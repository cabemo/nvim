-- Import configurations
-- Main configurations
vim.cmd([[
  source ~/.vimrc
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
]])

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
  Plug('junegunn/fzf', { run = ':call fzf#install()' })
  Plug 'junegunn/fzf'
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
vim.call('plug#end')


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

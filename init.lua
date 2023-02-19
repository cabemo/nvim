-- Import configurations
-- Main configurations
vim.cmd([[
  source ~/.config/nvim/config/coc.vim
  source ~/.config/nvim/config/airline.vim
  source ~/.config/nvim/config/variables.vim
  source ~/.config/nvim/config/mappings.vim
  source ~/.config/nvim/config/fzf.vim
  source ~/.config/nvim/config/rooter.vim
  source ~/.config/nvim/config/conflict-marker.vim
  source ~/.config/nvim/config/suda.vim

  " Gruvbox
  " autocmd vimenter * ++nested colorscheme gruvbox
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
  Plug 'airblade/vim-gitgutter'
  Plug 'https://github.com/rhysd/conflict-marker.vim'
  -- Plug 'gruvbox-community/gruvbox'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'tpope/vim-surround'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-fugitive'
  Plug 'github/copilot.vim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/tagbar'
  Plug 'Soares/base16.nvim'
  Plug 'xiyaowong/nvim-transparent'
  Plug 'AckslD/nvim-neoclip.lua'
  Plug 'lambdalisue/suda.vim'
vim.call('plug#end')

vim.cmd([[
  colorscheme twilight
  let g:airline_theme='base16'
]])

require('neoclip').setup()

require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})

require('colorizer').setup()

require("nvim-web-devicons").setup({
  default = true
})
require("nvim-tree").setup({
  respect_buf_cwd = true,
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


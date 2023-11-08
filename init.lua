-- Import configurations
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

  " Restore cursor when exiting Vim
  autocmd VimLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")
]])

-- Main configurations
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug('junegunn/fzf', { run = ':call fzf#install()' })
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug('neoclide/coc.nvim', { branch = 'release' })
Plug 'airblade/vim-gitgutter'
Plug 'https://github.com/rhysd/conflict-marker.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/tagbar'
Plug 'Soares/base16.nvim'
Plug 'lambdalisue/suda.vim'
Plug 'wellle/context.vim'
Plug 'echasnovski/mini.nvim'
Plug('akinsho/bufferline.nvim', { tag = '*' })
vim.call('plug#end')

vim.cmd([[
	colorscheme habamax " quiet royal peachpuff
  highlight Folded          cterm=bold ctermfg=10 ctermbg=17 guibg=Gray guifg=White
  highlight Folded          cterm=bold ctermfg=10 ctermbg=17 guibg=Gray guifg=White
  highlight MiniFilesNormal guibg=#555555
	highlight LineNr          guifg=#CCCCCC
  highlight Folded     cterm=bold ctermfg=10 ctermbg=17 guibg=Gray guifg=White
	let g:airline_theme='base16'
	let g:context_enabled = 0
]])

require('mini.files').setup()

require('colorizer').setup()

require("nvim-web-devicons").setup({
  default = true
})

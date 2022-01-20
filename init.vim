" Import configurations
"" Main configurations
source ~/.vimrc
source ~/.config/nvim/config/variables.vim
source ~/.config/nvim/config/mappings.vim
"" Plugs configs
source ~/.config/nvim/config/fzf.vim
source ~/.config/nvim/config/coc.vim
source ~/.config/nvim/config/ale.vim
source ~/.config/nvim/config/rooter.vim
source ~/.config/nvim/config/conflict-marker.vim

"GitLens
lua vim.api.nvim_command [[autocmd CursorHold * lua require'utils'.blameVirtText()]]
lua vim.api.nvim_command [[autocmd CursorMoved * lua require'utils'.clearBlameVirtText()]]
lua vim.api.nvim_command [[autocmd CursorMovedI * lua require'utils'.clearBlameVirtText()]]

hi! link GitLens Comment

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf'
    Plug 'airblade/vim-rooter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'jparise/vim-graphql'
    Plug 'airblade/vim-gitgutter'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'dense-analysis/ale'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'https://github.com/rhysd/conflict-marker.vim'
call plug#end()

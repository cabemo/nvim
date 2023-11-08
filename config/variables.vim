" Rgrep as default
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m

" Terminal configs
set scbk=100000

" Maintain cursor centered
set so=5
set nowrap sidescroll=5 listchars=extends:>,precedes:<
set sidescrolloff=5

"Vim Diff
if &diff
  highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
  highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
  highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
  highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
endif

set tabstop=2
set shiftwidth=2
set expandtab
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
set number
set relativenumber
set ignorecase
set smartcase

let mapleader = ","
let &packpath = &runtimepath


set runtimepath^=~/.vim runtimepath+=~/.vim/after
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
set nowrap

highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue

" Folding
set foldcolumn=2
set foldlevel=99
set foldmethod=syntax
syntax enable

" Jupytext
let g:jupytext_fmt = 'py'
let g:jupytext_style = 'hydrogen'

" Send cell to IronRepl and move to next cell.
" Depends on the text object defined in vim-textobj-hydrogen
" You first need to be connected to IronRepl
nmap ]x ctrih/^# %%<CR><CR>

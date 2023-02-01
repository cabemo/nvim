" Rgrep as default
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m

"Vim Diff
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

nmap <S-CR> Shift+o<Esc>
nmap <CR> o<Esc>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" H to move to first character of line
noremap H ^
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" L to move to last character of line
noremap L g_
set tabstop=2
set shiftwidth=2
set expandtab
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
set number
set relativenumber
set ignorecase
set smartcase

nmap <S-CR> Shift+o<Esc>
nmap <CR> o<Esc>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" H to move to first character of line
noremap H ^
" L to move to last character of line
noremap L g_
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
highlight Folded     cterm=bold ctermfg=10 ctermbg=17 guibg=Gray guifg=White

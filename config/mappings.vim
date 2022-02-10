" Tabs
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
" Windows split navigation
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-l> :wincmd l<CR>
tnoremap <C-x> <C-\><C-N>
" GitGutter
nnoremap <silent> <leader>z :GitGutterUndoHunk<cr>
nnoremap <silent> <leader>m :GitGutterNextHunk<cr>
nnoremap <silent> <leader>M :GitGutterPrevHunk<cr>
" FZF
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>
" Custom
nnoremap <leader>o :source $MYVIMRC<cr>
nnoremap <leader>s :split<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>vs :vsplit<cr>
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>x :term<cr>
nnoremap <leader>, :ALENext<cr>
nnoremap <leader>. :ALEPrevious<cr>
nnoremap <leader>c :qa<cr>

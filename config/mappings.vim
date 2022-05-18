" Tabs
nnoremap tk  :tabnext<cr>
nnoremap tj  :tabprev<cr>
" Windows split navigation
nnoremap <C-k> :wincmd k<cr>
nnoremap <C-j> :wincmd j<cr>
nnoremap <C-h> :wincmd h<cr>
nnoremap <C-l> :wincmd l<cr>
tnoremap <C-x> <C-\><C-N>
"Nvim-Tree
nnoremap <silent><nowait> <leader>d :NvimTreeToggle<CR>
nnoremap <silent><nowait> <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>l :NvimTreeFindFile<CR>

" Utilities
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ'z
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ( (<c-g>u
inoremap { {<c-g>u

" Search H
nnoremap <CR> :noh<CR><CR>
" Personal
nnoremap <silent> <leader>e :e#<cr>
" Coc
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> <space>h :call CocActionAsync('doHover')<cr>
nnoremap <silent> <space>. :CocFix<cr>
nnoremap <silent><nowait> <space>j :call CocAction('diagnosticPrevious')<cr>
nnoremap <silent><nowait> <space>k :call CocAction('diagnosticNext')<cr>
nnoremap <silent><nowait> <space>d :call CocAction('jumpDefinition', v:false)<cr>
nnoremap <silent><nowait> <space>i :call CocAction('jumpImplementation', v:false)<cr>
nnoremap <silent><nowait> <space>r :call CocAction('jumpReferences')<cr>
" GitGutter
nnoremap <silent> <leader>z :GitGutterUndoHunk<cr>
nnoremap <silent> <space>g :GitGutterNextHunk<cr>
nnoremap <silent> <space>G :GitGutterPrevHunk<cr>
" FZF
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>
nnoremap <silent> <leader>/ :FZF /<cr>
" Custom
nnoremap <leader>o :source $MYVIMRC<cr>
nnoremap <leader>s :split<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>a :wa<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>vs :vsplit<cr>
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>x :term<cr>
"nnoremap <leader>, :ALENext<cr>
"nnoremap <leader>. :ALEPrevious<cr>
nnoremap <leader>c :qa<cr>

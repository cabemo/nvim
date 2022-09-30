" Tabs
nnoremap tk  :tabnext<cr>
nnoremap tj  :tabprev<cr>
" Windows split navigation
nnoremap <silent> <C-k> :wincmd k<cr>
nnoremap <silent> <C-j> :wincmd j<cr>
nnoremap <silent> <C-h> :wincmd h<cr>
nnoremap <silent> <C-l> :wincmd l<cr>
tnoremap <silent> <C-x> <C-\><C-N>
"Nvim-Tree
nnoremap <silent><nowait> <leader>d :NvimTreeToggle<CR>
nnoremap <silent><nowait> <leader>r :NvimTreeRefresh<CR>
" nnoremap <leader>l :NvimTreeFindFile<CR>

"Search for selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Coc completion
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()
" Keep cursor centered
" nnoremap j jzz
" nnoremap k kzz
" nnoremap <c-d> <c-d>zz
" nnoremap <c-u> <c-u>zz
" nnoremap } }zz
" nnoremap { {zz
" nnoremap gg ggzz

" DAP
nnoremap <silent> <space>dt :lua require('dap-go').debug_test()<CR>
nnoremap <silent> <space>c :lua require('dap').continue()<CR>
nnoremap <silent> <space>v :lua require('dap').step_over()<CR>
nnoremap <silent> <space>si :lua require('dap').step_into()<CR>
nnoremap <silent> <space>o :lua require('dap').step_out()<CR>
nnoremap <silent> <leader>b :lua require('dap').toggle_breakpoint()<CR>
nnoremap <silent> <space>dr :lua require('dap').repl.open()<CR>
nnoremap <silent> <space>du :lua require('dapui').toggle()<CR>
"DAPUI
vnoremap <M-k> <Cmd>lua require("dapui").eval()<CR>


" Utilities
nnoremap <silent> Y y$
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv
nnoremap <silent> J mzJ'z
inoremap <silent> , ,<c-g>u
inoremap <silent> . .<c-g>u
inoremap <silent> ( (<c-g>u
inoremap <silent> { {<c-g>u

" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <silent> s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <silent> s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <silent> <Leader>j <Plug>(easymotion-j)
map <silent> <Leader>k <Plug>(easymotion-k)

" Search H
nnoremap <silent> <CR> :noh<CR><CR>
" Coc
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> <space>h :call CocActionAsync('doHover')<cr>
nnoremap <silent> <space>. :CocFix<cr>
nnoremap <silent><nowait> <space>j :call CocAction('diagnosticPrevious')<cr>
nnoremap <silent><nowait> <space>k :call CocAction('diagnosticNext')<cr>
nnoremap <silent><nowait> <space>di :call CocAction('jumpDefinition', v:false)<cr>
nnoremap <silent><nowait> <space>d :call CocAction('jumpDefinition', 'split')<cr>
nnoremap <silent><nowait> <space>de :call CocAction('jumpDefinition', 'edit')<cr>
nnoremap <silent><nowait> <space>i :call CocAction('jumpImplementation', v:false)<cr>
nnoremap <silent><nowait> <space>r :call CocAction('jumpReferences')<cr>
" GitGutter
nnoremap <silent> <leader>z :GitGutterUndoHunk<cr>
nnoremap <silent> <space>g :GitGutterNextHunk<cr>
nnoremap <silent> <space>G :GitGutterPrevHunk<cr>
" Conflicts
nnoremap <silent> <leader>n :ConflictMarkerNextHunk<cr>
nnoremap <silent> <leader>N :ConflictMarkerPrevHunk<cr>
nnoremap <silent> <leader>no :ConflictMarkerOurselves<cr>
nnoremap <silent> <leader>nt :ConflictMarkerThemselves<cr>
" FZF
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>
nnoremap <silent> <leader>/ :FZF /<cr>
nnoremap <silent> <leader>m :Maps<cr>
nnoremap <silent> <leader>c :Commits<cr>
vnoremap <silent> <leader>c :BCommits<cr>
" Custom
nnoremap <silent> <leader>o :source $MYVIMRC<cr>
nnoremap <silent> <leader>s :split<cr>
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <leader>a :wa<cr>
nnoremap <silent> <leader>q :q<cr>
nnoremap <silent> <leader>vs :vsplit<cr>
nnoremap <silent> <leader>t :tabnew<cr>
nnoremap <silent> <leader>x :term<cr>
"nnoremap <leader>, :ALENext<cr>
"nnoremap <leader>. :ALEPrevious<cr>
nnoremap <silent> <leader>e :qa<cr>

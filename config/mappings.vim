nmap <S-CR> Shift+o<Esc>
nmap <CR> o<Esc>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" H to move to first character of line
noremap H ^
nnoremap <silent> <leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" L to move to last character of line
noremap L g_

" Bufferline
nnoremap <silent> gD :BufferLinePickClose<CR>
nnoremap <silent> gb :BufferLinePick<CR>

" Copy to clipboard
nnoremap <silent> <space>y "+y
vnoremap <silent> <space>y "+y
nnoremap <silent> <space>p "+p
vnoremap <silent> <space>p "+p

" Context.vim
nnoremap <silent> <leader>m :ContextToggleWindow<cr>

" Copy selection to replace
vnoremap <C-r> "hy:%s/<C-r>h

" tagbar
nmap <F8> :TagbarToggle<CR>

" Tabs
nnoremap tk  :tabnext<cr>
nnoremap tj  :tabprev<cr>
" Windows split navigation
" nnoremap <silent> <C-k> :wincmd k<cr>
" nnoremap <silent> <C-j> :wincmd j<cr>
" nnoremap <silent> <C-h> :wincmd h<cr>
" nnoremap <silent> <C-l> :wincmd l<cr>
" tnoremap <Esc> <C-\><C-n>
" Override Esc mapping for fzf
autocmd FileType fzf tnoremap <buffer> <Esc> <C-c>
tnoremap <silent> <C-x> <C-\><C-N>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
"Nvim-Tree
nnoremap <silent><nowait> <leader>d :lua MiniFiles.open()<CR>
nnoremap <silent><nowait> <leader>r :lua MiniFiles.refresh()<CR>
nnoremap <silent><nowait> <Esc> :lua MiniFiles.close()<CR>
nnoremap <silent><nowait> <space>f :lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>
" nnoremap <leader>l :NvimTreeFindFile<CR>

function! Set_diff_mode_options()
    if &diff
    " Use Alt + h for :diffget
      nnoremap <silent> <A-h> :diffget<cr>
      nnoremap <silent> <A-l> :diffpush<cr>
      map <silent> <A-j> ]czz
      map <silent> <A-k> [czz
    endif
endfunction

" When changing to diff mode while vim is open
autocmd OptionSet diff call Set_diff_mode_options()

"Search for selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" DAP
nnoremap <silent> <space>dt :lua require('dap-go').debug_test()<CR>
nnoremap <silent> <space>cn :lua require('dap').continue()<CR>
nnoremap <silent> <space>o :lua require('dap').step_over()<CR>
nnoremap <silent> <space>i :lua require('dap').step_into()<CR>
" nnoremap <silent> <space>o :lua require('dap').step_out()<CR>
nnoremap <silent> <space>b :lua require('dap').toggle_breakpoint()<CR>
nnoremap <silent> <space>dr :lua require('dap').repl.open()<CR>
" nnoremap <silent> <space>du :lua require('dapui').toggle()<CR>


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
" GitGutter
nnoremap <silent> <leader>z :GitGutterUndoHunk<cr>
nnoremap <silent> <space>g :GitGutterNextHunk<cr>
nnoremap <silent> <space>G :GitGutterPrevHunk<cr>
nnoremap <silent> <space>gd :GitGutterDiffOrig<cr>
" Conflicts
nnoremap <silent> <space>n :ConflictMarkerNextHunk<cr>zz
nnoremap <silent> <space>N :ConflictMarkerPrevHunk<cr>zz
nnoremap <silent> <space>co :ConflictMarkerOurselves<cr>
nnoremap <silent> <space>ct :ConflictMarkerThemselves<cr>
nnoremap <silent> <space>cb :ConflictMarkerBoth<cr>
" FZF
nnoremap <silent> <leader>, :FZF<cr>
nnoremap <silent> <leader>< :FZF ~<cr>
nnoremap <silent> <leader>/ :FZF /<cr>
nnoremap <silent> <leader>M :Maps<cr>
" unmap the conflciting gitgutter ones
nnoremap <silent> <leader>H :History:<cr>
nnoremap <silent> <leader>C :Commits<cr>
vnoremap <silent> <leader>c :BCommits<cr>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> // :BLines<cr>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
noremap <silent> <leader>ft :Filetypes<CR>
" Custom
" nnoremap <silent> <leader>o :source $MYVIMRC<cr>
nnoremap <silent> <leader>s :split<cr>
nnoremap <silent> <leader>w :w<cr>
nnoremap <silent> <leader>a :wa<cr>
nnoremap <silent> <leader>q :q<cr>
nnoremap <silent> <leader>vs :vsplit<cr>
nnoremap <silent> <leader>t :tabnew<cr>
nnoremap <silent> <leader>x :term<cr>
nnoremap <silent> <leader>X :split<cr><C-w>j<cr>:term<cr>
"nnoremap <leader>, :ALENext<cr>
"nnoremap <leader>. :ALEPrevious<cr>
nnoremap <silent> <leader>e :qa<cr>

" LeetCode
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>

" Magma
nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
nnoremap <silent>       <LocalLeader>rd :MagmaDelete<CR>
nnoremap <silent>       <LocalLeader>ro :MagmaShowOutput<CR>

" Obsidian

autocmd FileType markdown nnoremap <buffer> gd :ObsidianFollowLink<cr>
nnoremap <leader>. :ObsidianSearch<cr>
nnoremap <leader>n :ObsidianNew
nnoremap <leader>[[ :ObsidianLink<cr>
vnoremap <leader>, :ObsidianLink<cr>
vnoremap <leader>n :ObsidianLinkNew<cr>

let g:magma_automatically_open_output = v:false

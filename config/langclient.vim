" Required for operations modifying multiple buffers like rename.
set hidden

" Automatically start language servers.
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_autoStop = 1
let tsBinary = system('which typescript-language-server')
let npmBinary = system('dirname $(which npm)')
let tsserverPath = system('echo -n "$(dirname ' . npmBinary . ')/lib"') . '/node_modules/typescript/bin/tsserver'

echo 'TSBinary: ' . tsBinary
echo 'NPMBinary: ' . npmBinary
echo 'NPMLib: ' . tsserverPath

let g:LanguageClient_serverCommands = {
    \ 'typescript': {
      \ 'name': 'typescript',
      \ 'command': [tsBinary, '--stdio'],
      \ 'initializationOptions': {
        \ 'npmLocation': npmBinary,
        \ 'tsserver': {
          \ 'path': tsserverPath,
          \ 'logDirectory': '/tmp',
          \ 'logVerbosity': 'verbose',
          \ 'trace': 'verbose'
        \ },
        \ 'preferences': {
        \ 'quotePreference': 'single',
        \ },
      \ },
  \ },
    \ 'go': ['gopls']
\ }

autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent>K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> <F2> <Plug>(lcn-rename)

" Coc
" inoremap <silent><expr> <c-space> coc#refresh()
" nnoremap <silent> <space>h :call CocActionAsync('doHover')<cr>
" " nnoremap <silent> <space>. :CocFix<cr>
" nnoremap <silent> <space>. <Plug>(coc-fix-current)
" nnoremap <silent> <space>c :CocDiagnostics<cr>
" nnoremap <silent><nowait> <space>j :call CocAction('diagnosticPrevious')<cr>
" nnoremap <silent><nowait> <space>k :call CocAction('diagnosticNext')<cr>
" nnoremap <silent><nowait> <space>di :call CocAction('jumpDefinition', v:false)<cr>
" nnoremap <silent><nowait> <space>d :call CocAction('jumpDefinition', 'split')<cr>
" nnoremap <silent><nowait> <space>de :call CocAction('jumpDefinition', 'edit')<cr>
" nnoremap <silent><nowait> <space>i :call CocAction('jumpImplementation', v:false)<cr>
" nnoremap <silent><nowait> <space>r :call CocAction('jumpReferences')<cr>
" inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
" inoremap <silent><expr> <c-space> coc#refresh()

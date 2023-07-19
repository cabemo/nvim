" Autocompletion

nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>
nmap <silent> <leader>, :call CocAction('format')<cr>:w<cr>
nnoremap <silent> <F2> :call CocActionAsync('rename')<cr>
" Coc
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> <space>h :call CocActionAsync('doHover')<cr>
" nnoremap <silent> <space>. :CocFix<cr>
nnoremap <silent> <space>. <Plug>(coc-fix-current)
nnoremap <silent> <space>c :CocDiagnostics<cr>
nnoremap <silent><nowait> <space>j :call CocAction('diagnosticPrevious')<cr>
nnoremap <silent><nowait> <space>k :call CocAction('diagnosticNext')<cr>
nnoremap <silent><nowait> <space>di :call CocAction('jumpDefinition', v:false)<cr>
nnoremap <silent><nowait> <space>d :call CocAction('jumpDefinition', 'split')<cr>
nnoremap <silent><nowait> <space>de :call CocAction('jumpDefinition', 'edit')<cr>
nnoremap <silent><nowait> <space>i :call CocAction('jumpImplementation', v:false)<cr>
nnoremap <silent><nowait> <space>r :call CocAction('jumpReferences')<cr>
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()

" Config for coc-sh
" Enable bashIde.explainshellEndpoint
 let g:sh_explainshell_endpoint = 'https://explainshell.com/explain'

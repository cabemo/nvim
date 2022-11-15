let g:ale_fix_on_save = 1
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'python': ['flake8'],
\ 'go': ['golint'],
\ 'html': ['html-linter'],
\ 'sol': ['solhint']
\ }

let js_fixers = ['prettier', 'eslint']

let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': js_fixers,
\ 'javascript.jsx': js_fixers,
\ 'typescript': js_fixers,
\ 'typescriptreact': js_fixers,
\ 'python': ['black', 'isort'],
\ 'html': ['prettier'],
\ 'css': ['prettier'],
\ 'json': ['prettier'],
\ 'go': ['gofmt']
\}

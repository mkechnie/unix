set showmode showmatch 
" 
" automatic spelling checker
"
map v :w:$r!spell -b %
"
" Automatic make
"
map  :w:!/usr/local/bin/make dbx; echo ""
" map *  "syy!s grep
" set tabstop=4
syntax on
hi Comment ctermfg=Green guifg=Green
" Groups for syntax highlighting
hi Constant ctermfg=Red guifg=Red guibg=grey5
hi Special ctermfg=Cyan guifg=Cyan guibg=Red
hi Statement cterm=bold ctermfg=Cyan guifg=Cyan gui=bold
hi Type cterm=bold ctermfg=Cyan guifg=Cyan gui=bold
hi Directory ctermfg=Yellow guifg=Yellow guibg=Yellow
hi SpecialKey ctermfg=Yellow guifg=Yellow guibg=Yellow
hi Error ctermfg=Red guifg=Red guibg=Red
hi shShellVariables ctermfg=Yellow guifg=Yellow

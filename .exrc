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

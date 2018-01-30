"syntax on
set showmode showmatch
syntax enable
"set backgound=dark
set hlsearch
filetype plugin indent on


hi Comment ctermfg=Green guifg=Green
" Groups for syntax highlighting
hi Constant ctermfg=Red guifg=Red guibg=grey5
hi Special ctermfg=Cyan guifg=Cyan guibg=Red
hi Statement ctermfg=Cyan guifg=Cyan gui=bold
hi Operator ctermfg=white guifg=white
hi Function ctermfg=white guifg=white
hi Repeat ctermfg=white guifg=white
hi Type ctermfg=magenta guifg=magenta gui=bold
hi Macro ctermfg=magenta guifg=magenta gui=bold
hi Directory ctermfg=Yellow guifg=Yellow guibg=Yellow
hi SpecialKey ctermfg=Yellow guifg=Yellow guibg=Yellow
hi Error ctermfg=Red guifg=Red guibg=Red
hi shShellVariables ctermfg=Yellow guifg=Yellow

:noremap <F4> :set hlsearch! hlsearch?<CR>

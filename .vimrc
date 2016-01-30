" Convert all files to unix format and set default fileformat to unix.
:set ffs=unix
:set ff=unix

" backgound is dark or light
" :set background=dark

" show status line
:set laststatus=2

" Show the line and column number of the cursor position in the status line.
:set ruler

" Shows INSERT in the status line while in insertmode
:set showmode

" show current uncompleted command
:set showcmd

" Maximum width of text that is being inserted.
:set textwidth=74

" Smart alignment at beginning of line
" :set autoindent

" use 4 spaces when using autoindent/cindent
:set shiftwidth=4

" use the same value as shiftwidth
" :set softtabstop=4

" use the standard 4 character positions for a TAB
:set tabstop=4

" use spaces instead of tabs (for python wary users)
:set expandtab

" allow backspacing over identatiom, end-of-line, and start-of-line
:set backspace=2

" set cindent and tabstop for *.c, *.h, *.pl and *.sh files
" :autocmd BufEnter *.c,*.cpp,*.h,*.pl,*.sh set cindent tabstop=2

" show matching parenthesis
:set showmatch

" show colored syntax highlighting
:syntax on

" turn on numbering
:set nu

" do not Ignore case on search
:set noic

" show immediately where the so far typed pattern matches
:set incsearch

" non-sucky comment coloring
highlight perlComment ctermfg=grey
highlight pythonComment ctermfg=grey
highlight vimComment ctermfg=grey
highlight shComment ctermfg=grey
highlight cComment ctermfg=grey

au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.rules set syntax=snakemake
au BufNewFile,BufRead *.snakefile set syntax=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake

" whether or not we want to wrap lines
:set nowrap

:set nocompatible

" :set backspace=indent,eol,start

:set autoindent

" allows editable crontabs
:set backupskip=/tmp/*,/private/tmp/*

" enable all Python syntax highlighting features
let python_highlight_all = 1

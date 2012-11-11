" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
" runtime! debian.vim

set hidden
set number
set showcmd
set title
set ttyfast
set modeline
set modelines=3
set nostartofline
set ruler 
"set foldmethod=indent
set incsearch
set nohlsearch
set visualbell t_vb=
set novisualbell
set laststatus=2
set scrolljump=0
set scrolloff=0
set mousemodel=popup
set ch=1
set mousehide
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set ts=4
"set softtabstop=4
"set smarttab
set backspace=indent,eol,start
set tw=0
set background=dark
set pastetoggle=<F2>


" Backup and swap files
set backup
"set nowritebackup
"set swapfile
set backupdir=~/.vimbackup,.
set directory=~/.vimbackup,.


" Pathogeh manager (should go before `syntax`)
call pathogen#infect()
filetype plugin indent on

if has("syntax")
    syntax on
endif


" Statusbar format
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%<[%02n]\ %F%(\ %m%h%w%y%r%)\ %a%=\ %8l,%c%V/%L\ (%P)\ [%03.3b/%08O:%02.2B]


" Header for python file
function! BufNewFile_PY()
0put = '#!/usr/bin/env python'
1put = '# -*- coding: utf-8 -*-'
normal G
endfunction


" Bind header by python ext
autocmd BufNewFile *.py call BufNewFile_PY()
autocmd BufNewFile *.pyw call BufNewFile_PY()


" Removing all trailing whitespace
autocmd BufWritePre *.py,*.js,*.html,*.less,*.css :%s/\s\+$//e


" Brackets autocomplite
"imap [ []<LEFT>
"imap ( ()<LEFT>
"imap { {}<LEFT>


" Ignore line width for syntax checking
let g:syntastic_python_checker_args='--ignore=E501'



" Highlight current line
au WinLeave * set nocursorline "nocursorcolumn
au WinEnter * set cursorline "cursorcolumn
set cursorline "cursorcolumn


" Theme settings
color jellybeans
let g:jellybeans_background_color_256 = 232


" Search operations
set incsearch
set nohlsearch
"set highlight
set ignorecase
set smartcase


" Editor settings
set nocompatible
set nofoldenable                                                  " disable folding"
"set foldmethod=indent
set confirm                                                       " prompt when existing from an unsaved file
set history=500
set backspace=indent,eol,start                                    " More powerful backspacing
set autoindent
set smartindent
"set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=0
set pastetoggle=<F2>
set nostartofline
set ttyfast


" Display settings
set background=dark
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
"set mouse=a                                                      " use mouse in all modes
set mousemodel=popup
set mousehide
set report=0                                                      " always report number of lines changed                "
set nowrap                                                        " dont wrap lines
set ch=1
set scrolljump=0
set scrolloff=0                                                   " no lines above/below cursor when scrolling
set number                                                        " show line numbers
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
"set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html
set modeline
set modelines=3
set visualbell t_vb=
set novisualbell
set ruler
set hidden


" Backup and swap files
set backup
"set nowritebackup
"set swapfile
set backupdir=~/.vim/backup,.
set directory=~/.vim/backup,.


" Pathogeh manager (should go before `syntax`)
"call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on
syntax enable
" Required some magic to get vim-less to work
filetype off
filetype on


" Statusbar format (but going to use PowerLine bundle)
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"set statusline=%<[%02n]\ %F%(\ %m%h%w%y%r%)\ %a%=\ %8l,%c%V/%L\ (%P)\ [%03.3b/%08O:%02.2B]


" Easy navigation for windows ()
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>


" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
    \ if ! exists("g:leave_my_cursor_position_alone") |
    \     if line("'\"") > 0 && line ("'\"") <= line("$") |
    \         exe "normal g'\"" |
    \     endif |
    \ endif


" Header for python file
function! BufNewFile_PY()
0put = '#!/usr/bin/env python'
1put = '# -*- coding: utf-8 -*-'
normal G
endfunction

" Bind header by python ext
autocmd BufNewFile *.py call BufNewFile_PY()
autocmd BufNewFile *.pyw call BufNewFile_PY()


" Remove all trailing whitespace
function! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
  normal `Z
endfunction

" Auto strip trailing whitespaces
autocmd BufWritePre *.py,*.js,*.html,*.less,*.css,*.coffee call StripTrailingWhitespace()


" Tabs settings for different file types
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
autocmd FileType coffee,javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
autocmd FileType html,xhtml,haml,tmpl setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=0
autocmd FileType less,sass,scss,css setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79


" Js/Jquery syntax support
au BufRead,BufNewFile *.js set ft=javascript syntax=jquery


" Brackets autocomplite
"imap [ []<LEFT>
"imap ( ()<LEFT>
"imap { {}<LEFT>


" Syntastic bundle settings
" Ignore line width for syntax checking
let g:syntastic_python_checker_args='--ignore=E501'


" Tagbar bundle settings
let g:tagbar_usearrows = 1
nnoremap <F4> :TagbarToggle<CR>


" Vim-javascript bundle settings
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"


" NERDTree bundle settings
nnoremap <F3> :NERDTreeToggle<CR>


" Powerline bundle setting
if has('win32') || has('win64')
  let g:Powerline_symbols = 'compatible'
elseif has('gui_macvim')
    let g:Powerline_symbols = 'fancy'
endif
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" Abbreviate All of the Mode Names
let g:Powerline_mode_n = 'N'
let g:Powerline_mode_i = 'I'
let g:Powerline_mode_R = 'R'
let g:Powerline_mode_v = 'V'
let g:Powerline_mode_V = 'VL'
let g:Powerline_mode_cv = 'VB'
let g:Powerline_mode_s = 'S'
let g:Powerline_mode_S = 'SL'
let g:Powerline_mode_cs = 'SB'


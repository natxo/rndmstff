call pathogen#infect()

if has ("gui_running")
    set guifont=Inconsolata\ Regular\ 14
    set lines=100 columns=84
else
    set t_Co=256
    set background=dark
endif

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

set nocompatible
filetype plugin on
filetype indent on

" colours
set background=dark
"colors peaksea 
colors elflord 
set formatoptions=qrn1
set wrap
set colorcolumn=85


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup        " DON'T keep a backup file
set number
set encoding=utf-8
"set relativenumber
set textwidth=72
set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set tabstop=4       "indentation level every 4 columns"
set expandtab       "convert all tabs typed into spaces"
set shiftwidth=4    "indent/outdent by 4 columns"
set shiftround      "always indent/outdent to the nearest tabstop"
set autoindent
set smartindent
set scrolloff=5    " 5 lines bevore and after the current line when scrolling
set ignorecase     " ignore case
set smartcase      " but don't ignore it, when search string contains uppercase
                   " letters
set hid            " allow switching buffers, which have unsaved changes
set showmatch      " showmatch: Show the matching bracket for the last ')'?
syn on
set completeopt=menu,longest,preview
set confirm
"set foldmethod=indent
"set foldmethod=syntax

"let perl_fold=1
let perl_fold_blocks=1
let perl_want_scope_in_variables=1
let perl_include_pod = 1
"let foldlevelstart=1

noremap ,pt    :%!perltidy -q<cr> " only work in 'normal' mode
vnoremap ,pt   :!perltidy -q<cr>  " only work in 'visual' mode

"foldmethod indent + manual
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

"mojo ep syntax highlighting
let mojo_highlight_data = 1

syntax enable
au BufRead,BufNewFile *.cf set ft=cf3

" mutt
au BufRead /tmp/mutt-* set tw=72
augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile *mutt-*              setfiletype mail
augroup END

let g:go_disable_autoinstall = 0

" Highlight
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1

if exists("b:did_macros_c_style")
  finish
endif

let b:did_macros_c_style=1

" Set tabstops, soft tabstops, shift width to 4 spaces, and text width to 118
" set ts=4 sts=4 sw=4 tw=118
" Expands tabs, autoindents, uses C indentation mode, and smart tabs.
set et ai cindent smarttab

setlocal cinoptions=
setlocal cinoptions+=>s " Normal indent by shiftwidth
setlocal cinoptions+=e0 " modify indent ±0 when /{$/
setlocal cinoptions+=n0 " modify indent ±0 for braceless control block
setlocal cinoptions+=f0 " first brace in column 0
setlocal cinoptions+={0 " modify opening brace indent by ±0
setlocal cinoptions+=}0 " modify closing brace indent by ±0
setlocal cinoptions+=^0 " modify indent inside braces by ±0
setlocal cinoptions+=:s " case labels are <sw> from switch()
setlocal cinoptions+==0 " modify case statement indent by ±0
setlocal cinoptions+=l1 " align statements relative to case label
setlocal cinoptions+=b0 " align break with statements, not case label
setlocal cinoptions+=g0 " scope declarations align with braces
setlocal cinoptions+=hs " statements after scope statements are indented <sw>
setlocal cinoptions+=ps " K&R parameters are indented <sw>
setlocal cinoptions+=ts " return type declarations are indented <sw>
setlocal cinoptions+=is " indent C++ base classes and cinits <sw>
setlocal cinoptions+=+s " indent continuation lines <sw>
setlocal cinoptions+=c3 " indent comment lines +3 after comment opener.
setlocal cinoptions+=C0 " Comments behave correctly
setlocal cinoptions+=/0 " Indent comments <sw> extra
setlocal cinoptions+=(0 " Indent continuation in unclosed parens 2<sw>
setlocal cinoptions+=u0 " Same as above, one level deeper, add <sw>
setlocal cinoptions+=U0 " Ignore (/u if parens is first non-ws char.
setlocal cinoptions+=w1 " Line up with first unclosed paren.
setlocal cinoptions+=W0 " Unclosed paren change.
setlocal cinoptions+=m0 " Parens line up properly
setlocal cinoptions+=M0 " Parens line up properly
setlocal cinoptions+=j1 " Anonymous classes are indented correctly.
setlocal cinoptions+=)20 " Unclosed parens up to 20 lines away
setlocal cinoptions+=*30 " Unclosed comments up to 30 lines away

autocmd FileType python set omnifunc=pythoncomplete#Complete

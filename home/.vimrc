call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'

call plug#end()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetsDir="~/.vim/ultisnips/"
let g:UltiSnipsSnippetDierectories=["ultisnips/", "~/.vim/ultisnips"]

filetype plugin indent on

set encoding=utf-8

set laststatus=2

" Tells vim to show line numbers
set number
set ruler
set showmode


" Tells vim to use language syntax highlighting
syntax on
:colors torte

set shiftwidth=4
set tabstop=4
" show whitespace
set list
set listchars=tab:\|\ ,trail:·

set smarttab
set showmatch
set noerrorbells
set backspace=indent,eol,start

set scrolloff=2

set wildignore=*.o,*.class,*.pdf

" remove whitespace on save
autocmd BufWritePre *.* :%s/\s\+$//e
match ErrorMsg '\%>80v.\+'
" match Error /\%81v.\+/

:imap jj <Esc>
:nmap <C-K> <C-U>
:nmap <C-J> <C-D>

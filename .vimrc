" call pathogen#infect()

filetype plugin indent on

" nerd tree specific configs
" -------------------------
" Toggle nerd tree
" let NERDTreeWinPos="left"
" map <F3> :NERDTreeToggle

" toggle that background between light and dark
" call togglebg#map("<F5>")

" turn on line numbers
set number
" set the file format
set fileformat=unix
colors solarized

" TODO: wrap this in a check to see if we are running a gui
" set the guifont
set guifont=Anonymous\ Pro:h18

" turn syntax highlighting on
syntax on
" turn off the bell!
set vb t_vb=
" use spaces instead of tabs when pressing tab
set expandtab
" TODO: figure out what shiftwidth is
set shiftwidth=2
" sets the number of spaces that a tab counts for while performing editing
" operations
set softtabstop=2
" minimal # of columns to use for the line number
set numberwidth=2
set background="light"

" make semicolon==colon for quick command interface access
map ; :

" modify window navigating commands to be more hand friendly
nnoremap gh <C-w>h
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l

" training macros for above bindings
nnoremap <C-w>h <nop>
nnoremap <C-w>j <nop>
nnoremap <C-w>k <nop>
nnoremap <C-w>l <nop>

" set up mapleader which is used in macros to expand possible keyboard
" combinations 
let mapleader = ","
let maplocalleader = "\\"


" make space toggle code folding
nnoremap <leader><space> za
" make - move a line down by one 
nnoremap <leader>- ddp
" make _ move a line up by one
nnoremap <leader>_ ddkP
" highlight text and press \ to go to uppercase
vnoremap <leader>\ U
" ctrl+u makes the current word all caps
" in insert mode
inoremap <leader><c-u> <esc>evbUea
" leader, c-u makes current word uppercase in normal mode
nnoremap <leader><c-u> <esc>evbU

" source vimrc file (loads new config)
nnoremap <leader>sv :source $MYVIMRC<cr>
" edit vimrc file in new vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" basic signature macro using builtin 
iabbrev ssig -- <cr>Chris Lacko<cr>chris.l@seventablets.com
iabbrev @@ chris.l@seventablets.com

" surround current word in double quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel 
" surround current word in single quotes
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel 

" surround current selection in double quotes 
vnoremap <leader>" <esc>a"<esc>`<i"<esc>v`>ll
" surround current selection in single quotes 
vnoremap <leader>' <esc>a'<esc>`<i'<esc>v`>ll

" jk instead of esc
inoremap jk <esc>

" training aid for the above mapping
inoremap <esc> <nop>


" consume the space at the end of an operation
" func! Eatchar(pat)
"	let c = nr2char(getchar(0))
"	return (c =~ a:pat) ? '' : c
" endfunc


" TODO: reimplement these in proper folder instead of here
" augroup filetype_javascript
"	autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
"	autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
"	autocmd FileType javascript :iabbrev <buffer> if( NOPENOPENOPE
"	autocmd FileType javascript :iabbrev <buffer> funn function (){<left><left>
"	autocmd FileType javascript :iabbrev <buffer> function NOPENOPENOPE
"	autocmd FileType javascript :iabbrev <buffer> rett return ;<left><C-R>=Eatchar('\s')<CR>
"	autocmd FileType javascript :iabbrev <buffer> return NOPENOPENOPE
"augroup END
"
"augroup filetype_ruby
"	autocmd FileType ruby nnoremap <buffer> <localleader>c I#<esc>
"augroup END
"
"augroup filetype_sql
"	autocmd FileType sql nnoremap <buffer> <localleader>c I--<esc>
"        autocmd FileType sql :iabbrev <buffer> iff IF THEN <CR>END IF;<up><left><left><left><left><C-R>=Eatchar('\s')<CR>
"	autocmd FileType sql :iabbrev <buffer> IF NOPENOPENOPE
"        autocmd FileType sql :iabbrev <buffer> funn CREATE OR REPLACE FUNCTION ()<CR>RETURNS<CR>LANGUAGE plpgsql<CR>AS $$<CR>DECLARE<cr>BEGIN<CR>END;<CR>$$;
"        autocmd FileType sql :iabbrev <buffer> sin SELECT INTO <CR> FROM <CR> WHERE ;
"augroup END

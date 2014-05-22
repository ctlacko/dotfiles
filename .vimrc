" TODO: compile with wildmenu and undofile for much success
scriptencoding utf-8 " yey! utf-8

execute pathogen#infect()

Helptag " Help for plugins

" Basics
set cryptmethod=blowfish " use the good stuff!
set nocompatible " explicitly get out of vi-compatible mode
set noexrc " don't use local version of .(g)vimrc, .exrc
set background=dark " we plan to use a dark background
set fenc=utf-8 " UTF-8
set cpoptions=aABceFsmq
"             |||||||||
"             ||||||||+-- When joining lines, leave the cursor between joined lines
"             |||||||+-- When a new match is created (showmatch) pause for .5
"             ||||||+-- Set buffer options when entering the buffer
"             |||||+-- :write command updates current file name automatically add <CR> to the last line when using :@r
"             |||+-- Searching continues at the end of the match at the cursor position
"             ||+-- A backslash has no special meaning in mappings
"             |+-- :write updates alternative file name
"             +-- :read updates alternative file name
syntax on " syntax highlighting on
let g:skip_loading_mswin=1 " Just in case :)
set history=99999 " big old history
set formatoptions+=n " Recognize numbered lists
set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s* "and bullets, too
set ttyfast " Assume a fast terminal
set ttyscroll=5 " See if this helps scroll speed

" turn off beep
set noerrorbells
set novisualbell
set t_vb=

" turn off background redraw
set t_ut=

" General
filetype plugin indent on
set backspace=indent,eol,start " make backspace a more flexible
set backup " make backup files
if exists('$TMUX')
  set clipboard=
else
  set clipboard=unnamed "sync with OS clipboard
endif
set fileformats=unix,dos,mac " support all three, in this order
set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
set wildmenu " turn on command line completion wild style
set wildignore=*.pdf,*.pyo,*.pyc,*.zip,*.so,*.swp,*.dll,*.o,*.DS_Store,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png,*.a " ignore these
set wildmode=list:longest " turn on wild mode huge list
set viewoptions=folds,options,cursor,unix,slash " Windows/Linux compatibility
set nojoinspaces " Prevents inserting two spaces after punctuation on a join (J)
set splitbelow " new splits are down
set splitright " new vsplits are to the right
set switchbuf=useopen " jump to first open window with buffer


" Vim UI
set incsearch " BUT do highlight as you type you search phrase
set laststatus=2 " always show the status line
set lazyredraw " do not redraw while running macros
set linespace=0 " don't insert any extra pixel lines betweens rows
set list " we do want to show tabs and tailing to ensure we get them out of my files
set listchars=tab:>-,trail:- " show tabs and trailing
set matchtime=1 " how many tenths of a second to blink matching brackets for
set nohlsearch " do not highlight searched for phrases
set nostartofline " leave my cursor where it was
set number " turns out I hate relative numbering
set numberwidth=5 " We are good up to 99999 lines
set report=0 " tell us when anything is changed via :
set ruler " Always show current positions along the bottom
set scrolloff=5 " Keep 5 lines (top/bottom) for scope
set shortmess=aOstTI " shortens messages to avoid 'press a key' prompt
set noshowcmd " I know what I am doing.
set showmatch " show matching brackets
set sidescrolloff=5 " Keep 5 lines at the size
set sidescroll=5 " If you hit edge, jump 5
set scrolljump=5 " If you hit bottom or top, jump 5
set statusline=%F%m%r%h%w[%L]%{fugitive#statusline()}[%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |  |                        |      |  |     |    |
"              | | | | |  |  |                        |      |  |     |    +-- current column
"              | | | | |  |  |                        |      |  |     +-- current line
"              | | | | |  |  |                        |      |  +-- current % into file
"              | | | | |  |  |                        |      +-- current syntax in square brackets
"              | | | | |  |  |                        +-- current fileformat
"              | | | | |  |  +-- add fugitive info
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer


" Text Formatting/Layout
set completeopt=menuone " don't use a pop up menu for completions
set diffopt=filler,iwhite " filler and whitespace
set expandtab " no real tabs please!
set formatoptions=rq " Automatically insert comment leader on return, and let gq format comments
set ignorecase " case insensitive by default
set infercase " case inferred by default
set smartcase " if there are caps, go case-sensitive
set nowrap " do not wrap line
set textwidth=0 " No autowrapping
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that
set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
set tabstop=8 " real tabs should be 8, and they will show with set list on

" Folding
set foldenable " Turn on folding
set foldmethod=marker " Fold on the marker
set foldmarker={,} " use simple markers
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldnestmax=1 " I only like to fold outer functions
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

" random settings
set hidden " load files in background
set undofile " persistent undo
set undolevels=1000 " persistent undo
set undoreload=10000 " to undo forced reload with :e!
syntax sync minlines=300 " 300 lines wrapping for syntax

" Fugitive
nmap <leader>gc :Gcommit<CR>
nmap <leader>ga :Gwrite<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>grm :Gremove<CR>
nmap <leader>gm :Gmove<CR>

if has("autocmd")
  augroup vimrcAu
    " Clear!
    au!

    " For secure reading/writing
    au BufReadPost * if &key != "" | setlocal noswapfile nowritebackup viminfo= nobackup noshelltemp history=0 secure | endif

    " Things that use two spaces rather than four
    au BufRead,BufNewFile *.rb,*.rhtml setlocal sw=2 sts=2 " ruby likes two
    au BufRead,BufNewFile *.yaml setlocal sw=2 sts=2 " ruby likes two

    " Go setlocalup assumptions: gocode, godef, gotags all in path
    au BufRead,BufNewFile *.go setlocal noexpandtab sw=8 sts=8 syntax=go listchars=tab:\|\ ,trail:- " Go uses tabs
    au FileType go autocmd BufWritePre <buffer> :keepjumps Fmt " assumes Fmt is defined
    au BufRead,BufNewFile MakeFile,Makefile,makefile setlocal noexpandtab sw=8 sts=8 syntax=make listchars=tab:\|\ ,trail:- " so does make

    " Override types
    au BufNewFile,BufRead *.ahk setlocal filetype=ahk " Autohotkey
    au BufNewFile,BufRead *.ps1 setlocal filetype=ps1 " Powershell
    au BufNewFile,BufRead *.md setlocal filetype=markdown spell " Markdown and spelling on
    au BufNewFile,BufRead *.dtl setlocal filetype=htmldjango " Django Templates

    " Things I like spellcheck in
    au FileType gitcommit setlocal spell
    au FileType svn       setlocal spell
    au FileType asciidoc  setlocal spell
  augroup END
endif

if has("gui_running")
  " Basics
  set guifont=Anonymous\ Pro:h18
  set guioptions=ce
  "              ||
  "              |+-- use simple dialogs rather than pop-ups
  "              +-- use GUI tabs, not console style tabs
  set mousehide " hide the mouse cursor when typing
endif


" nerd tree specific configs
" -------------------------
let NERDTreeWinPos="left"
map <F3> :NERDTreeToggle

" toggle that background between light and dark
" call togglebg#map("<F5>")
colors solarized

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


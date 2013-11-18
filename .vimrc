execute pathogen#infect()
"{{{Auto Commands

" Automatically cd into the directory that the file is in
" autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
" autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

"}}}

"{{{Misc Settings"{{{

" Necesary  for lots of cool vim things
set nocompatible
set nocp

" This shows what you are typing as a command.  I love this!
set showcmd

" Folding Stuffs
set foldmethod=marker

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*

" Who doesn't like autoindent?
set autoindent

" Spaces are better than a tab character
set expandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
   set spl=en spell
   set nospell
endif

" Real men use gcc
compiler gcc

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Enable mouse support in console
set mouse=a

" Got backspace?
set backspace=2

" Line Numbers PWN!
set number

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
"inoremap jj <Esc>

"nnoremap JJJJ <Nop>

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch

" Since I use linux, I want this
let g:clipbrdDefaultReg = '+'

" When I close a tab, remove the buffer
set nohidden

" Set off the other paren
highlight MatchParen ctermbg=4
" }}}"}}}

"{{{Look and Feel

" Favorite Color Scheme
if has("gui_running")
   colorscheme elflord
   " Remove Toolbar
   "set guioptions-=T
   "Terminus is AWESOME
   set guifont=Monospace\ 11
else
   colorscheme elflord
endif

"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" }}}

"{{{ Functions

"{{{ Open URL in browser

function! Browser ()
   let line = getline (".")
   let line = matchstr (line, "http[^   ]*")
   exec "!firefox ".line
endfunction

"}}}

"{{{ Paste Toggle
let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
   if g:paste_mode == 0
      set paste
      let g:paste_mode = 1
   else
      set nopaste
      let g:paste_mode = 0
   endif
   return
endfunc
"}}}

"{{{ Todo List Mode

function! TodoListMode()
   e ~/.todo.otl
   Calendar
   wincmd l
   set foldlevel=1
   tabnew ~/.notes.txt
   tabfirst
   " or 'norm! zMzr'
endfunction

"}}}

"}}}

"{{{ Mappings

" Open Url on this line with the browser \w
map <Leader>w :call Browser ()

" Open the Project Plugin
"nnoremap   :Project

" Open the Project Plugin
"nnoremap  pal  :Project .vimproject

" TODO Mode
"nnoremap  todo :execute TodoListMode()

" Open the TagList Plugin
"nnoremap   :Tlist

" Fast exit from Insert Mode
inoremap jkj <Esc>

" Next Tab
nnoremap tx :tabnext<CR>

" Previous Tab
nnoremap tp :tabprevious<CR>

" New Tab
nnoremap tn :tabnew

" DOS is for fools.
"nnoremap   :%s/$//g:%s// /g"

nnoremap j gj
nnoremap k gk

" Paste Mode!  Dang!
nnoremap <F9> :call Paste_on_off()<CR>
set pastetoggle=<F9>

" Edit vimrc \ev
nnoremap  ev :tabnew ~/.vimrc<CR>

" Edit gvimrc \gv
nnoremap  gv :tabnew ~/.gvimrc

" Create Blank Newlines and stay in Normal mode
nnoremap  zj o
nnoremap  zk O

" Space will toggle folds!
nnoremap <space> za

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" Testing
set completeopt=longest,menuone,preview

inoremap   pumvisible() ? "\" : "\u\"
inoremap   pumvisible() ? "\c-n>" : "\c-n>\c-r>=pumvisible() ? \"\\down>\" : \"\"\cr>"
inoremap   pumvisible() ? "\c-n>" : "\c-x>\c-o>\c-n>\c-p>\c-r>=pumvisible() ? \"\\down>\" : \"\"\cr>"

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;

" Fix email paragraphs
nnoremap par :%s/^>$//

"ly$O#{{{ "lpjjj_%A#}}}jjzajj

"}}}

"{{{Taglist configuration
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1
let Tlist_Inc_Winwidth = 0
"}}}

let g:rct_completion_use_fri = 1
"let g:Tex_DefaultTargetFormat = "pdf"
let g:Tex_ViewRule_pdf = "kpdf"

filetype plugin indent on
syntax on


" Vundle setting
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ========== Plugin Setting ==========

Plugin 'majutsushi/tagbar'
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=20
let g:tagbar_left = 1
set updatetime=100
nmap <F8> :TagbarToggle<CR>
au  VimEnter * Tagbar

Plugin 'wesleyche/SrcExpl'
" map shortcut to "F2"
nmap <F2> :SrcExplToggle<CR>
" set the height of window
let g:SrcExpl_winHeight = 8
" Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100
" Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"
" Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"
" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 0
" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" // create/update the tags file
let g:SrcExpl_updateTagsCmd = "ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q ."
" // Set "<F3>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F3>"

" ========== Plugin Setting End ==========

filetype plugin indent on " required

if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
else
    let g:iswindows=0
endif

set encoding=utf-8
set fenc=cp936
set fileencodings=ucs-bom,iso-8859,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
if(g:iswindows==1)
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_TW.utf-8
endif

if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
endif
set nobomb

set termencoding=utf-8
set fileformats=unix,dos,mac

"current file format
set ff=unix
"line number
set nu
"show current mode on bottom line, except normal mode
set showmode
"automatically line break
set wrap
set linebreak
"show location infomation
set ruler
"high light search 
set hlsearch
set incsearch
"background-> light or dark
set background=dark

set nocompatible
set backspace=2
set showcmd

"set tab key expression
set shiftwidth=4
"set shiftround
set ai
set tabstop=4
set expandtab
set cin

set textwidth=80
"set colorcolumn=+1

"set tab page expression
set tabpagemax=100

set number
set numberwidth=5

set matchpairs+=<:>

set nocp

" set tags+=[tags];
"set tags+=~/.vim/cpp_src/
set tags+=tags;


set mouse=n
set history=100

set vb t_vb=

set t_Co=256

" Highlight current line
"highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorLine cterm=NONE ctermbg=darkgrey ctermfg=none guibg=NONE guifg=NONE
set cursorline

syntax on

" ========== CSCOPE Setting ==========
set cscopetag
set csto=0

if filereadable("cscope.out")
   cs add cscope.out
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif
set cscopeverbose

" find symbol
nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
" find defination
nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
" find usage
nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
" find string
nmap zt :cs find t <C-R>=expand("<cword>")<CR><CR>
" find with grep, similar to egrep
nmap ze :cs find e <C-R>=expand("<cword>")<CR><CR>
" find file
nmap zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
" find files include current file
nmap zi :cs find i <C-R>=expand("<cfile>")<CR>$<CR>
" find function
nmap zd :cs find d <C-R>=expand("<cword>")<CR><CR>

" ========== VIM MAP Setting ==========
map <Esc><Esc> :w!<CR>
map <Esc><BS> :q <CR>
map L <ESC>:tabnext<CR>
map H <ESC>:tabprev<CR>
map <C-i> <ESC>:!
map <C-t>n <ESC>:Texplore <bar><CR> <F8>
map <C-t>c <ESC>:tabclose<CR>
"map <C-c> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
nmap + <C-W>+
nmap - <C-W>-
nmap <C-l>  <C-w>>
nmap <C-h>  <C-w><
nmap dir  <ESC>:Explore<CR>
nmap sdir <ESC>:Sexplore<CR>
nmap vdir <ESC>:Vexplore<CR>
nmap mks <ESC>:mksession!<CR>
nmap <C-w>w <ESC>:windo set wrap<CR>
"nnoremap <2-LeftMouse> :vs<CR> <C-w>T : cstag <C-R>=expand("<cword>")<CR><CR> <C-w>T
"nnoremap <F5> <C-w>T
"nnoremap <Space><Space> :q<CR>
nmap ff :vimgrep /<c-r>=expand("<cword>")<cr>/ %<cr> !:copen <Enter>
nmap F mx:call getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW')) <CR> %%b

let mapleader=","
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" ========== Main Viewer Setting ==========

set background=dark
colorscheme slate

highlight Search term=reverse ctermbg=4 ctermfg=7                                                                                                                       
highlight Normal ctermbg=black ctermfg=white

highlight TabLine         term=bold cterm=bold   ctermbg=darkgrey ctermfg=white                                                                           
highlight TabLineSel      term=bold cterm=bold   ctermbg=blue     ctermfg=white                                                                           
highlight TabLineFill     term=bold cterm=bold   ctermbg=black    ctermfg=darkgrey

highlight StatusLineNC    term=none cterm=none   ctermfg=darkgrey ctermbg=black                                                                           
highlight StatusLine      term=none cterm=none   ctermfg=white    ctermbg=blue                                                                            
set statusline=%4*%f\ %6*%m%4*\ %=%3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>
set laststatus=2
highlight User1 ctermfg=red                                                                                                                               
highlight User2 term=underline cterm=underline ctermfg=green                                                                                              
highlight User3 term=underline cterm=underline ctermfg=yellow                                                                                             
highlight User4 term=underline cterm=underline ctermfg=white                                                                                              
highlight User5 ctermfg=cyan                                                                                                                              
highlight User6 ctermfg=white    

highlight LineNr ctermfg=darkgray ctermbg=black
highlight Comment ctermbg=black
highlight PreCondit ctermfg=red ctermbg=black

highlight VertSplit cterm=none ctermfg=darkgray ctermbg=black                                                                                             
set fillchars=vert:\|


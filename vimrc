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

"Plugin 'easymotion/vim-easymotion'
"let g:EasyMotion_do_shade = 0

filetype plugin indent on     " required

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
    language messages zh_CN.utf-8
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
"background-> light or dark
set background=dark

set nocompatible
set backspace=2

"set runtimepath+=~/.vim/plugin
"set runtimepath+=~/.vim/after
"set runtimepath+=~/.vim/autoload
"set runtimepath+=~/.vim/bin
"set runtimepath+=~/.vim/doxygen-support
"set runtimepath+=~/.vim/plugin
"set runtimepath+=~/.vim/syntax
"set runtimepath+=~/.vim/tags

"set tab expression
set shiftwidth=4
set ai
set tabstop=4
set expandtab
set cin

syntax on
colorscheme default


"augroup ShellScript "auto-change file mode to 755 when saveing *.sh files
"    autocmd!
"    autocmd BufWritePost,FileWritePost *.sh !chmod 755 %
"augroup END

map <Esc><Esc> :w! <CR>
map <Esc><BS> :q <CR>
map L <ESC>:tabnext<CR>
map H <ESC>:tabprev<CR>
map <C-i> <ESC>:!
map <C-t>n <ESC>:Texplore<CR>
map <C-t>c <ESC>:tabclose<CR>
nmap + <C-W>+
nmap - <C-W>-
nmap <C-l>  <C-w>>
nmap <C-h>  <C-w><
nmap dir  <ESC>:Explore<CR>
nmap sdir <ESC>:Sexplore<CR>
nmap vdir <ESC>:Vexplore<CR>
nmap <C-w>w <ESC>:windo set wrap<CR>
nnoremap <2-LeftMouse> : cstag <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-F>2 :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>

filetype on
filetype plugin on
filetype indent on

""FOR Tlist
"let Tlist_Ctags_Cmd = "/usr/bin/ctags"
""let Tlist_Auto_Open=1 
"let Tlist_Auto_Update=1 
"let Tlist_Enable_Fold_Column=1
"let Tlist_Sort_Type = "name"
"let Tlist_WinWidth = 30 
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Show_One_File=1  
"let Tlist_Use_SingleClick = 1
"nnoremap <silent> <F8> :Tlist<CR>

set tabpagemax=100

highlight Comment ctermfg=Green
highlight Search term=reverse ctermbg=4 ctermfg=7
highlight Normal ctermbg=black ctermfg=white

map <C-c> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

set nocp
filetype plugin on

set tags+=~/.vim/cpp_src/
set tags+=tags;

set mouse=n
set history=100

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map F :call ShowFuncName() <CR>

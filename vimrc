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

"Plugin setting
"
"Plugin 'easymotion/vim-easymotion'
"let g:EasyMotion_do_shade = 0

"Plugin 'tomasr/molokai'
"" Javascript syntax hightlight
"syntax enable
"" Set syntax highlighting for specific file types
"autocmd BufRead,BufNewFile Appraisals set filetype=ruby
"autocmd BufRead,BufNewFile *.md set filetype=markdown
"autocmd Syntax javascript set syntax=jquery
"" Color scheme
"colorscheme molokai
"highlight NonText guibg=#060606
"highlight Folded  guibg=#0A0A0A guifg=#9090D0

Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

Plugin 'majutsushi/tagbar'
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap tt <ESC> :TagbarToggle<CR>

Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'find %s -type f' " MacOSX/Linux

Plugin 'Lokaltog/vim-powerline'
Plugin 'tpope/vim-fugitive'
set laststatus=2 " Always display the status line
set statusline+=%{fugitive#statusline()} "  Git Hotness

Plugin 'neovimhaskell/haskell-vim'
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
"let g:haskell_classic_highlighting = 1
"let g:cabal_indent_section = 2

"Plugin setting end

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
"background-> light or dark
set background=dark

set nocompatible
set backspace=2
set showcmd

"set tab expression
set shiftwidth=4
"set shiftround
set ai
set tabstop=4
set expandtab
set cin

set textwidth=80
"set colorcolumn=+1

set number
set numberwidth=5

set matchpairs+=<:>
set hlsearch

set tabpagemax=100

set nocp

set tags+=~/.vim/cpp_src/
set tags+=tags;

set mouse=n
set history=100

set vb t_vb=

" Highlight current line
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
"set cursorline cursorcolumn
"set cursorline

syntax on

map <Esc><Esc> :w! <CR>
map <Esc><BS> :q <CR>
map L <ESC>:tabnext<CR>
map H <ESC>:tabprev<CR>
map <C-i> <ESC>:!
map <C-t>n <ESC>:Texplore <bar><CR>
map <C-t>c <ESC>:tabclose<CR>
map <C-c> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
nmap + <C-W>+
nmap - <C-W>-
nmap <C-l>  <C-w>>
nmap <C-h>  <C-w><
nmap dir  <ESC>:Explore<CR>
nmap sdir <ESC>:Sexplore<CR>
nmap vdir <ESC>:Vexplore<CR>
nmap <C-w>w <ESC>:windo set wrap<CR>
nnoremap <2-LeftMouse> : cstag <C-R>=expand("<cword>")<CR><CR>
"nnoremap <C-F>2 :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>

highlight Comment ctermfg=Green
highlight Search term=reverse ctermbg=4 ctermfg=7
highlight Normal ctermbg=black ctermfg=white

" set tags+=[tags];
set tags+=/home/ryshen/workspace/fe2pg4/design/regs/outputs/include/tags

colorscheme industry
nmap F mx:call getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW')) <CR> %%b

hi TabLine           cterm=underline ctermbg=black  ctermfg=white
hi TabLineSel        cterm=bold      ctermbg=cyan  ctermfg=black

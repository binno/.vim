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

"Plugin 'Valloric/YouCompleteMe'
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0

Plugin 'majutsushi/tagbar'
let g:tagbar_width=30
let g:tagbar_autofocus=1
nmap <F2> :TagbarToggle<CR>

"Plugin 'kien/ctrlp.vim'
"let g:ctrlp_map = '<c-p>'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }
"let g:ctrlp_user_command = 'find %s -type f' " MacOSX/Linux

"Plugin 'Lokaltog/vim-powerline'
"Plugin 'tpope/vim-fugitive'
"set laststatus=2 " Always display the status line
"set statusline+=%{fugitive#statusline()} "  Git Hotness

"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
""---------------alrLine Config--------------
"if !exists('g:airline_symbols')
"	let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"
"let g:airline_exclude_filename = []
"let g:Powerline_symbols='fancy'
"let g:airline_powerline_fonts=0
"let Powerline_symbols='fancy'
"let g:bufferline_echo=0
"set laststatus=2
"set t_Co=256
"set fillchars+=stl:\ ,stlnc:\

"Plugin 'neovimhaskell/haskell-vim'
"let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
"let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
"let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
"let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
"let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
"let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
""let g:haskell_classic_highlighting = 1
""let g:cabal_indent_section = 2

Plugin 'tpope/vim-obsession'

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
set tags+=~/.vim/cpp_src/
set tags+=tags;
"set tags+=/home/ryshen/workspace/fe2pg4/design/regs/outputs/include/tags
set tags+=/home/ryshen/workspace/ess_thunderbird_fe2-pg4/verification/soc/testbench/common/include_temp/tags


set mouse=n
set history=100

set vb t_vb=

set t_Co=256

" Highlight current line
"highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorLine cterm=NONE ctermbg=darkgrey ctermfg=none guibg=NONE guifg=NONE
set cursorline

syntax on

map <Esc><Esc> :w!<CR>
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
nmap mks <ESC>:mksession!<CR>
nmap <C-w>w <ESC>:windo set wrap<CR>
nnoremap <2-LeftMouse> :vs<CR> <C-w>T : cstag <C-R>=expand("<cword>")<CR><CR> <C-w>T
"nnoremap <2-LeftMouse> <C-w>} <C-w>w <C-w>T
"nnoremap <2-LeftMouse> <C-w>} <C-w>k <C-w>T
nnoremap <F5> <C-w>T
nnoremap <Space><Space> :q<CR>
"nnoremap <C-F>2 :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>
nmap ff :vimgrep /<c-r>=expand("<cword>")<cr>/ %<cr> !:copen <Enter>
nmap F mx:call getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW')) <CR> %%b

let mapleader=","
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

set background=dark
colorscheme elflord

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

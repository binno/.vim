" ========== Basic VIM Setting ==========
if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
else
    let g:iswindows=0
endif
let mapleader=","

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
syntax on
set laststatus=2
set ruler                   " show location infomation
set nu                      " line number
set hlsearch                " high light search
set incsearch
set cursorline              " Highlight current line
set shiftwidth=2            " tab key expression
set cindent
set tabstop=2
set expandtab
set cin
"set textwidth=80
set termencoding=utf-8
set fileformats=unix,dos,mac
set ff=unix                 " current file format
set showmode                " show current mode on bottom line, except normal mode
set nocompatible
set wrap                    " automatically line break
set linebreak
set backspace=2
set showcmd
set tabpagemax=100          " set tab page expression
set numberwidth=5
set matchpairs+=<:>
set history=100
set clipboard=unnamed
set mouse=n
set ttymouse=xterm2
set tags+=tags;
set fillchars=vert:\│
set splitbelow
set updatetime=250
" ========== Basic VIM Setting End==========

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
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ========== Plugin Setting ==========
"Plugin 'lifepillar/vim-solarized8.git'
"colorscheme solarized8_high
Plugin 'tomasr/molokai'
colorscheme molokai
let g:molokai_original = 1

set guifont=monospace\ 12
set background=dark
hi Visual cterm=reverse gui=reverse

Plugin 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'modified', 'filename' ] ],
      \ },
      \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
      \ }

Plugin 'majutsushi/tagbar'
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=20
"let g:tagbar_left = 1
nmap <F8> :TagbarToggle<CR>

Plugin 'wesleyche/SrcExpl'
" map shortcut to "F2"
nmap <F2> :SrcExplToggle<CR>
" set the height of window
let g:SrcExpl_winHeight = 8
" Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 300
" Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"
" Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"
" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 0
" // Workaround for Vim bug @https://goo.gl/TLPK4K as any plugins using autocmd for
" // BufReadPre might have conflicts with Source Explorer. e.g. YCM, Syntastic etc.
let g:SrcExpl_nestedAutoCmd = 1
" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" // create/update the tags file
"let g:SrcExpl_updateTagsCmd = "ctags -R --sort=foldcase --c++-kinds=+pl --fields=+iaS --extra=+q ."
let g:SrcExpl_updateTagsCmd = "ctags -L $HOME/cs.files"
" // Set "<F3>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F3>"

Plugin 'davidhalter/jedi-vim'
let g:jedi#force_py_version = 3
let g:jedi#completions_command = '<C-N>'
let g:jedi#goto_command = '<leader>jg'
let g:jedi#documentation_command = '<leader>jd'
let g:jedi#usages_command = '<leader>ju'

Plugin 'airblade/vim-gitgutter'
let g:gitgutter_sign_added = 'A'
let g:gitgutter_sign_modified = 'M'
let g:gitgutter_sign_removed = 'D'
highlight GitGutterAdd    ctermfg=blue
highlight GitGutterChange ctermfg=green
highlight GitGutterDelete ctermfg=red
set signcolumn=yes

Plugin 'preservim/nerdtree'
" Start NERDTree and put the cursor back in the other window.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let NERDTreeWinSize=27
nnoremap <leader>f :NERDTreeFind<CR> :wincmd p<CR>
nmap <leader>t :NERDTreeToggle<CR> :wincmd p<CR>
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'derekwyatt/vim-scala'

" ========== Plugin Setting End ==========

filetype plugin indent on " required


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
map L <ESC>:tabnext<CR>
map H <ESC>:tabprev<CR>
"map ( <ESC>:-tabmove<CR>
"map ) <ESC>:+tabmove<CR>
"map <C-t>n <ESC>:Texplore <bar><CR>
nnoremap cc <ESC>:q<CR>
nnoremap CC <ESC>:q!<CR>
"map <C-c> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q --exclude="*.mem" .<CR>
"nmap + <C-W>+
"nmap - <C-W>-
"execute "set <A-=>=\e="
"nmap <A-=>  <C-w>>
nmap dir  <ESC>:Explore<CR>
nmap sdir <ESC>:Sexplore<CR>
nmap vdir <ESC>:Vexplore<CR>
nmap <leader>T  <ESC>:tabnew<CR>:Explore<CR>
nmap mks <ESC>:mksession!<CR>

fu! StartsWith(longer, shorter) abort
  return a:longer[0:len(a:shorter)-1] ==# a:shorter
endfunction
function! ToOctFunc()
  let current_word = expand("<cword>")
  if StartsWith(current_word, "0x")
    execute ":echo " . current_word
  else
    execute ":echo 0x" . current_word
  endif
endfunction
nnoremap <leader>o :call ToOctFunc()<CR>

function! ToHexFunc()
  let current_word = expand("<cword>")
  execute ":echo printf('%x', " . current_word . ")"
endfunction
nnoremap <leader>h :call ToHexFunc()<CR>

nmap wdiff <ESC>:windo diffthis<CR>
nnoremap tt <ESC>:33 sp<CR> : cstag <C-R>=expand("<cword>")<CR><CR>
execute "set <A-w>=\ew"
nnoremap <A-w> <ESC><C-w>T :e<CR>
nmap <C-w>w <ESC>:windo set wrap<CR>
"nnoremap <2-LeftMouse> :vs<CR> <C-w>T : cstag <C-R>=expand("<cword>")<CR><CR> <C-w>T
"nnoremap <F5> <C-w>T
"nnoremap <Space><Space> :q<CR>
"nmap ff :vimgrep /<c-r>=expand("<cword>")<cr>/ %<cr> !:copen <Enter>

"nnoremap <leader>d "_d
"vnoremap <leader>d "_d
"vnoremap <leader>p "_dP
nnoremap <leader>R :source $MYVIMRC<CR>
nnoremap <leader>Q :qa<CR>
nnoremap <leader><leader> :e<CR>
nnoremap <leader>p :set paste!<CR>
nnoremap <leader>s :set spell!<CR>
nnoremap <leader>n :set nu!<CR>
nnoremap <leader>m :marks abcdefghijklmnopqrstuvwxyz<CR>
nnoremap <leader>z :new<CR><C-w>J<ESC>p<CR>:set nu!<CR>
nnoremap term :botright term<CR><C-w>
function! QuickGrep(type)
  if exists("g:qfix_win")
    cclose
    unlet g:qfix_win
  else
    normal! gv"xy
    if (a:type == "regex")
      call inputsave()
      let l:search_word = input('Enter regex: ')
      call inputrestore()
    else
      let l:search_word = getreg("x")
    endif
    execute ":vimgrep \"" . l:search_word . "\" %"
    botright cw
    let g:qfix_win = bufnr("$")
  endif
endfunction
nnoremap <leader>g :call QuickGrep("")<CR>
nnoremap <leader>G :call QuickGrep("regex")<CR>
func! PythonRun()
    exec "w"
    if &filetype == 'python'
        exec "!time python3 %"
    endif
endfunc
nnoremap <leader>pr :call PythonRun()<CR>
nnoremap <leader>vd :!git d %<CR>
" ========== VIM Self Color Setting ==========
highlight MyTabSpace guifg=Yellow ctermfg=Yellow
match MyTabSpace /\t\| /
set listchars=tab:>~,trail:@

hi CursorLine ctermfg=NONE ctermbg=17 cterm=NONE

set wildignore+=tags

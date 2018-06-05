"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/crokobit/Data/nvim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/crokobit/Data/nvim')
  call dein#begin('/Users/crokobit/Data/nvim')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/crokobit/Data/nvim/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add( 'tpope/vim-fugitive') " Git rapper
  call dein#add( 'ctrlpvim/ctrlp.vim')
  call dein#add( 'flazz/vim-colorschemes')
  call dein#add( 'vim-ruby/vim-ruby')
  call dein#add( 'scrooloose/nerdtree')
  call dein#add( 'rking/ag.vim') " ack alternative
  call dein#add( 'pangloss/vim-javascript')
  call dein#add( 'tpope/vim-rails')
  call dein#add( 'tpope/vim-commentary') " gc
  call dein#add( 'hwartig/vim-seeing-is-believing')
  call dein#add( 'easymotion/vim-easymotion')
  " call dein#add( 'haya14busa/incsearch.vim')
  " call dein#add( 'haya14busa/incsearch-fuzzy.vim')
  " call dein#add( 'haya14busa/incsearch-easymotion.vim')
  call dein#add( 'luochen1990/rainbow')

"Vim plugin that allows you to save files into directories that do not exist yet.
call dein#add( 'DataWraith/auto_mkdir')

"screen.vim is a vim plugin which allows you to simulate a split shell in vim using either gnu screen or tmux, and to send selections to be evaluated by the program running in that shell
" call dein#add( 'ervandew/screen')

" ctrl + N P X mutiple select
call dein#add( 'terryma/vim-multiple-cursors')

" use vim trace code
call dein#add( 'fntlnz/atags.vim')
" call dein#add( 'vim-scripts/taglist.vim')

call dein#add( 'mileszs/ack.vim')

"solarized, screen color template
call dein#add( 'altercation/vim-colors-solarized')
" call dein#add( 'chilicuil/vim-sml-coursera')

call dein#add('pangloss/vim-javascript')
call dein#add('maxmellon/vim-jsx-pretty')
call dein#add('Yggdroot/indentLine')
call dein#add('tpope/vim-surround')
call dein#add('michaeljsmith/vim-indent-object')
call dein#add('AndrewRadev/splitjoin.vim')
call dein#add('t9md/vim-choosewin')
" call dein#add('jeffkreeftmeijer/vim-numbertoggle')


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Settings of NeoBundle 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
"colorscheme leglight2

set nomodeline
set directory-=.                                             " don't store swapfiles in the current directory
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set backspace=indent,eol,start
"Indentation without hard tabs (Ruby style)
set expandtab                                                " expand tabs to spaces
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces

set path+=**
set wildmenu


" Settings of NeoBundle 'altercation/vim-colors-solarized'

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

let g:indentLine_color_term = 239
let g:rainbow_active = 1

noremap h <NOP>
noremap j <NOP>
noremap k <NOP>
noremap l <NOP>

let mapleader = ";"
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

set number relativenumber


"vim-choosewin
" invoke with '-'
nmap <Leader>- <Plug>(choosewin)
" if you want to use overlay feature
let g:choosewin_overlay_enable = 1

  augroup seeingIsBelievingSettings
    autocmd!

    " autocmd FileType ruby nmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)

    autocmd FileType ruby nmap <buffer> ga <Plug>(seeing-is-believing-mark)
    autocmd FileType ruby xmap <buffer> gz <Plug>(seeing-is-believing-mark)
    autocmd FileType ruby imap <buffer> ga <Plug>(seeing-is-believing-mark)

    autocmd FileType ruby nmap <buffer> gA <Plug>(seeing-is-believing-run)
  augroup END
  
" Rainbow Colors Improved Setup {{{
" au FileType c,cpp,objc,objcpp,go,rust,javascript,java call rainbow#load()
" au FileType clojure call rainbow#load(
"             \ [['(', ')'], ['\[', '\]'], ['{', '}']], " custom braces
"             \ '"[-+*/=><%^&$#@!~|:?\\]"') " custom operators
" " }}}

"End dein Scripts-------------------------

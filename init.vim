call plug#begin('~/.vim/plugged')
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  Plug  'tpope/vim-fugitive' " Git rapper
  Plug  'ctrlpvim/ctrlp.vim'
  Plug  'flazz/vim-colorschemes'
  Plug  'vim-ruby/vim-ruby'
  Plug  'scrooloose/nerdtree'
  Plug  'rking/ag.vim' " ack alternative
  Plug  'pangloss/vim-javascript'
  Plug  'tpope/vim-rails'
  Plug  'tpope/vim-commentary' " gc
  Plug  'hwartig/vim-seeing-is-believing'
  Plug  'easymotion/vim-easymotion'
  Plug  'haya14busa/incsearch.vim', { 'rev': 'v2.0.1' }
  Plug  'haya14busa/incsearch-fuzzy.vim'
  Plug  'haya14busa/incsearch-easymotion.vim'
  Plug  'luochen1990/rainbow'
  "Vim plugin that allows you to save files into directories that do not exist yet.
  Plug  'DataWraith/auto_mkdir'
" ctrl + N P X mutiple select
  " Plug  'terryma/vim-multiple-cursors'
  " use vim trace code
  Plug  'fntlnz/atags.vim'
  " Plug  'vim-scripts/taglist.vim'
  Plug  'mileszs/ack.vim'

  "solarized, screen color template
  Plug  'altercation/vim-colors-solarized'
  " Plug  'chilicuil/vim-sml-coursera'

  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'Yggdroot/indentLine'
  Plug 'tpope/vim-surround'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 't9md/vim-choosewin'
  " Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'vim-airline/vim-airline' " better status bar
  Plug 'vim-airline/vim-airline-themes'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-repeat'
  Plug 'mkitt/tabline.vim'
call plug#end()

" Don’t add empty newlines at the end of files
set binary
set noeol

" auto-pairs
let g:AutoPairsFlyMode = 1

" vim-airline
let g:airline_theme='solarized'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#tab_nr_type = 1

" vim-incsearch with vim-easymotion
" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())



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

" show invisible chars
set list
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_
" Invisible character colors 
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

let g:indentLine_color_term = 239
let g:rainbow_active = 1

" it breaks my vim-ruby text object
" noremap h <NOP>
" noremap j <NOP>
" noremap k <NOP>
" noremap l <NOP>

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


function! s:BlankUp(count) abort
  put!=repeat(nr2char(10), a:count)
  ']+1
  silent! call repeat#set("\<Plug>unimpairedBlankUp", a:count)
endfunction

function! s:BlankDown(count) abort
  put =repeat(nr2char(10), a:count)
  '[-1
  silent! call repeat#set("\<Plug>unimpairedBlankDown", a:count)
endfunction


nnoremap <space>k   :<C-U>call <SID>BlankUp(v:count1)<CR>
nnoremap <space>j :<C-U>call <SID>BlankDown(v:count1)<CR>

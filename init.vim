call plug#begin('~/.vim/plugged')
  "syntax
  Plug 'vim-ruby/vim-ruby' " text object m -> mathod M -> Class
  Plug 'hwartig/vim-seeing-is-believing' " ga gA repl ruby with vim
  Plug 'AndrewRadev/splitjoin.vim' " gS gJ do end to { }
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-endwise'
  Plug 'nelstrom/vim-textobj-rubyblock' " text object r for do-end block or def end
  Plug 'kana/vim-textobj-user' " dependency of vim-textobj-rubyblock

  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'chilicuil/vim-sml-coursera'

  " search
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'rking/ag.vim' " Ag with the_silver_searcher
  Plug 'fntlnz/atags.vim' " file tags generating with ctags
  Plug 'easymotion/vim-easymotion' " ;s ;w ;L / ;f
  Plug 'haya14busa/incsearch-easymotion.vim'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-fuzzy.vim'

  " browse
  Plug 'scrooloose/nerdtree'
  Plug 't9md/vim-choosewin' " ;- switch window with alphabet

  " tool
  Plug 'tpope/vim-fugitive' " Git rapper
  Plug 'Shougo/neosnippet.vim' " <C-k>
  Plug 'Shougo/neosnippet-snippets'
  Plug 'honza/vim-snippets'
  Plug 'kchmck/vim-coffee-script'

  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  endif

  " theme
  Plug 'flazz/vim-colorschemes'
  Plug 'altercation/vim-colors-solarized'
  Plug 'luochen1990/rainbow' " show () [] {} pairs with color
  Plug 'Yggdroot/indentLine' " display the indention levels with thin vertical lines

  " shortcut
  Plug 'tpope/vim-commentary' " gc
  Plug 'tpope/vim-surround' " (surround above and below) <visual-mode>+gS (surround inline) <visual-mode>+S cs<original surround or single char text-obj><new_surround_char> ds<add-char> arround ys<text-object><add-char>
  Plug 'michaeljsmith/vim-indent-object' " text object indent i
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-repeat'

  " showing information
  Plug 'vim-airline/vim-airline' " better status bar
  Plug 'vim-airline/vim-airline-themes'
  Plug 'mkitt/tabline.vim' " show tag window sequence no.
  Plug 'majutsushi/tagbar' " show file structure
  Plug 'rizzatti/dash.vim' "<leader>d


  Plug 'rhysd/vim-grammarous'
call plug#end()

" neosnippet Plugin key-mappings.

" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Tell Neosnippet about the other snippets
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='/Users/crokobit/.vim/plugged/vim-snippets/snippets'

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Don’t add empty newlines at the end of files
set binary
set noeol

" auto-pairs
let g:AutoPairsFlyMode = 1

" vim-airline
let g:airline_theme='solarized'

" vim-easymotion
"
let mapleader = "'"
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" vim-incsearch with vim-easymotion
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

" noremap <silent><expr>/  incsearch#go(<SID>incsearch_config())
" noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
" noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

noremap <silent><expr><Leader>/  incsearch#go(<SID>incsearch_config())
noremap <silent><expr><Leader>?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr><Leader>g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

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


" general settings
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

" not search in ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

let g:indentLine_color_term = 239
let g:rainbow_active = 1


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


nmap <silent> <leader>d <Plug>DashSearch

" auto-pairs
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'

au BufNewFile,BufRead *.coffee set filetype=coffee

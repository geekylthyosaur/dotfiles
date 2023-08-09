" Disable arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" Disable history menu
noremap q: <Nop>
" Disable entering the ex mode
noremap Q <Nop>
" Remove hightlights after search
nnoremap <Esc> :nohlsearch<CR>

set encoding=utf-8
set nocompatible

syntax enable
filetype plugin indent on

" Tab behavior
set autoindent
set expandtab
set smartindent
set smarttab
" Default tab is 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Tab is 2 spaces for filetypes
autocmd FileType vim,go,lua,javascript,yaml,json,html,css,scss setlocal tabstop=2 softtabstop=2 shiftwidth=2

set nonumber
set norelativenumber
set signcolumn=yes

" Status line
set ruler
set rulerformat=%30(%=%##%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)
set laststatus=0

" Use system's clipboard (vim --version | grep '+clipboard')
if has('clipboard')
  set clipboard=unnamedplus
else
  " TODO
endif

" Scrolloff
set scrolloff=11
set sidescrolloff=29

" Disable swap file
set nobackup
set noswapfile
set nowritebackup

" Highlight search results
set hlsearch
" Highlight characters (:set list to enable)
set nolist
set nowrap sidescroll=1 listchars=space:.,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>

" Block cursor
set guicursor=

" Remove .viminfo from $HOME
if !has('nvim')
  if !empty($XDG_STATE_HOME)
    call mkdir($XDG_STATE_HOME."/vim/", 'p')
    set viminfofile=$XDG_STATE_HOME/vim/viminfo
  endif
endif

" Colors
set background=dark

highlight SignColumn ctermbg=236

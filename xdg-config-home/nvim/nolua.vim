set encoding=utf-8
set nocompatible

" Disable ~/.viminfo
set viminfo=

" <Leader> is <Space>
map <Space> <Leader>

nnoremap U <C-r>

" Tabs
nnoremap <Leader>= <Cmd>tabnew<CR>
nnoremap <Leader>\ <Cmd>tabnew<CR>
nnoremap <Leader>q <Cmd>tabclose<CR>
nnoremap <Leader>- <Cmd>tabclose<CR>
nnoremap <Leader>] <Cmd>tabnext<CR>
nnoremap <Leader>[ <Cmd>tabprevious<CR>
nnoremap <Leader>} <Cmd>tabmove +1<CR>
nnoremap <Leader>{ <Cmd>tabmove -1<CR>

" Focus new panel after split
nnoremap <C-w>s <C-w>s<C-w>j
nnoremap <C-w>v <C-w>v<C-w>l

" Shift using single keypress
nnoremap > >>
nnoremap < <<

" Disable history menu
noremap q: <Nop>
" Disable ex mode
noremap Q <Nop>

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
" FIXME
autocmd FileType vim,go,lua,javascript,yaml,json,html,css,scss,vue setlocal tabstop=2 softtabstop=2 shiftwidth=2

set nonumber
set norelativenumber
set signcolumn=yes

" Status line
set ruler
set rulerformat=%30(%=%##%.99F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)
set laststatus=0
set noshowcmd

" Yank to system clipboard (`vim --version | grep "+clipboard"`)
if has('clipboard')
  vnoremap Y "+y
  nnoremap YY "+yy
  vnoremap <Leader>Y "+y
  nnoremap <Leader>Y "+yy
else
  vnoremap Y :echo 'System clipboard is not supported'<CR>
  nnoremap YY :echo 'System clipboard is not supported'<CR>
  vnoremap <Leader>Y :echo 'System clipboard is not supported'<CR>
  nnoremap <Leader>Y :echo 'System clipboard is not supported'<CR>
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
" Remove hightlights after search
nnoremap <Leader>h <Cmd>nohlsearch<CR>
" Highlight characters
set list
set nowrap sidescroll=1 nowrap sidescroll=1 listchars=tab:\→\ ,trail:_,precedes:<,extends:>,

" Block cursor
set guicursor=

" Disable mouse except scroll
set mouse=a
nnoremap <LeftMouse> <Nop>
nnoremap <RightMouse> <Nop>
nnoremap <MiddleMouse> <Nop>


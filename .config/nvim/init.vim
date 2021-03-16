" Vim Plug
call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
call plug#end()

" Set leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

" Basic configuration
set hidden
set relativenumber
set showcmd
set incsearch
set hlsearch
set ignorecase
set smartcase
set foldenable

" Tabs & Spaces
set autoindent
set copyindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set wildmenu

" Window Management
set splitbelow
set splitright

" Spell checker
set spelllang=en,de
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

" APPEARANCE
" ----------
" Theme
set termguicolors
colorscheme nord

" KEYBINDINGS
" -----------
" General
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>qq :q<CR>

" File Operations
nnoremap <leader>fs :update<CR>

" Window Management
nnoremap <leader>wd :close<CR>
nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wh <C-W><C-H>
nnoremap <leader>ws :split<CR>
nnoremap <leader>wv :vsplit<CR>

" Buffer Management
nnoremap <leader>bk :tabclose<CR>
nnoremap <leader>bl :tabNextCR>
nnoremap <leader>bh :tabprevious<CR>
nnoremap <leader>bn :tabnew<CR>

" PLUGINS
" -------

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Vimtex
nnoremap <leader>lc :VimtexCompile<CR>
let g:vimtex_view_method = 'zathura'

" CoC

" WhichKey
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=1500

" FZF
nnoremap <leader>. :FZF<CR>

" FUNCTIONS
function! WritingMode()

endfunction

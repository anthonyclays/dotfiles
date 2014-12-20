set nocompatible

" Setup runtime path
set rtp+=~/.vim/bundle/Vundle.vim

" Vundle plugin list
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/vimproc.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'sudar/vim-arduino-snippets'
Plugin 'bonsaiben/bootstrap-snippets'
Plugin 'lervag/vim-latex'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'majutsushi/tagbar'
Plugin 'raimondi/delimitMate'
Plugin 'tomtom/tcomment_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'haya14busa/incsearch.vim'
Plugin 'baeuml/summerfruit256.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'vim-scripts/closetag.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'scrooloose/nerdtree'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'bling/vim-airline'
call vundle#end()

" Plugin settings
"YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"Tagbar
nmap <F8> :TagbarToggle<CR>
"Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_cpp_compiler='g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -Wall -Wextra'
"Ultisnips
let g:UltiSnipsExpandTrigger='<c-l>'
"Additional snippets
let g:snips_author='Anthony Clays'
"Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


" Basic vim options
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set showcmd
set relativenumber
set number
set showmatch
set matchtime=3
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=2
set autoindent
set smartindent
" set textwidth=79
set formatoptions=c,q,r,t
set ruler
set background=light
set mouse=a
set encoding=utf-8
set t_Co=256
set timeoutlen=1000
set ttimeoutlen=0
set wildmenu
set clipboard+=unnamedplus
"set showbreak=↪ 

" Set the colorscheme
"colorscheme elflord
"colorscheme summerfruit256
colorscheme zenburn

filetype plugin indent on
syntax on

" LaTeX
let g:tex_flavor = "latex"

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" FUCK YOU EX
nnoremap Q <nop>

" Powerline statusline
source /usr/share/vim/addons/plugin/powerline.vim
set laststatus=2
set showtabline=2
set noshowmode

" Associate .pde filetype with Arduino
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino

" Change leader to space
let mapleader="\<space>"
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>b :bprev<CR>
nnoremap <Leader>n :bnext<CR>
nmap <Leader><Leader> V
nnoremap <Leader>x :wq<CR>
nnoremap <Leader>t :tag<CR>
nnoremap <Leader>/ :nohlsearch<CR>
nnoremap <Leader>rtw :%s/\s\+$//e<cr>

" make j and k more natural
nnoremap j gj
nnoremap k gk


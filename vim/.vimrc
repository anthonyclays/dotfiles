set nocompatible

" Setup runtime path (Vundle only)
"set rtp+=~/.vim/bundle/Vundle.vim

" Plug plugin list
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'Shougo/vimproc.vim'
" Plugin 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sudar/vim-arduino-snippets', {'for': 'arduino'}
Plug 'bonsaiben/bootstrap-snippets', {'for': 'html'}
Plug 'lervag/vim-latex', {'for': 'latex'}
Plug 'nathanaelkane/vim-indent-guides'
Plug 'majutsushi/tagbar'
Plug 'raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'haya14busa/incsearch.vim'
Plug 'baeuml/summerfruit256.vim'
Plug 'jnurmine/Zenburn'
Plug 'closetag.vim', {'for': 'html'}
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'scrooloose/nerdtree',
Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}
Plug 'bling/vim-airline'
Plug 'JuliaLang/julia-vim', {'for': 'julia'}
Plug 'jplaut/vim-arduino-ino'", {'for': 'arduino'}
Plug 'michaeljsmith/vim-indent-object'
Plug 'argtextobj.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'ldong/vim_loremipsum'
Plug 'wting/rust.vim'
Plug 'justinmk/vim-sneak'
call plug#end()

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
"Julia-vim
let g:latex_to_unicode_tab = 0
let g:latex_to_unicode_auto = 1
" LaTeX
let g:tex_flavor = "latex"
" Power/airline
"source /usr/share/vim/addons/plugin/powerline.vim
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'
set laststatus=2
set showtabline=2
set noshowmode
" replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
" replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

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

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" FUCK YOU EX
nnoremap Q <nop>

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

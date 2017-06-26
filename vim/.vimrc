set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/vimproc.vim'
" Plug 'Valloric/YouCompleteMe'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-completion-manager'
Plug 'Shougo/echodoc.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'majutsushi/tagbar'
Plug 'raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
" Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'haya14busa/incsearch.vim'
Plug 'scrooloose/nerdtree'
" Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-scripts/argtextobj.vim'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-easy-align'
Plug 'altercation/vim-colors-solarized'
" Plug 'klen/python-mode'
Plug 'elixir-lang/vim-elixir'
Plug 'chriskempson/base16-vim'
Plug 'JuliaLang/julia-vim'
Plug 'cespare/vim-toml'
Plug 'idris-hackers/idris-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'sjl/gundo.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'vim-scripts/idp.vim'
Plug 'mk12/vim-lean'
Plug 'peterhoeg/vim-qml'
call plug#end()

" Change leader to space
let mapleader="\<space>"

" Plugin settings
"YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_rust_src_path='/usr/local/rust/rustc-nightly/src'
"Tagbar
nmap <F8> :TagbarToggle<CR>
"Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_cpp_compiler='clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -Wall -Wextra'
" Ultisnips
let g:UltiSnipsExpandTrigger='<c-l>'
"Additional snippets
let g:snips_author='Anthony Clays'
let g:snips_email='anthonyclays@gmail.com'
let g:snips_github='anthonyclays'
"Incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
"Julia-vim
let g:latex_to_unicode_tab = 0
let g:latex_to_unicode_auto = 1
" LaTeX
" let g:tex_flavor = "latex"
" Power/airline
"source /usr/share/vim/addons/plugin/powerline.vim
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:airline_solarized_bg='dark'
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
" TComment maps to <leader>c
nmap <leader>c :TComment<CR>
vmap <leader>c :TCommentBlock<CR>
" CtrlP
"let g:ctrlp_user_command = 'ag %s --nocolor -g ""'
" vim-easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" fswitch maps
" nnoremap <leader>hs :FSHere<CR>
" nnoremap <leader>hl :FSLeft<CR>
" nnoremap <leader>hr :FSRight<CR>
" Gitgutter maps
" nnoremap <leader>ha <Plug>GitGutterStageHunk
" nnoremap <leader>hu <Plug>GitGutterRevertHunk
" nnoremap <leader>hv <Plug>GitGutterPreviewHunk
" nerdtree maps
nnoremap <F3> :NERDTreeToggle<CR>
" Python-mode settings
let g:pymode_breakpoint_bind = '' " remove <leader>b breakpoint
" racer settings
" let g:racer_cmd
nnoremap <F5> :GundoToggle<CR>

" Basic vim options
set tabstop=4
set shiftwidth=4
set expandtab smarttab
set relativenumber number
set showmatch showcmd
set matchtime=3
set hlsearch incsearch
set ignorecase smartcase
set backspace=2
set autoindent smartindent
" set textwidth=79
set formatoptions=c,q,r,t,j
set ruler
set background=dark
set mouse=a
set encoding=utf-8
set t_Co=256
set timeoutlen=1000
set ttimeoutlen=0
set clipboard="autoselect"
set colorcolumn=80
set nocursorcolumn cursorline
set ttyfast
syn sync minlines=40
"set showbreak=↪

" Start scrolling before hitting an edge
set scrolloff=3
set sidescrolloff=5

" Set the colorscheme
colorscheme solarized

filetype plugin indent on
syntax enable

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" FUCK YOU EX
nnoremap Q <nop>

" More mapleader commands
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>b :bprev<CR>
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>t :tag<CR>
nnoremap <Leader>/ :nohl<CR>
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
nnoremap <Leader>u :GundoToggle<CR>

" make Y, j and k more natural
nnoremap Y y$
nnoremap j gj
nnoremap k gk

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType qml setlocal shiftwidth=2 tabstop=2

" nvim completion manager
set shortmess+=c
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" language client
set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls'],
    \ 'ocaml': ['ocaml-language-server'],
    \ }
    " \ 'python': ['pyls'],
let g:LanguageClient_autoStart = 1
let g:LanguageClient_signColumnAlwaysOn = 0
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <Leader>f :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" neovim-specific options
if has('nvim')
    set inccommand=nosplit
endif

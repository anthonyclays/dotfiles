set nocompatible

call plug#begin('~/.vim/plugged')
" Plug 'Valloric/YouCompleteMe'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': './install.sh' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ncm2/ncm2-ultisnips'
" Plug 'raimondi/delimitMate'
" Plug 'cohama/lexima.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'haya14busa/incsearch.vim'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/argtextobj.vim'
Plug 'sheerun/vim-polyglot'
Plug 'rhysd/vim-wasm'
Plug 'junegunn/vim-easy-align'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'sjl/gundo.vim'
Plug 'christianrondeau/vim-base64'
call plug#end()

filetype plugin indent on
syntax enable

" Basic vim options
set autoindent smartindent
set backspace=2
set colorcolumn=100 textwidth=99
set cursorline nocursorcolumn
set encoding=utf-8
set expandtab smarttab shiftwidth=4 tabstop=4 " tab indent behaviour
set formatoptions=c,q,r,t,j
set hlsearch incsearch ignorecase smartcase " search behaviour
set mouse=a " mouse support
set number relativenumber " (relative) line numbers
set scrolloff=3 sidescrolloff=5 " scroll before hitting an edge
set showcmd
set showmatch matchtime=3 " briefly jump to matching paretheses / brackets etc.
set timeoutlen=1000 ttimeoutlen=0
set clipboard=unnamedplus " use system clipboard
syn sync minlines=50
"set showbreak=↪

" Set the colorscheme
colorscheme solarized
set background=light

" Change leader to space
let mapleader="\<space>"

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" FUCK YOU EX
nnoremap Q <nop>

" More mapleader commands
nnoremap <Leader>b :tabnew<CR>
nnoremap <Leader>d :bdelete<CR>
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <Leader>n :tabnext<CR>
nnoremap <Leader>p :tabprev<CR>
nnoremap <Leader>rtw :%s/\s\+$//e<CR>
nnoremap <Leader>o :TagbarOpen fj<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>t :bnext<CR>
nnoremap <Leader>T :bprev<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>/ :nohl<CR>

" function key maps
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F4> :TagbarToggle<CR>
nnoremap <F5> :GundoToggle<CR>

" make Y, j and k more natural
nnoremap Y y$
nnoremap j gj
nnoremap k gk

" Enter should insert newline instead of suggested completion
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" {<enter> should insert a closing brace on the next line
inoremap {<cr> {<cr>}<esc>O


" Plugin settings

" LanguageClient-neovim
" let g:LanguageClient_serverCommands = { 'rust': ['rls'] }

" Ultisnips
let g:UltiSnipsExpandTrigger='<c-l>'
let g:snips_author='Anthony Clays'
let g:snips_email='anthony@clays.me'
let g:snips_github='anthonyclays'

" tagbar
let g:tagbar_compact = 1
let g:tagbar_width = 30
let g:tagbar_zoomwidth = 60
highlight TagbarHighlight ctermfg=blue ctermbg=lightgrey

" delimitMate
" let g:delimitMate_balance_matchpairs = 0
" let g:delimitMate_expand_space = 1
" let g:delimitMate_expand_cr = 2
" let g:delimitMate_jump_expansion = 0
" let g:delimitMate_nesting_quotes = ['"',"'",'`']
" let g:delimitMate_smart_matchpairs = '.\{1,}'

" TComment
nmap <leader>c :TComment<CR>
vmap <leader>c :TCommentBlock<CR>

" Incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" NERDTree
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1

" Power/airline
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg = 'light'
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tagbar#enabled = 1
" let g:airline#extensions#ale#enabled = 1
set laststatus=2
set showtabline=2
set noshowmode

" vim-easy-align
vmap <Enter> <Plug>(EasyAlign)

" file type specific autocommands
autocmd FileType html,htmldjango,qml,tex setlocal shiftwidth=2 tabstop=2
autocmd BufRead,BufNewFile *.lalrpop setfiletype rust


" neovim-specific options
if has('nvim')
    set inccommand=nosplit
endif

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## f1360bcf1e8fe974cf4610858742b4fe ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/home/anthony/.opam/4.06.1/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line

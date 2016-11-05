set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
" Plugin 'tpope/vim-commentary'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'raimondi/delimitmate'
Plugin 'mxw/vim-jsx'
" Plugin 'valloric/youcompleteme'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
" Plugin 'tyru/open-browser.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
" Plugin 'vim-scripts/c.vim'
Plugin 'altercation/vim-colors-solarized'

Plugin 'flazz/vim-colorschemes'
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'elzr/vim-json'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'pangloss/vim-javascript'
Plugin 'matchit.zip'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-sensible'
" Plugin 'tpope/vim-rails'
Plugin 'vim-scripts/project.tar.gz'
Plugin 'vim-scripts/cscope.vim'
Plugin 'DataWraith/auto_mkdir'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'vim-scripts/OmniCppComplete'
" Plugin 'elixir-lang/vim-elixir'
Plugin 'L9'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required


" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Sets how many lines of history VIM has to remember
set history=700

nmap <F8> :TagbarToggle<CR>

filetype plugin on
filetype indent on
filetype on

set so=7

set wildmenu

set autoread

set pastetoggle=<F2>

set wildignore=*.o,*~,*.pyc,*.class
set title
" Always show current position
set ruler
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hidden
" don't wrap lines
set nowrap

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Enable syntax highlighting
syntax enable
syntax on

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
let &termencoding=&encoding
set fileencoding=utf-8
set fileencodings=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set number

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
" copy the previous indentation on autoindenting
set copyindent
set wrap "Wrap lines

set completeopt=longest,menu
set cscopequickfix=s-,c-,d-,i-,t-,e-

" VIM 7.3+ has support for highlighting a specified column.
if exists('+colorcolumn')
    set colorcolumn=80
else
    " Emulate
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif

" 去除行为空格
" autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType c,cpp,java,php,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e
" ctags -R --fields=+lS .
" let g:EasyMotion_leader_key = 't'
nmap s <Plug>(easymotion-s)
" Gif config
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

set background=dark
" colorscheme solarized
colorscheme desert

" if has('gui_running')
"     set background=light
" else
"     set background=dark
" endif
let mapleader = ','
" autocmd vimenter * NERDTree
" let g:ackprg = 'ag --nogroup --nocolor --column'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

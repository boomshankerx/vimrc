" Init vundle and pathogen
filetype off                   " required!

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle 
Plugin 'gmarik/vundle'
" Plugins
Plugin 'Align'
Plugin 'FuzzyFinder'
Plugin 'L9'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter.git'
Plugin 'closetag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'elzr/vim-json' 
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'jceb/vim-orgmode'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
"Plugin 'python-rope/ropevim'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim'}
Plugin 'project.tar.gz'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
"Plugin 'skammer/vim-css-color'
Plugin 'taglist.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired' 
Plugin 'tweekmonster/django-plus.vim'
Plugin 'utl.vim'
Plugin 'vimwiki/vimwiki'

" COLOR SCHEMES
Plugin 'altercation/vim-colors-solarized'
Plugin 'antlypls/vim-colors-codeschool'
Plugin 'chriskempson/base16-vim'
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" GENERAL
filetype plugin indent on
set backspace=start,indent,eol
set cursorline
set encoding=utf-8
set history=50
set hlsearch
set incsearch
set laststatus=2
set nocompatible
set nowrap
set number
set ruler
set showcmd
set showmatch
set splitbelow
set splitright
set textwidth=0

" VISUAL
colorscheme gruvbox
set background=dark
set columns=110
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
set lines=40
set t_Co=256
syntax enable

" INDENTING
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" FOLDING
set foldmethod=indent
set foldlevel=99

" AUTO COMPLETION
set omnifunc=syntaxcomplete#Complete
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" PLUGIN SETTINGS
let g:Powerline_symbols                = 'fancy'
let g:django_filetypes                 = '*.py'
let g:jedi#auto_close_doc              = 1
let g:jedi#completions_command         = "<C-Space>"
let g:user_emmet_leader_key            = ',,'

let g:SuperTabDefaultCompletionType    = "<C-n>"
let g:UltiSnipsExpandTrigger           = "<C-j>"
let g:UltiSnipsJumpForwardTrigger      = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger     = "<C-k>"
"let g:UltiSnipsListSnippets            = "<C-S-k>" "List possible snippets based on current file
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']

" HTML
autocmd Filetype html,xhtml,xml,xsl source ~/.vim/bundle/closetag.vim/plugin/closetag.vim
autocmd Filetype html,xhtml,php set nowrap

" PROJECT
let g:proj_run1 = ':vnew %f'

" KEYBOARD MAPS
nnoremap <silent> <C-s> :update<CR>
nnoremap <Space> <C-w>w
nnoremap <Enter> <C-w>W

if has('gui_running')
    nnoremap <M-j> :m .+1<CR>==
    nnoremap <M-k> :m .-2<CR>==
else
    nnoremap j :m .+1<CR>==
    nnoremap k :m .-2<CR>==
endif
nmap <leader>v :so ~/.vimrc<CR>
nmap <leader>vv :e ~/.vimrc<CR>
nmap <C-Enter> <ESC>"+gPa
nmap <F3> :CtrlP<CR>
nmap <F4> :NERDTree<CR>
nmap <F5> :w<CR>

imap <C-Enter> <ESC>"+gpa
imap jj <esc>

" VISUAL MAPS
vmap <C-c> "+y
vmap <F5> :sort<CR>
vmap <F2> d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

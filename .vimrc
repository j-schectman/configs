set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
nmap <C-F> <Plug>VimwikiTabnewLink

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Themes
Plugin 'nanotech/jellybeans.vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'ciaranm/inkpot'
Plugin 'connorholyday/vim-snazzy'
Plugin 'axvr/photon.vim'
Plugin 'NLKNguyen/papercolor-theme'

" Productivity
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'leafgarland/typescript-vim'
Plugin 'kovisoft/slimv'

Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'neoclide/coc.nvim'
Plugin 'MaxMEllon/vim-jsx-pretty'

" Writing plugins
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'vimwiki/vimwiki'

call vundle#end()            " required

" My settings

let mapleader = "\<Space>"

filetype plugin indent on    " required

syntax on

set number
set ignorecase
set smartcase
set autoindent
set tabstop=2
set expandtab
set shiftwidth=2
set hidden
set wildignore=**/node_modules/**,**node_modules/,/node_modules/**
imap ii <Esc>

colorscheme PaperColor
set background=dark
set diffopt+=vertical

nnoremap <leader>gt :bn <CR>
nnoremap <leader>gT :bp <CR>
nnoremap <leader>bd :bd <CR>
nnoremap <leader>ve :e $MYVIMRC <CR>
nnoremap <leader>vs :source $MYVIMRC <CR>

command -nargs=1 Scratchlisp :tabe <args>.lisp


" Plugin Specific
"
" Vimwiki
let g:vimwiki_ext = '.md' " set extension to .md
let g:vimwiki_global_ext = 0 " make sure it doesn't think it owns the world

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md', 'diary_rel_path' : ''}]

" CoC
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent><nowait> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader>l :<C-u>CocDiagnostics <cr>
" Show commands.
nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <C-p> :GFiles <cr>
nnoremap <silent><nowait> <C-P> :Files <cr>
nnoremap <silent><nowait> <C-l> :Buffers <cr>
" vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

" goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 'grey' 

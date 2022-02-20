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
Plugin 'dense-analysis/ale'
Plugin 'MaxMEllon/vim-jsx-pretty'

" Writing plugins
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

colorscheme PaperColor
set background=dark
set diffopt+=vertical

nnoremap gt :bn <CR>
nnoremap gT :bp <CR>
nnoremap <leader>gt :tabn <CR>
nnoremap <leader>gT :tabp <CR>
nnoremap <leader>bd :bd <CR>
nnoremap <leader>ve :e $MYVIMRC <CR>
nnoremap <leader>vs :source $MYVIMRC <CR>

" Plugin Specific
"
" Vimwiki
let g:vimwiki_ext = '.md' " set extension to .md
let g:vimwiki_global_ext = 0 " make sure it doesn't think it owns the world

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md', 'diary_rel_path' : ''}]

" FZF
nnoremap <silent><nowait> <C-p> :GFiles <cr>
nnoremap <silent><nowait> <C-P> :Files <cr>
nnoremap <silent><nowait> <C-l> :Buffers <cr>

" ALE
nnoremap <silent> gd :ALEGoToDefinition<cr>
nnoremap <silent> gr :ALEFindReferences -relative<Return>

" vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

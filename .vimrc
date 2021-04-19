set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
nmap <C-F> <Plug>VimwikiTabnewLink

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'leafgarland/typescript-vim'
Plugin 'kovisoft/slimv'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'


Plugin 'neoclide/coc.nvim'
Plugin 'MaxMEllon/vim-jsx-pretty'

" Writing plugins
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'vimwiki/vimwiki'

" Colorschemes
Plugin 'nanotech/jellybeans.vim'
Plugin 'connorholyday/vim-snazzy'
Plugin 'axvr/photon.vim'

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

set diffopt+=vertical

nnoremap <leader>gt :bn <CR>
nnoremap <leader>gT :bp <CR>
nnoremap <leader>ve :e $MYVIMRC <CR>
nnoremap <leader>vs :source $MYVIMRC <CR>

command! -nargs=1 Scratchlisp :tabe <args>.lisp scl

autocmd BufRead,BufNewFile *.md setlocal spell

if $TERM == "xterm-256color"
    set t_Co=256
endif

colorscheme snazzy

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
nnoremap <silent><nowait> <leader>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>p  :<C-u>CocListResume<CR>

" vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

" goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 'grey' 

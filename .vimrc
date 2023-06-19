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
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'cseelus/vim-colors-lucid'
Plugin 'sonph/onehalf', { 'rtp': 'vim' }
Plugin 'nvim-treesitter/nvim-treesitter'
Plugin 'williamboman/mason.nvim'
Plugin 'williamboman/mason-lspconfig.nvim'
Plugin 'neovim/nvim-lspconfig'

" Productivity
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" Plugin 'neoclide/coc.nvim'
Plugin 'github/copilot.vim'
Plugin 'hrsh7th/nvim-cmp'
Plugin 'hrsh7th/cmp-nvim-lsp'
Plugin 'hrsh7th/cmp-buffer'
Plugin 'hrsh7th/cmp-path'
Plugin 'hrsh7th/cmp-cmdline'
Plugin 'vim-test/vim-test'

" Writing plugins
Plugin 'vimwiki/vimwiki'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'vim-pandoc/vim-pandoc'

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

let g:vimwiki_list = [
      \ {'path': '~/Dropbox/workwiki/', 'syntax': 'markdown', 'ext': '.md', 'diary_rel_path' : ''},
      \ {'path': '~/Dropbox/personalwiki/', 'syntax': 'markdown', 'ext': '.md', 'diary_rel_path' : ''}
      \ ]

" FZF
nnoremap <silent><nowait> <C-p> :GFiles <cr>
nnoremap <silent><nowait> <C-P> :Files <cr>
nnoremap <silent><nowait> <C-l> :Buffers <cr>

" vim-airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

let g:go_fmt_autosave = 1

"goyo
function! s:goyo_enter()
   set linebreak
   Limelight
endfunction

function! s:goyo_leave()
   set linebreak!
   Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
nnoremap <silent><nowait> <leader>1  :<C-u>Goyo <cr>

"fugitive

nnoremap <leader>gg :Ggrep<Space>
nnoremap <leader>gw :Ggrep<Space><C-R><C-W>
" inoremap <C-g> <Esc>
" nnoremap <C-g> <Esc>
" vnoremap <C-g> <Esc>
" cnoremap <C-g> <Esc>
 
" use mason

lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  }
}

local lspconfig = require('lspconfig')
require'mason'.setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
}

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
 local cmp = require'cmp'

 cmp.setup({
    window = {
      completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
   sources = cmp.config.sources(
   {
     { name = 'nvim_lsp' },
   }, {
     { name = 'buffer' },
   })
  })
EOF

set termguicolors
let g:copilot_filetypes = {
      \ 'markdown': v:false,
      \ 'vimwiki': v:false,
      \ }
" copilot mapping
imap <silent><script><expr> <C-\> copilot#Accept("\<CR>")
" imap <silent><script><expr> <C-]> copilot#Next()
" imap <silent><script><expr> <C-[> copilot#Previous()
inoremap <Nul> <C-x><C-o> 

set timeoutlen=700 ttimeoutlen=0
colorscheme onehalflight

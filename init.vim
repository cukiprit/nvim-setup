" vim: set ft=vim :

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" this will install vim-plug if not installed
if empty(glob('C:/Users/Dika/AppData/Local/nvim/autoload/plug.vim'))
  silent !powershell -Command "iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $env:LOCALAPPDATA/nvim/autoload/plug.vim -Force"
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('C:/Users/Dika/AppData/Local/nvim/plugged')

" === LSP and Completion ===
Plug 'neoclide/coc.nvim', { 'do': 'npm install --no-package-lock' }
Plug 'neoclide/coc-eslint'
Plug 'fannheyward/coc-sql'

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-emmet',
  \ 'coc-snippets',
  \ 'coc-eslint',
  \ 'coc-sql'
\ ]

" === UI and UX Plugins ===
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" === Language & Snippet Support ===
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dsznajder/vscode-es7-javascript-react-snippets'
Plug 'tpope/vim-commentary'

call plug#end()

" Nvim-Tree setup
lua << EOF
require('nvim-tree').setup({
  view = {
    width = 30,
  },
  git = {
    enable = true,
  }
})
EOF

" === Keybindings ===

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Tab completion navigation
inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump'])\<CR>" :
  \ CheckBackSpace() ? "\<Tab>" :
  \ coc#refresh()

inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

" Confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Trigger completion
inoremap <silent><expr> <C-space> coc#refresh()

" Nvim-Tree
nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <leader>f :NvimTreeFocus<CR>

" Commentary (Ctrl+/)
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

inoremap <expr><S-Tab> pumvisible() ? "<C-p>" : "<C-h>"

" Toggle (open/close) tree
nnoremap <leader>e :NvimTreeToggle<CR>

" Focus the tree (when already open)
nnoremap <leader>f :NvimTreeFocus<CR>

" Comment shortcut
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

" Confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "<C-g>u\<CR>"

" Trigger completion
inoremap <silent><expr> <C-space> coc#refresh()

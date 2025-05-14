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
  \ 'coc-sql',
  \ 'coc-go'
\ ]

" === UI and UX Plugins ===
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'moll/vim-bbye'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" === Language & Snippet Support ===
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dsznajder/vscode-es7-javascript-react-snippets'
Plug 'tpope/vim-commentary'

call plug#end()

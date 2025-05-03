" this will install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Fix: 'plugged' was misspelled as 'plugged' in your original
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', { 'do': 'npm install --no-package-lock' }
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-emmet',
  \ 'coc-snippets'
\ ]

Plug 'jiangmiao/auto-pairs'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dsznajder/vscode-es7-javascript-react-snippets'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
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
=======

	\ coc#refresh()
inoremap <expr><S-Tab> pumvisible() ? "<C-p>" : "<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

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

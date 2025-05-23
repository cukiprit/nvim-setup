" vim: set ft=vim :

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set hidden
set showtabline=2
set mouse=a
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99

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
Plug 'nvim-telescope/telescope.nvim'
Plug 'moll/vim-bbye'
Plug 'ayu-theme/ayu-vim'

" === Language & Snippet Support ===
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'dsznajder/vscode-es7-javascript-react-snippets'
Plug 'tpope/vim-commentary'

call plug#end()

" Setup ayu theme
set termguicolors
let ayucolor="mirage"
colorscheme ayu

" Nvim-Tree setup
lua << EOF
require('nvim-tree').setup({
  view = { 
    width = 30,
    number = false,
    relativenumber = false,
  },
  git = { 
    enable = true,
    ignore = false,
  },
  renderer = {
    highlight_git = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
})
EOF

lua << EOF
require('nvim-treesitter.configs').setup({
  -- Install parser synchronously
  sync_install = false,

  -- Automatically install missing buffer
  auto_install = true,

  -- List of parsers to install
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "json",
    "lua",
    "vim",
    "markdown",
    "bash"
  },

  -- Enable features
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
  },

  fold = {
    enable = true,
  },
})
EOF

lua << EOF
require('lualine').setup({
  options = {
    component_separators = '|',
    section_separators = { left = '', right = '' },
    always_divide_middle = true,
    global_status = true
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },

  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'buffers'},
    lualine_y = {},
    lualine_z = {}
  },
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

" Folding nvim-treesitter
nnoremap <leader>z za
nnoremap <leader>Z zR
nnoremap <leader><S-z> zM

" Commentary (Ctrl+/)
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

inoremap <expr><S-Tab> pumvisible() ? "<C-p>" : "<C-h>"

" Select entire line (Ctrl+L)
nnoremap <silent> <C-l> :<C-u>normal! V<CR>
vnoremap <silent> <C-l> :<C-u>normal! j<CR>

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

" Buffer Navigation
nnoremap <silent> <C-PageDown> :bnext<CR>
nnoremap <silent> <C-PageUp> :bprevious<CR>
nnoremap <silent> <C-w> :Bdelete<CR>
nnoremap <leader>b :Telescope buffers<CR>

" Quick buffer switching
for i in range(1, 9)
  execute 'nnoremap <Leader>' . i . ' :' . i . 'b<CR>'
endfor

" File search
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-t> :enew<CR>

command! CmdList call ShowCmdList()

function! ShowCmdList()
  " Open a scratch buffer new
  setlocal buftype=nofile
  setlocal bufhidden=wipe
  setlocal noswapfile
  setlocal nobuflisted
  setlocal filetype=help

  call append(0, "=== Custom Keybindings Reference ===")
  call append(line('$'), "")
  call append(line('$'), "Note: <leader> is '\\' by default unless changed using 'let mapleader'")
  call append(line('$'), "To change it, e.g. let mapleader = \",\" (before any mappings)")
  call append(line('$'), "")
  call append(line('$'), "<leader>e            -> Toggle NvimTree")
  call append(line('$'), "<leader>f            -> Focus NvimTree")
  call append(line('$'), "<leader>z            -> Fold Toggle")
  call append(line('$'), "<leader>Z            -> Open All Toggle")
  call append(line('$'), "<leader><S-z>        -> Close All Folds")
  call append(line('$'), "<C-_> (Ctrl + /)     -> Toggle Command")
  call append(line('$'), "<C-l>                -> Select Entire Line")
  call append(line('$'), "<C-PageDown>         -> Go To Next Buffer")
  call append(line('$'), "<C-PageUp>           -> Go To Previous Buffer")
  call append(line('$'), "<C-w>                -> Close Buffer (Bdelete)")
  call append(line('$'), "<leader>b            -> Open Buffer List (Telescope)")
  call append(line('$'), "<C-p>                -> Find Files (Telescope)")
  call append(line('$'), "<C-t>                -> New File")
  call append(line('$'), "<C-Space>            -> Trigger CoC completion")
  call append(line('$'), "<CR> (Enter)         -> Confirm CoC completion")
  call append(line('$'), "<Tab>/<S-Tab>        -> Navigate completion popup")
endfunction

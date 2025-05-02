" this will install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo  ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', { 'do': 'npm install --no-package-lock' } " this is for autocomplete, prettier, and tslinting
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier'] " list of coc extensions needed
Plug 'jiangmiao/auto-pairs'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
call plug#end()

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

nnoremap <leader>e :NvimTreeToggle<CR>

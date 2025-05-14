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

let $CONFIG_PATH = stdpath('config') . './config'
execute 'source' $CONFIG_PATH . '/plugins.vim'
execute 'source' $CONFIG_PATH . '/theme.vim'
execute 'source' $CONFIG_PATH . '/settings.vim'
execute 'source' $CONFIG_PATH . '/keymaps.vim'

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

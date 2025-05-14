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

" Delete highlight search
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" === Vertical split with next buffer
nnoremap <leader>vn :vsplit<CR>:bnext<CR>
" === Horizontal split with next buffer
nnoremap <leader>sn :split<CR>:bnext<CR>
" Vertical split with previous buffer
nnoremap <leader>vp :vsplit<CR>:bprevious<CR>
" Horizontal splitt with previous buffer
nnoremap <leader>sp :split<CR>:bprevious<CR>

" === Navigation between split screen ===
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" === Resize split ===
nnoremap <leader><Left> :vertical resize -5<CR>
nnoremap <leader><Right> :vertical resize +5<CR>
nnoremap <leader><Down> :resize +2<CR>
nnoremap <leader><Up> :resize -2<CR>

" === Telescope buffer ===
nnoremap <leader>fb <cmd>Telescope buffer<CR>

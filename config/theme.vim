" Setup tokyonight theme
set termguicolors

lua << EOF
  vim.g.tokyonight_style = "storm"
  vim.cmd[[colorscheme tokyonight]]
EOF

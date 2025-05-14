" Nvim-Tree setup
lua << EOF
require('nvim-tree').setup({
  view = { 
    width = 30,
    number = false,
    relativenumber = false,
    side = "right"
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
    "go",
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

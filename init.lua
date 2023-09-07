-- Import configurations
vim.cmd([[
  source ~/.config/nvim/config/coc.vim
  source ~/.config/nvim/config/airline.vim
  source ~/.config/nvim/config/variables.vim
  source ~/.config/nvim/config/mappings.vim
  source ~/.config/nvim/config/fzf.vim
  source ~/.config/nvim/config/rooter.vim
  source ~/.config/nvim/config/conflict-marker.vim
  source ~/.config/nvim/config/suda.vim

  " Gruvbox
  " autocmd vimenter * ++nested colorscheme gruvbox
  " Faster
  set updatetime=100
  set termguicolors " this variable must be enabled for colors to be applied properly
  set statusline+=%F

  " Restore cursor when exiting Vim
  autocmd VimLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")
]])

-- Main configurations
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug('junegunn/fzf', { run = ':call fzf#install()' })
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug('neoclide/coc.nvim', { branch = 'release' })
Plug 'airblade/vim-gitgutter'
Plug 'https://github.com/rhysd/conflict-marker.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'github/copilot.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/tagbar'
Plug 'Soares/base16.nvim'
Plug 'xiyaowong/nvim-transparent'
Plug 'AckslD/nvim-neoclip.lua'
Plug 'lambdalisue/suda.vim'
Plug 'wellle/context.vim'
Plug 'chrisbra/csv.vim'
Plug('ojroques/vim-oscyank', { branch = 'main' })
Plug 'rust-lang/rust.vim'
Plug 'ianding1/leetcode.vim'
Plug 'echasnovski/mini.nvim'
Plug('akinsho/bufferline.nvim', { tag = '*' })
vim.call('plug#end')

vim.cmd([[
	colorscheme habamax " quiet royal peachpuff
  highlight Folded          cterm=bold ctermfg=10 ctermbg=17 guibg=Gray guifg=White
  highlight Folded          cterm=bold ctermfg=10 ctermbg=17 guibg=Gray guifg=White
  highlight MiniFilesNormal guibg=#555555
	highlight LineNr          guifg=#CCCCCC
  highlight Folded     cterm=bold ctermfg=10 ctermbg=17 guibg=Gray guifg=White
	let g:airline_theme='base16'
	let g:context_enabled = 0
]])

-- local bufferline = require('bufferline')
-- bufferline.setup {}
--  options = {
--    style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
--    themable = true,
--    numbers = "ordinal",
--    close_command = false, -- can be a string | function, | false see "Mouse actions"
--    right_mouse_command = false, -- can be a string | function | false, see "Mouse actions"
--    left_mouse_command = false, -- can be a string | function, | false see "Mouse actions"
--    middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
--    indicator = {
--      icon = '▎', -- this should be omitted if indicator style is not 'icon'
--      style = 'icon',
--    },
--    buffer_close_icon = '󰅖',
--    modified_icon = '●',
--    close_icon = '',
--    left_trunc_marker = '',
--    right_trunc_marker = '',
--    --- name_formatter can be used to change the buffer's label in the bufferline.
--    --- Please note some names can/will break the
--    --- bufferline so use this at your discretion knowing that it has
--    --- some limitations that will *NOT* be fixed.
--    --- name_formatter = function(buf)  -- buf contains:
--    -- name                | str        | the basename of the active file
--    -- path                | str        | the full path of the active file
--    -- bufnr (buffer only) | int        | the number of the active buffer
--    -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
--    -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
--    --- end,
--    max_name_length = 18,
--    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
--    truncate_names = true,  -- whether or not tab names should be truncated
--    tab_size = 18,
--    diagnostics = "coc",
--    diagnostics_update_in_insert = true,
--    -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
--    diagnostics_indicator = function(count)
--      return "(" .. count .. ")"
--    end,
--    color_icons = true,
--    get_element_icon = function(element)
--      local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
--      return icon, hl
--    end,
--    show_buffer_icons = true, -- disable filetype icons for buffers
--    show_buffer_close_icons = false,
--    show_close_icon = false,
--    show_tab_indicators = true,
--    show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
--    persist_buffer_sort = true,   -- whether or not custom sorted buffers should persist
--    move_wraps_at_ends = false,   -- whether or not the move command "wraps" at the first or last position
--    -- can also be a table containing 2 custom separators
--    -- [focused and unfocused]. eg: { '|', '|' }
--    separator_style = "slant",
--    enforce_regular_tabs = false,
--    always_show_bufferline = true,
--    sort_by = 'relative_directory'
--  }
--}

require('neoclip').setup()

require('mini.files').setup()

require("transparent").setup({
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  },
  extra_groups = {},   -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})

require('colorizer').setup()

require("nvim-web-devicons").setup({
  default = true
})
-- require("nvim-tree").setup({
--   respect_buf_cwd = true,
--   renderer = {
--     highlight_git = true,
--     indent_markers = { enable = false },
--     highlight_opened_files = "name",
--     root_folder_modifier = ':~',
--     add_trailing = true,
--     group_empty = false,
--     special_files = { 'README.md', 'Makefile', 'MAKEFILE' },
--     icons = {
--       padding = ' ',
--       symlink_arrow = ' -> ',
--       show = {
--         file = true,
--         folder = true,
--         git = true
--       },
--       glyphs = {
--         default = '',
--         symlink = '',
--         git = {
--           unstaged = "✗",
--           staged = "✓",
--           unmerged = "",
--           renamed = "➜",
--           untracked = "★",
--           deleted = "",
--           ignored = "◌"
--         },
--         folder = {
--           arrow_closed = "➙",
--           arrow_open = "➘",
--           default = "",
--           open = "",
--           empty = "",
--           empty_open = "",
--           symlink = "",
--           symlink_open = "",
--         }
--       }
--     }
--   }
-- })

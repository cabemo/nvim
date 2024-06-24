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

  " Organize golang imports
  autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
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
Plug('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
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
Plug('echasnovski/mini.nvim', { branch = 'stable' })
Plug('dccsillag/magma-nvim', { run = ':UpdateRemotePlugins' })
Plug 'nvim-lua/plenary.nvim'
Plug('epwalsh/obsidian.nvim', { tag = 'v2.9.0' })
Plug 'morhetz/gruvbox'
Plug 'rcarriga/nvim-notify'
Plug('epwalsh/pomo.nvim', { tag = '*' })
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'theHamsta/nvim-dap-virtual-text'
vim.call('plug#end')

vim.cmd([[
  autocmd vimenter * ++nested colorscheme gruvbox
  highlight Folded          cterm=bold ctermfg=10 ctermbg=17 guibg=Gray guifg=White
  highlight Folded          cterm=bold ctermfg=10 ctermbg=17 guibg=Gray guifg=White
  highlight MiniFilesNormal guibg=#555555
	" highlight LineNr          guifg=#CCCCCC
  highlight Folded     cterm=bold ctermfg=10 ctermbg=17 guibg=Gray guifg=White
	let g:airline_theme='gruvbox'
let g:context_enabled = 0
]])
-- Configure nvim-dap breakpoint icon
vim.fn.sign_define('DapBreakpointCondition', { text = 'ꭗ', texthl = '' })
-- vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '' })
vim.fn.sign_define('DapBreakpoint', { text = 'ꜿ', texthl = '' })
vim.keymap.set('n', '<Space>cb',
  function() require('dap').toggle_breakpoint(vim.fn.input('Condition: '), nil, 'Condition reached') end)
vim.keymap.set('n', '<Space>dm',
  function()
    require('dap').run({
      type = 'go',
      name = 'Debug test',
      request = 'launch',
      mode = 'test',
      program =
      '${workspaceFolder}/x/mayachain',
      buildFlags = { '-tags=mocknet' },
      testFlags = { '-check.f', vim.fn.input('Test Name: ') },
    })
  end)

require('dap-go').setup()

local dap = require('dap')
dap.set_log_level('TRACE')
dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = { 'dap', '-l', '127.0.0.1:${port}' },
  }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}",
    buildFlags = { '-tags=mocknet', '-check.f TestSwap' },
  },
  -- works with go.mod packages and sub packages
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "${workspaceFolder}/x/mayachain",
    buildFlags = { '-tags=mocknet' },
    testFlags = { ' -check.f TestSwap' },
  }
}

require('nvim-dap-virtual-text').setup({
  enabled = true,
  prefix = " ",
  highlight = "Comment",
  prefix_highlight = "Comment",
})

require('notify').setup({
  stages = "fade",
  timeout = 5000,
  background_colour = "#000000",
  text_colour = "#ffffff",
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})
require('pomo').setup({})

require('obsidian').setup({
  workspaces = {
    {
      name = "adversaria",
      path = "~/Documents/adversaria",
    },
  },
  follow_url_func = function(url)
    -- Open the URL in the default web browser.
    -- vim.fn.jobstart({"open", url})  -- Mac OS
    vim.fn.jobstart({ "xdg-open", url }) -- linux
  end,
})

require('neoclip').setup()

require('mini.files').setup({
  mappings = {
    go_in = 'L',
    go_in_plus = '',
    go_out = 'H',
    go_out_plus = '',
  }
})
require('mini.align').setup()

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



vim.opt.conceallevel = 1

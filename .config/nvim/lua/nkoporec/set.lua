vim.opt.guicursor = ""

vim.opt.errorbells = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.autoindent = true

vim.opt.cursorline = true

vim.opt.exrc = true;
vim.opt.secure = true;

vim.opt.backspace =[[indent,eol,start]];

vim.opt.mouse = a;

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Hide statusline
-- vim.opt.laststatus = 0
-- vim.opt.showmode = false

-- Dont highlight matching params.
vim.g.loaded_matchparen = false

-- Give more space for displaying messages.
-- vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

-- Show all completions
vim.opt.completeopt = menu,menuone,noselect

-- Fix cursor
vim.opt.guicursor="n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50"

-- Hardtime
-- vim.g.hardtime_default_on = 1

" My vim configuration
"
" This file contains the complete configuration for my daily driver vim
" configuration. It may or may not be useful for you as it's heavily tailored
" to how I want my vim to work.
"
" @NOTE: You need https://github.com/junegunn/vim-plug installed.
"
call plug#begin('~/.vim/plugged')

" Plugins {{{
" Define plugins.
call plug#begin('~/.vim/plugged')
" Defaults
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
" Git
Plug 'tpope/vim-fugitive'
" UI
Plug 'junegunn/fzf', {'do': './install --bin'}
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nacro90/numb.nvim'

Plug 'moll/vim-bbye'
Plug 'mhinz/vim-startify'
Plug 'neomake/neomake'
Plug 'thinca/vim-localrc'
Plug 'rktjmp/lush.nvim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'mbbill/undotree'
Plug 'nvim-treesitter/nvim-treesitter', {'branch': 'master', 'do': ':TSUpdate'}
Plug 'folke/lsp-colors.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'branch': 'master'}
Plug 'nvim-lua/popup.nvim'

" Language tooling
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'sheerun/vim-polyglot'
Plug 'puremourning/vimspector', {'branch': 'master'}
Plug 'sbdchd/neoformat'
Plug 'posva/vim-vue'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'github/copilot.vim'


call plug#end()
" }}}

" Config {{{
" Set the leader to ,
let mapleader = " "

" Set the encoding to UTF-8.
set encoding=utf-8

" Use the system clipboard.
set clipboard+=unnamed

" Set the length of the vim command history.
set history=1000

" Allow buffer switching without saving.
set hidden

" Allow cursor positioning one character past the end of the line.
set virtualedit=onemore

" Allow backspacing through indents, eol, and start of insert.
set backspace=indent,eol,start

" Enable incremental search.
set incsearch

" Highlight search results.
set hlsearch

" Enable case insensitive search.
set ignorecase

" Don't do things I didn't ask for...
set nowrap

" ...but indent my shit intelligently.
set autoindent

" Show matching brackets/parens
set showmatch

" Show list of possible completions instead of just completing.
set wildmenu

" Show problematic whitespace
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Undo behaviors
if has('persistent_undo')
	set undofile
	set undolevels=1000
	set undoreload=10000
endif

" Lines to scroll when the cursor leaves the screen.
set scrolljump=5

" Minimum visible lines to keep above or below the cursor.
set scrolloff=3

" Turn on line numbering.
" set number
" set nonumber
set number relativenumber

" Disable fold
set foldcolumn=0

" Use the last two lines for status.
set laststatus=2

" Highlight the cursor line.
set cul

" Show what mode vim is in.
set showmode

" Draw a vertical ruler for formatting assistance.
set colorcolumn=80

" Don't show the mode in the second status line. Airline takes care of
" that.
set noshowmode

" If a file has been changed outside of vim, automatically reload it.
set autoread

" For faster vim in terminal
set regexpengine=1
set noshowcmd
set ttimeoutlen=0
let loaded_matchparen=1 " Don't load matchit.vim (paren/bracket matching)
set noshowmatch         " Don't match parentheses/brackets
set nocursorcolumn      " Don't paint cursor column
set lazyredraw          " Wait to redraw
set scrolljump=8        " Scroll 8 lines at a time at bottom/top
let html_no_rendering=1 " Don't render italic, bold, links in HTML
set redrawtime=10000

" Set split behavior.
set splitright  " vsplit opens new window to the right
set splitbelow  " split opens new window below

" Git settings
set updatetime=100

" Always show the signcolumn. Otherwise, it would shift the text every
" time diagnostics appear/become resolved.
set signcolumn=yes

" Some language servers have issues with backup files, so turn them off.
set nobackup
set nowritebackup

" Enable project specific .virmc
set exrc
set secure

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Force tabs
set noexpandtab
set tabstop=4
set shiftwidth=4

" NERDTree
" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1
" let NERDTreeQuitOnOpen = 1
" let NERDTreeShowHidden=1
" let g:NERDTreeWinPos = "right"

" " NERDTree Toggle
" function MyNerdToggle()
" 	if &filetype == 'nerdtree'
" 		:NERDTreeToggle
" 	else
" 		:NERDTreeFind
" 	endif
" endfunction

" " Auto close NERDTree if only 1 window left
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Set coc bg sign colors to match colorscheme bg.
augroup myColors
	autocmd!
	"palenight
	autocmd ColorScheme * highlight SignColumn guibg=none

augroup END

" Better display for messages for CoC
set cmdheight=2

"Lint setup"
if has('statusline')
	set laststatus=2
	" Broken down into easily includeable segments
	set statusline=%<%f\ " Filename
	set statusline+=%w%h%m%r " Options
	set statusline+=%{fugitive#statusline()} " Git Hotness
	set statusline+=\ [%{&ff}/%Y] " filetype
	set statusline+=\ [%{getcwd()}] " current dir
	set statusline+=%#warningmsg#
	set statusline+=%*
	" set statusline+=%=%-14.(%l,%c%V%)\ %p% " Right aligned file nav info
endif

" Move swap,backup and undo files in a special directory, so it won't use the current directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Startify bookmarks
let g:startify_bookmarks = [
			\ '~/.vimrc',
			\ ]

" Gitgutter
" Make a lower sign priority
let g:gitgutter_sign_priority = 5

" CtrlSF
let g:ctrlsf_search_mode='async'
let g:ctrlsf_ignore_dir = ['bower_components', 'node_modules', 'vendor']
let g:ctrlsf_backend = 'rg'

" Drupal 
if has("autocmd")
	" Drupal *.module and *.install files.
	augroup module
		autocmd BufRead,BufNewFile *.module set filetype=php
		autocmd BufRead,BufNewFile *.install set filetype=php
		autocmd BufRead,BufNewFile *.test set filetype=php
		autocmd BufRead,BufNewFile *.inc set filetype=php
		autocmd BufRead,BufNewFile *.profile set filetype=php
		autocmd BufRead,BufNewFile *.view set filetype=php
	augroup END
endif

" Run Neomake on save.
function! RunAutoPHP()
	if &filetype == 'php'
		Neomake
	endif
endfunction

let g:neomake_logfile = '/tmp/neomake.log'

autocmd! BufWritePost * call RunAutoPHP()

" Neoformat
let g:neoformat_php_phpcbf = {
			\ 'exe': 'phpcbf',
			\ 'args': [
			\ '--standard=Drupal,DrupalPractice',
			\ '--extensions=php,module,inc,install,test,profile,theme,css,info,txt,md,yml',
			\ ],
			\ 'stdin': 1,
			\ 'valid_exit_codes': [0,1]
			\ }
let g:neoformat_enabled_php = ['phpcbf']
nnoremap <leader>nf :Neoformat<cr>

" Enable mouse support in terminal.
set mouse=a

" Avoid showing message extra message when using completion
set shortmess+=c

" Fix for mouse support in Alacritty.
if !has("nvim")
	set ttymouse=sgr
end

" Set insert cursor for terminal
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Optionally reset the cursor on start:
augroup myCmds
	au!
	autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Dark
syntax enable
set termguicolors
set background=dark
set t_Co=256
set t_ut=
let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox
highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl
highlight DiagnosticUnderlineWarn cterm=undercurl gui=undercurl
highlight DiagnosticUnderlineInfo cterm=undercurl gui=undercurl
highlight DiagnosticUnderlineHint cterm=undercurl gui=undercurl

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" gruvbox overrides.
highlight phpMethod guifg=#83a598
highlight phpIdentifier guifg=#ebdbb2
highlight phpRegion guifg=#8ec07c
" highlight phpFunction guifg=#83a598

" Transparant background
hi Normal guibg=NONE ctermbg=NONE

" Custom commands
com! W w
com! Q q

" FZF
" let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" -----------------------------------------------------------------------------
"  Project search
" -----------------------------------------------------------------------------

let g:project_search_command = 'rg --column --line-number --no-heading --color=always --smart-case --hidden -g !.git'
let g:global_search_command = 'rg --column --line-number --no-heading --color=always --smart-case --no-ignore -g !.git'

nnoremap <leader>/ :call Search(g:project_search_command.' --fixed-strings -- %s', 'Project search: ')<CR>
nnoremap <leader>// :call Search(g:project_search_command.' -- %s', 'Project search [r]: ')<CR>
nnoremap <leader>? :call Search(g:global_search_command.' --fixed-strings -- %s', 'Global search: ')<CR>
nnoremap <leader>?? :call Search(g:global_search_command.' -- %s', 'Global search [r]: ')<CR>

function! Search(base_search_command, search_prompt)
  let initial_search_command = printf(a:base_search_command, '')

  let reload_search_command = printf(a:base_search_command, '{q}')

  let spec = {'options': [
      \ '--disabled',
      \ '--prompt',
      \ a:search_prompt,
      \ '--bind',
      \ 'change:reload:'.reload_search_command.' || true',
      \ '--bind',
      \ 'ctrl-f:unbind(change)+change-prompt(Result filter: )+enable-search+clear-query',
      \ ]}

  call fzf#vim#grep(initial_search_command, 1, fzf#vim#with_preview(spec))
endfunction

" Telescope
lua <<EOF
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        -- etc
        ["<esc>"] = require("telescope.actions").close,
      },
      n = {
        -- etc
        ["<esc>"] = require("telescope.actions").close,
      },
    },
  }
}
EOF

" Use vim-devicons
let g:fzf_preview_use_dev_icons = 1

" Numb
lua <<EOF
require('numb').setup()
EOF

"nvimLSP
lua require'lspconfig'.intelephense.setup{autostart = true, filetypes = {"php", "module", "theme", "inc"}, settings = { intelephense = { files = { associations = { "*.module","*.inc","*.theme","*.php"}}}}}
lua require'lspconfig'.tsserver.setup{autostart = true }
lua require'lspconfig'.gopls.setup{autostart = true }
lua require'lspconfig'.cssls.setup{autostart = true }
lua require'lspconfig'.vuels.setup{autostart = true }
lua require'lspconfig'.svelte.setup{autostart = true }

"nvim compe
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Treesiter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    disable = {'php'},
    additional_vim_regex_highlighting = true,
  },
}
EOF

" LSP signature
lua <<EOF
require "lsp_signature".setup()
EOF

" }}}
"
" Keymap {{{

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Resize to full
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>* :vertical resize -5<CR>

" Disable ex mode.
nnoremap Q <nop>

" For wrapped lines,pj and k should navigate between rows, rather than lines.
nnoremap j gj
nnoremap k gk

" Closes a buffer without messing up windows, layouts, etc.
nnoremap <leader>c :Bdelete!<CR>

" Clear searches on ESC.
nnoremap <esc> :let @/ = ""<return><esc>

" Commentary
nnoremap <leader>) :Commentary<CR>
vnoremap <leader>) :Commentary<CR>

" Use fzf
" nnoremap <leader>f :Files<CR>
" nnoremap <leader>b :Buffers<CR>
" nnoremap <leader>h :History<CR>

" Use Telescope
nnoremap <Leader>f :Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR>
nnoremap <leader>s <cmd>Telescope live_grep<cr>
nnoremap <leader>F <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <Leader>g :lua require'telescope.builtin'.oldfiles()<CR>
nnoremap <Leader>D :lua require'telescope.builtin'.file_browser({ cwd = vim.fn.expand('%:p:h'),hidden=true})<CR>

" CtrlSF
nmap     <leader>sf <Plug>CtrlSFPrompt
nnoremap <leader>sg :<C-u>FzfPreviewProjectGrepRpc<Space>

"Startify
map <leader>e :Startify<CR>

" Duplicate line
nnoremap <leader>yy :t.<CR>

" " Copy to clipboard
nnoremap  Y  y$
vnoremap  y  "+y
nnoremap  y  "+y
nnoremap  yy  "+yy

" " Paste from clipboard
nnoremap p "+p
nnoremap P "+P

nnoremap dd "+dd
nnoremap DD "+DD

" nnoremap <leader>d :call MyNerdToggle()<CR>
nnoremap <leader>d :Ex<CR>

" Viminspector
nmap <F5> <Plug>VimspectorContinue
nmap <F6> :VimspectorReset<CR>
nmap <F7> <Plug>VimspectorPause
nmap <leader>@ <Plug>VimspectorToggleBreakpoint
nmap <leader>n <Plug>VimspectorStepOver
nmap <leader>N <Plug>VimspectorRunToCursor
nnoremap <leader>^ :call vimspector#ClearBreakpoints()<CR>

" Reset layout
nnoremap <Leader>o :%bd!\|e#\|bd!#<CR>
" Tabs
nnoremap <Leader>tc :tabclose<cr>

" Disable sounds
set noerrorbells
set novisualbell
set visualbell t_vb=

" Indent/Unindent with TAB
vmap <S-Tab>  mm<`m:<C-U>exec "normal ".&shiftwidth."h"<CR>mmgv`m
vmap <Tab>    mm>`m:<C-U>exec "normal ".&shiftwidth."l"<CR>mmgv`m

" Fix arrows navigation in terminal
nnoremap <silent> <ESC>^[A <Nop>
nnoremap <silent> <ESC>^[B <Nop>
nnoremap <silent> <ESC>^[D <Nop>
nnoremap <silent> <ESC>^[C <Nop>

" Git fugitive
nnoremap <leader>gs :<C-u>FzfPreviewGitStatusRpc<cr>
nnoremap <leader>ga :<C-u>FzfPreviewGitActionsRpc<CR>
nnoremap <leader>H :<C-u>FzfPreviewJumpsRpc<CR>

" Undo tree
nnoremap <leader>u :UndotreeShow<CR>

" Splits
nmap <silent> <leader>- :sp<CR>
nmap <silent> <leader>. :vsp<CR>

" Move between splits.
nmap <silent> <leader><Up> :wincmd k<CR>
nmap <silent> <leader><Down> :wincmd j<CR>
nmap <silent> <leader><Left> :wincmd h<CR>
nmap <silent> <leader><Right> :wincmd l<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" nvimLSP
nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>grr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>grn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>gh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>gsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Neovim terminal
tnoremap <Esc> <C-\><C-n>

" Auto wrap selected words into dd, console.log, log.fatal
vnoremap L yoconsole.log(<ESC>pa);<ESC>
vnoremap D yodd(<ESC>pa);<ESC>
vnoremap F yolog.Fatal(<ESC>pa)<ESC>

" Dispatch
" nnoremap <leader>D :Dispatch<Space>

"Resize
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader><Del> :vertical resize -5<CR>

" Move selected lines up/down.
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Move selected lines up/down.
nnoremap <leader>r :echo @%<CR>
" }}}

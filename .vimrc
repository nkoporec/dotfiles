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
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', {'do': './install --bin'}
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nacro90/numb.nvim'

Plug 'dyng/ctrlsf.vim'
Plug 'moll/vim-bbye'
Plug 'mhinz/vim-startify'
Plug 'neomake/neomake'
" Plug 'airblade/vim-rooter'
Plug 'thinca/vim-localrc'
" Plug 'arcticicestudio/nord-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'mbbill/undotree'
Plug 'vimlab/split-term.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'branch': 'master', 'do': ':TSUpdate'}

" Language tooling
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim', {'branch': 'master'}
Plug 'sheerun/vim-polyglot'
Plug 'puremourning/vimspector', {'branch': 'master'}
Plug 'arnaud-lb/vim-php-namespace'
Plug 'StanAngeloff/php.vim'
Plug 'sbdchd/neoformat'
Plug 'jiangmiao/auto-pairs'
" Plug 'fatih/vim-go'

call plug#end()
" }}}

" Config {{{
" Set the leader to ,
let mapleader = ","

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
set number

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
" set ttimeoutlen=5
set timeoutlen=1000
set ttimeoutlen=0
let loaded_matchparen=1 " Don't load matchit.vim (paren/bracket matching)
set noshowmatch         " Don't match parentheses/brackets
" set nocursorline
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

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1

" Auto close NERDTree if only 1 window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Set coc bg sign colors to match colorscheme bg.
augroup myColors
	autocmd!
	"palenight
	autocmd ColorScheme * highlight SignColumn guibg=none

augroup END

" Better display for messages for CoC
set cmdheight=2

" Gui vim settings
if has('gui_running')
	" No toolbar
	set guioptions-=T  " no toolbar
	set nomousehide
	
	" For terminal user.
	let $USER = "nkoporec"
endif

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


" This is a fix to correct the $PATH variable inside vim
if $PATH !~ "\.composer"
	let $PATH ="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/Library/Apple/bin:/Users/nkoporec/.composer/vendor/bin:/Users/nkoporec/go/bin:" . $PATH
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

" NERDTree
let NERDTreeShowHidden=1

" CtrlSF
let g:ctrlsf_search_mode='sync'

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
" Autoformat on save.
" augroup fmt
" 	autocmd!
" 	autocmd BufWritePre * undojoin | Neoformat
" augroup END


" Prettier
" let g:prettier#autoformat = 1
" let g:prettier#autoformat_require_pragma = 0

" SplitTerm settings
let g:split_term_default_shell = "zsh"

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

" for vim 8
if (has("termguicolors"))
	set termguicolors
endif
if !has("gui_running")
	set t_Co=256
	if !has("nvim")
		set term=screen-256color
	end
endif

" Dark
syntax enable
set termguicolors
let &t_8f = "\e[38;2;%lu;%lu;%lum"
let &t_8b = "\e[48;2;%lu;%lu;%lum"
set background=dark
set t_Co=256
syntax on
colorscheme palenight

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Normal guibg=none
highlight NonText guibg=none

let g:enable_bold_font = 1
let g:enable_italic_font = 1
let g:nord_uniform_status_lines = 0

" Custom commands
com! W w
com! Q q

" FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
" Use vim-devicons
let g:fzf_preview_use_dev_icons = 1
" }}}
"
" Keymap {{{

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Resize to full
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>' :vertical resize -5<CR>

" Disable ex mode.
nnoremap Q <nop>

" For wrapped lines,pj and k should navigate between rows, rather than lines.
nnoremap j gj
nnoremap k gk

" Closes a buffer without messing up windows, layouts, etc.
nnoremap <leader>q :Bdelete<CR>

" Clear searches on ESC.
nnoremap <esc> :let @/ = ""<return><esc>

" Commentary
nnoremap <leader>7 :Commentary<CR>
vnoremap <leader>7 :Commentary<CR>

" Use fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

nnoremap <leader>h :History<CR>


" Telescope
" nnoremap <leader>F <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>B <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>d <cmd>lua require('telescope.builtin').file_browser()<cr>

" CtrlSF
nmap     <leader>S <Plug>CtrlSFPrompt
nnoremap <leader>s :<C-u>FzfPreviewProjectGrepRpc<Space>

"Startify
map <leader>e :Startify<CR>

" Duplicate line
nnoremap <leader>yy :t.<CR>

"nvimLSP
" let g:completion_enable_snippet = 'snippets.nvim'
" set iskeyword=@,48-57,_,192-255,$
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" let g:completion_trigger_character = ['.', '::', '$', '>', ':', '\\', '/', '*', '<']
" " let g:completion_timer_cycle = 30
" lua require'nvim_lsp'.intelephense.setup{on_attach=require'completion'.on_attach, filetypes = {"php", "module", "theme", "inc"}, settings = { intelephense = { files = { associations = { "*.module","*.inc","*.theme","*.php"}}}}}
" lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }
" lua require'nvim_lsp'.gopls.setup{ on_attach=require'completion'.on_attach }
" lua require'nvim_lsp'.cssls.setup{ on_attach=require'completion'.on_attach }

" Numb
lua <<EOF
require('numb').setup()
EOF

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" " Copy to clipboard
vnoremap  y  "+y
nnoremap  Y  "+yg_
nnoremap  y  "+y
nnoremap  yy  "+yy

" " Paste from clipboard
nnoremap p "+p
nnoremap P "+P
vnoremap p "+p
vnoremap P "+P

if has("gui_vimr")
	set number
endif

" TreeSitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
highlight = {
enable = true,
disable = { "php",},
},
indent = {
enable = true
},
incremental_selection = {
enable = false,
keymaps = {
init_selection = "gnn",
node_incremental = "grn",
scope_incremental = "grc",
node_decremental = "grm",
},
},
}
EOF

" NERDTree Toggle
function MyNerdToggle()
	if &filetype == 'nerdtree'
		:NERDTreeToggle
	else
		:NERDTreeFind
	endif
endfunction

nnoremap <leader>D :call MyNerdToggle()<CR>

" Viminspector
nmap <F5> <Plug>VimspectorContinue
nmap <F6> :VimspectorReset<CR>
nmap <F7> <Plug>VimspectorPause
nmap <leader>B <Plug>VimspectorToggleBreakpoint
nmap <leader>n <Plug>VimspectorStepOver
nmap <leader>N <Plug>VimspectorRunToCursor
nnoremap <leader>cb :call vimspector#ClearBreakpoints()<CR>

" Reset layout
nnoremap <Leader>o :only<CR>
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

" coc.nvim
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nnoremap <silent><nowait> <leader>T  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <leader>fs  :<C-u>CocList -I symbols<cr>

" Formatting selected code.
" Apply AutoFix to problem on the current line.
nmap <leader>lf  <Plug>(coc-fix-current)
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

""to make coc.nvim format your code on <cr>:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" exit :term with ESC
tnoremap <leader><Esc> <C-\><C-n>:q!<CR>

" nvimLSP
" nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
" nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
" nnoremap <leader>gsh :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <leader>grr :lua vim.lsp.buf.references()<CR>
" nnoremap <leader>grn :lua vim.lsp.buf.rename()<CR>
" nnoremap <leader>gh :lua vim.lsp.buf.hover()<CR>
" nnoremap <leader>gca :lua vim.lsp.buf.code_action()<CR>
" nnoremap <leader>gsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Neovim terminal
" tnoremap <Esc> <C-\><C-n>
tnoremap <leader><Esc> <Esc>
nnoremap <leader>t :exec 'split' <Bar> resize 10 <Bar> terminal<CR>

tnoremap <leader><Up> <c-\><c-n><c-w>h
tnoremap <leader><Down> <c-\><c-n><c-w>j
tnoremap <leader><Left> <c-\><c-n><c-w>k
tnoremap <leader><Right> <c-\><c-n><c-w>l
tnoremap <leader>h <c-\><c-n><c-w>h
tnoremap <leader>j <c-\><c-n><c-w>j
tnoremap <leader>k <c-\><c-n><c-w>k
tnoremap <leader>l <c-\><c-n><c-w>l
" }}}

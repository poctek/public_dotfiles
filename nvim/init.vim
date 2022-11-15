call plug#begin('~/.vim/plugged')

" function! DoRemote(arg)
"   UpdateRemotePlugins
" endfunction

Plug 'gruvbox-community/gruvbox'

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" vim-cmp completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Status line
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" Languages support
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot'
Plug 'janko/vim-test'
Plug 'w0rp/ale'

" Blockchain
Plug 'tomlion/vim-solidity'
Plug 'poctek/vim-scilla'

" Git
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-fugitive'
Plug 'mattn/vim-gist'
Plug 'rhysd/committia.vim'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-endwise'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'wellle/targets.vim'
Plug 'rhysd/clever-f.vim'
Plug 'ThePrimeagen/harpoon'
Plug 'kana/vim-textobj-user'
Plug 'mileszs/ack.vim'

" Formatting
Plug 'machakann/vim-highlightedyank'
Plug 'jiangmiao/auto-pairs'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'godlygeek/tabular'

call plug#end()
set completeopt=menu,menuone,noselect
lua require("telescope_config")
lua require("luasnip_config")
lua require("cmp_config")

" Colorscheme
colorscheme gruvbox
set background=dark
syntax enable
" colorscheme solarized

filetype plugin indent on
set t_Co=256
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set number
set nocompatible

filetype plugin indent on

au FocusLost User :wa

"  General
set relativenumber
set linebreak
set showbreak=+++
set textwidth=100
set showmatch " Highlight matching brace
set visualbell  " Use visual bell (no beeping
set hidden
set nobackup
set noswapfile
set scrolloff=3
set regexpengine=0 " Old-style regex highlighting

set hlsearch  " Highlight all search results
set smartcase " Enable smart-case search
set ignorecase  " Always case-insensitive
set incsearch " Searches for strings incrementally

set autoindent  " Auto-indent new lines
set smartindent " Enable smart-indent
set expandtab
set tabstop=2 " Number of spaces per Tab
set shiftwidth=2  " Number of auto-indent spaces
set mouse-=a

set nopaste

" Advanced
set ruler " Show row and column ruler information
set inccommand=split
:set hls! " Toggle highlighting after the search

set autowriteall  " Auto-write all file changes

set undolevels=1000 " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
set showcmd

set timeoutlen=1000
set ttimeoutlen=0

" More symbols on the line
set tw=500

" Show dots with indents
set list listchars=tab:\ \ ,trail:·

" Highlight current column
set cuc cul"
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif

" Wipe the registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" No sessions autosave
let g:session_autosave = 'no'

" path to python interpreter
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python3'
let g:python3_host_prog='/usr/local/bin/python3'

" Narrow window
let g:nrrw_rgn_vert = 1

" Crontab settings
autocmd filetype crontab setlocal nobackup nowritebackup


" ==== MAPPINGS ====
" Remove arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Splits navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tabs
nnoremap TN :tabnew<CR>
nnoremap TQ :tabclose<CR>
nnoremap TE :tabe %<CR>
nnoremap TO <C-w>T

nnoremap RS :set syntax=ruby<CR>
nnoremap RB :! nohup rubocop -a % &<CR><CR>
nnoremap FC :! cat % \| pbcopy &<CR><CR>

" Remap escape to jj
inoremap jj <ESC>
inoremap оо оо

" Search visual selection
vnoremap // y/<C-R>"<CR>

" Swap lines
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

nnoremap _ :m .-2<CR>==
nnoremap - :m .+1<CR>==

" Use : instead of ;
nmap ; :

" \\ to navigate last to open files
nnoremap <leader><leader> <c-^>

nnoremap <Leader>q :CloseOtherBuffers<CR>
" Copy current file path to the system buffer
nmap cp :let @* = expand("%")<CR>
" Copy current line to system buffer
nmap <leader>Y "*yy

" Yank to the end of line by Y
nnoremap Y y$

" Keep the window centered
nnoremap n nzzzv
nnoremap N Nzzzv

" Cool remap to rename files
nnoremap cn *``cgn
nnoremap cN *``cgN

" ==== PLUGINS ====
" Lightline
let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }
let g:lightline.active = {
      \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
      \            [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'fileformat', 'fileencoding', 'filetype'] ] }

" Deoplete config
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Ack.vim config
let g:ackprg = 'ag --nogroup --nocolor --column'

" Not jump to the first result with search
cnoreabbrev ag Ack!
nnoremap <Leader>a :Ack!<Space>

" NERDTree
let NERDTreeShowHidden=1 " Show hidden files in NerdTree
let NERDTreeCascadeSingleChildDir=0 " Remove one-child dirs collapsing
" NerdTree UI
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
map <C-n> :NERDTreeToggle<CR>
map ,n :NERDTreeFind<CR>

" Ale settings
let g:ale_lint_on_text_changed = 'never'
let g:ale_fixers = { 'ruby': ['rubocop'], 'js': ['eslint'], 'typescript': ['eslint'], '*': ['remove_trailing_lines', 'trim_whitespace'] }
" let g:ale_linters = { 'go': ['golangci-lint'] }
let g:ale_fix_on_save = 1
let g:ale_ruby_rubocop_executable = 'bundle'
nmap <silent> <Leader>k <Plug>(ale_previous_wrap_error)
nmap <silent> <Leader>j <Plug>(ale_next_wrap_error)
autocmd FileType scilla let b:ale_linters = ['checker']

" vim-test mappings
" map <Leader>l :TestLast<CR>
map <Leader>l :call RunCustomSpec('TestLast')<CR>
map <Leader>s :call RunCustomSpec('TestNearest')<CR>
map <Leader>f :call RunCustomSpec('TestFile')<CR>
let test#strategy = "neovim"

" Vim-go
let g:go_decls_includes = "func,type"
" let g:go_auto_type_info = 1
let g:go_auto_sameids = 0
let g:go_highlight_function_calls = 1
" let let g:go_auto_type_info = 1
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>d <Plug>(go-doc)

" Scilla
let g:ale_scilla_checker_libdir='/usr/local/lib/scilla/stdlib'
let g:ale_scilla_checker_executable='/usr/local/bin/scilla-checker'

" Vim-gist
let g:gist_post_private = 1
let g:gist_token = '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'

" Vim-cmp
autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
set completeopt=menu,menuone,noselect

" Telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nmap <leader>gb :lua require('telescope.builtin').git_branches()<CR>

" Harpoon
nmap <leader>m :lua require('harpoon.mark').add_file()<CR>
nmap <leader>h :lua require("harpoon.ui").toggle_quick_menu()<CR>

" ==== FUNCTIONS ====
" Parent dir/subdir navigation for running different gems specs
function! CdToSpecDir()
  let spec_index = index(split(expand("%:p"), "/"), "spec")
  let target_index = spec_index - 1
  let path = "/" . join(split(expand('%:p'), "/")[0:target_index], "/")

  execute 'lcd' fnameescape(path)
  pwd
endfunction

function! CdToParentDir()
  lcd ../
  pwd
endfunction

function! RunCustomSpec(command)
  call CdToSpecDir()
  execute(a:command)
endfunction

nmap <leader>w :call CdToSpecDir()<CR>
nmap <leader>e :call CdToParentDir()<CR>

" Lexy call to open spec file for current class
function! SpecFileFor(path)
  let cmd = "lexy find_spec_file " . a:path . " 2> /dev/null"
  let spec_file = system(cmd)

  execute("e " . spec_file)
endfunction

nmap SF :call SpecFileFor(expand("%:p"))<CR>

function! AgUnderCursor()
  let cmd = 'Ack! ' . expand('<cword>')

  execute(cmd)
endfunction
nmap <leader>g :call AgUnderCursor()<CR>

function! ContainerKey()
  let path = split(expand('%'), '\.')[0]
  let container_path = split(path, '\/')[2:-1]
  let key = join(container_path, ".")

  let @* = key
endfunction
nmap cK :call ContainerKey()<CR>

" centers the current pane as the middle 2 of 4 imaginary columns
" should be called in a window with a single pane
 function CenterPane()
   lefta vnew
   wincmd w
   exec 'vertical resize '. string(&columns * 0.66)
 endfunction

nnoremap <leader>c :call CenterPane()<cr>

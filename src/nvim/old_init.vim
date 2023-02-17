let vim_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(vim_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.vim_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" MUST BE THERE (Requirments of vim-polyglot)
let g:polyglot_disabled = ['typescript', 'golang']

"=======================
" Plugins
"=======================
call plug#begin('~/.vim/plugged')
  " fuzzy searcher
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '~/.fzf/install --all' } " install fzf
  Plug 'junegunn/fzf.vim' " apply fzf

  Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'} " GoLang
  Plug 'leafgarland/typescript-vim' " Typescript

  Plug 'sheerun/vim-polyglot' " language syntax packs
  Plug 'editorconfig/editorconfig-vim' " hook .editorconfig

  Plug 'chriskempson/base16-vim' " pretty cool color scheme for vim and terminal
  Plug 'itchyny/lightline.vim' " bottom line

  Plug 'scrooloose/nerdtree' " look file system in vim
  Plug 'tpope/vim-surround' " surround text specified chars
  Plug 'xuyuanp/nerdtree-git-plugin' " git flags for nerdtree
  Plug 'tpope/vim-fugitive' " git
  Plug 'tpope/vim-commentary' "comment lines

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jiangmiao/auto-pairs'

  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'maxmellon/vim-jsx-pretty'

  Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

  " Requires nodejs and yarn
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()

"=======================
" General
"=======================
set noswapfile " don't create swap files
set expandtab " tab -> space
set tabstop=4
set shiftwidth=4
set shiftround " round indention to n*spaces
set smarttab
set list " use list of chars below
set listchars=trail:·,space:·,extends:#,nbsp:␣,tab:·· " list of chars, that will be replaced
set relativenumber " use relative numbers at left
set nu " use absolute numbers at current position
set encoding=utf-8
set ruler " show cursor position always
set title " change terminal title

" Restore last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" GoLang tabs
autocmd Filetype go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

" TS, JS tabs
autocmd Filetype typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

"disable bells
set noerrorbells
set vb t_vb=

" search
set incsearch " highlight pattern which matches typped
set hlsearch " highlight syntax
set ignorecase
set smartcase " switch to case-sensitive when query contains uppercase letter

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" text rendering
set linebreak " avoid wrapping a line in the middle of a word
set scrolloff=5 " numbers of screen lines to keep above and below the cursor
set wrap " wrap lines

" Show hidden files NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore = [ '\.git$' ]

"=======================
" Theme
"=======================
let base16colorspace=256 " Access colors present in 256 colorspace

" base16-shell (https://github.com/chriskempson/base16-shell)
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" for dark themes (like base16_default-dark)
" @see help http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
highlight LineNr cterm=NONE ctermbg=black ctermfg=240 guibg=NONE guifg=black
highlight CursorLineNr cterm=NONE ctermbg=black ctermfg=240 guibg=NONE guifg=black
highlight VertSplit ctermbg=NONE guibg=NONE ctermfg=black

" Bottom line
set laststatus=2 " always display status (bottom line)
set noshowmode " don't show current (insert, visual) mode in lower panel

let g:lightline = {
  \ 'colorscheme': 'Tomorrow_Night',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]]
  \ },
  \ }

" full path
let g:lightline.component_function = {
  \  'filename' : 'LightlineFilename',
  \  'cocstatus': 'coc#status'
  \  }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" register components for usage lightline-ale plugin
let g:lightline.component_expand = {
  \  'linter_checking': 'lightline#ale#checking',
  \  'linter_warnings': 'lightline#ale#warnings',
  \  'linter_errors': 'lightline#ale#errors',
  \  'linter_ok': 'lightline#ale#ok',
  \ }

" set color for lightline-ale components
let g:lightline.component_type = {
  \  'linter_checking': 'left',
  \  'linter_warnings': 'warning',
  \  'linter_errors': 'error',
  \  'linter_ok': 'left',
  \ }

"=======================
" Syntax highlighting
"=======================
syntax on

" vim-go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

"=======================
" Linter
"=======================
" vim-go
let g:go_metalinter_command = 'golangci-lint'
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = []
let g:go_metalinter_autosave_enabled = []

let g:go_jump_to_error = 0

" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
let g:go_def_mapping_enabled=0
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 0

autocmd Filetype go set autowrite

"=======================
" Format
"=======================
" Automatically format frontend files with prettier after file save
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Disable quickfix window for prettier
let g:prettier#quickfix_enabled = 0

"=======================
" Completition
"=======================
" Coc configs
let g:coc_global_extensions = ['coc-tsserver', 'coc-json']

"=======================
" Mappings
"=======================
let mapleader = ","

" Keymap Coc
nmap <leader>ac  <Plug>(coc-codeaction-selected)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

map <Leader>k :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Close current buffer
nmap <leader>qq :bd<CR>
nmap <leader>qa :bufdo bd<CR>
" Don't jump througth the line (for wrapped word)
noremap j gj
noremap k gk
" Use j and k on expression (like dj)
onoremap j j
onoremap k k
" Moving lines
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" Remove Highlight
map <leader>rh :nohl<CR>

" fzf
nnoremap <C-t> :Files<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" copy to clickboard buffer
if system('uname -s') == "Darwin\n"
	set clipboard=unnamed " OSX
else
	set clipboard=unnamedplus " enable coping (nvim)
endif
vnoremap <C-c> "*y

" change horizontal split
nmap = <C-w>>
nmap + <C-w><

" change horizontal split
nmap - <C-w>+
nmap _ <C-w>-

" switch NERDTree
map <C-n> :NERDTreeToggle<CR>

imap <C-j> <C-p>

" open NERDTree on current file on CWD
map <Leader>n :NERDTreeFind<CR>

" Completion map
" autocmd FileType go map <buffer> <leader>c <C-x><C-o><CR> " does not work


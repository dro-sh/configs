" automatically load vim-plug
"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

" automatically load vim-plug for nvim
"if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
"   silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall
"    autocmd VimEnter * qall
"endif

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
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '~/.fzf/install --all' } " install fzf
  Plug 'junegunn/fzf.vim' " apply fzf

  Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

  Plug 'chriskempson/base16-vim' " pretty cool color scheme for vim and terminal

  Plug 'sheerun/vim-polyglot' " language packs
  Plug 'leafgarland/typescript-vim' " especially for typestript
  Plug 'peitalin/vim-jsx-typescript' " especially for typestript

  Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocompliter

  Plug 'editorconfig/editorconfig-vim' " hook .editorconfig

  Plug 'itchyny/lightline.vim' " bottom line
  Plug 'maximbaz/lightline-ale' " integration lightline and ale

  Plug 'w0rp/ale' " async lint engine

  Plug 'tpope/vim-eunuch' " add commands form unix (Go to https://github.com/tpope/vim-eunuch)

  Plug 'tpope/vim-surround' " surround text specified chars

  Plug 'kenn7/vim-arsync' " sync remote with dev-server

  Plug 'scrooloose/nerdtree' " look file system in vim
  Plug 'xuyuanp/nerdtree-git-plugin' " git flags for nerdtree

  " Requires prettier that installed globally (npm install -g prettier)
  " use <Leader>p to apply prettier in opened file in buffer/tab
  "Plug 'prettier/vim-prettier', {
  "  \ 'do': 'npm install',
  "  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

  Plug 'tpope/vim-fugitive' " git

  Plug 'tpope/vim-commentary' "comment lines

  " Requires nodejs and yarn
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

  " CompleteMe/install.py --clang-completer --ts-completer
  "Plug 'ycm-core/YouCompleteMe', { 'do': '~/.install.py --clang-completer' }
  "Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' } " generator config for YCM

call plug#end()

"=======================
" General
"=======================
set noswapfile " don't create swap files
"set expandtab " tab -> space
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
"set formatoptions+=j " do not know what it do

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

" (coc) TextEdit might fail if hidden is not set.
set hidden

" (coc) Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"=======================
" Theme
"=======================
let base16colorspace=256 " Access colors present in 256 colorspace

" vim-fugitive (opens :Gdiff as vertical splits instead of horizontal)
" set diffopt+=vertical

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

" Corce lightline update on change CoC
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

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

" add lightline-ale components to the right side of line
"let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

"=======================
" Syntax highlighting
"=======================
syntax on

" tsx
hi tsxTypeBraces guifg=#999999
hi tsxTypes guifg=#666666
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66

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
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['']
  \ }

let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['prettier'],
  \ 'scss': ['prettier'],
  \ 'html': ['prettier']
  \}

highlight ALEWarning ctermbg=none cterm=underline
highlight ALEError ctermbg=none cterm=underline

" vim-go
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []
let g:go_jump_to_error = 0

"=======================
" Completition
"=======================
"let g:ycm_global_ycm_extra_conf = '~/.vim/ycm-config/.ycm_extra_conf_cpp.py' " ycm config for c++
let g:coc_global_extensions = ['coc-pairs', 'coc-tsserver' ]

" If prettier is in project
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" If eslint installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" (coc)
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_def_mapping_enabled=0
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 0

"=======================
" Mapkeys
"=======================
let mapleader = ","

" Don't jump througth the line (for wrapped word)
noremap j gj
noremap k gk
" Use j and k on expression (like dj)
onoremap j j
onoremap k k

" Remove Highlight
map <leader>rh :nohl<CR>

" Ctrl-t Fuzzy search (fzf)
nnoremap <C-t> :Files<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


" copy to clickboard buffer
set clipboard=unnamedplus " enable coping (nvim)
vnoremap <C-c> "*y

" change horizontal split
nmap = <C-w>>
nmap + <C-w><

" change horizontal split
nmap - <C-w>>
nmap _ <C-w><

" switch NERDTree
map <C-n> :NERDTreeToggle<CR>

" open NERDTree on current file on CWD
map <Leader>n :NERDTreeFind<CR>

" sync to remote server
map <Leader>rs :ARsyncUp<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

" GoTo code navigation.
nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


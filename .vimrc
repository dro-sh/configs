" To do: ale (watch docs)
"        ligthline (linter and information (command, line, file ext))

" automatically load vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"=======================
" Plugins
"=======================
call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '.install --all' } " install fzf
  Plug 'junegunn/fzf.vim' " apply fzf

  Plug 'chriskempson/base16-vim' " pretty cool color scheme for vim and terminal

  Plug 'sheerun/vim-polyglot' " language packs
  Plug 'leafgarland/typescript-vim' " vim parse ts as xml

  Plug 'editorconfig/editorconfig-vim' " hook .editorconfig

  Plug 'itchyny/lightline.vim' " bottom line

  Plug 'w0rp/ale' " async lint engine

  Plug 'maximbaz/lightline-ale' " integration lightline and ale

  Plug 'tpope/vim-eunuch' " add commands form unix (Go to https://github.com/tpope/vim-eunuch)

  Plug 'tpope/vim-surround' " surround text specified chars

  Plug 'scrooloose/nerdtree' " look file system in vim
  Plug 'xuyuanp/nerdtree-git-plugin' " git flags for nerdtree

  Plug 'tpope/vim-fugitive' " git

  " CompleteMe/install.py --clang-completer --ts-completer
  "Plug 'ycm-core/YouCompleteMe', { 'do': '~/.install.py --clang-completer' }
  "Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' } " generator config for YCM

call plug#end()

"=======================
" General
"=======================
set noswapfile " don't create swap files
set expandtab " tab -> space
set tabstop=4
set shiftwidth=4
set shiftround " round indention to n*spaces
set list " use list of chars below
set listchars=trail:·,space:·,extends:#,nbsp:␣ " list of chars, that will be replaced
set relativenumber " use relative numbers at left
set nu " use absolute numbers at current position
set encoding=utf-8
set ruler
set title
set formatoptions+=j
"disable bells
set noerrorbells
set vb t_vb=

" search
set incsearch " highlight pattern which matches typped
set hlsearch " highlight syntax
set ignorecase
set smartcase " switch to case-sensitive when query contains uppercase letter

" text rendering
set linebreak " avoid wrapping a line in the middle of a word
set scrolloff=5 " numbers of screen lines to keep above and below the cursor
set wrap " wrap lines

"=======================
" Theme
"=======================
let base16colorspace=256 " Access colors present in 256 colorspace

" vim-fugitive (opens :Gdiff as vertical splits instead of horizontal)
set diffopt+=vertical

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
set noshowmode " don't show current (insert, visual) mode

let g:lightline = {
  \ 'colorscheme': 'Tomorrow_Night',
  \ }

" full path
let g:lightline.component_function = {
  \  'filename' : 'LightlineFilename',
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

" add lightline-ale components to the right side of line
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

"=======================
" Syntax highlighting
"=======================
syntax on
let g:polyglot_disabled = ['typescript']

"=======================
" Linter
"=======================
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ }

highlight ALEWarning ctermbg=none cterm=underline
highlight ALEError ctermbg=none cterm=underline

"=======================
" Completition
"=======================
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm-config/.ycm_extra_conf_cpp.py' " ycm config for c++

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

" Ctrl-t Fuzzy search
nnoremap <C-t> :Files<CR>

" copy to clickboard buffer
vnoremap <C-c> "*y

" change horizontal split
nmap = <C-w>>
nmap + <C-w><

" change horizontal split
nmap - <C-w>>
nmap _ <C-w><

" open NERDTree
map <C-n> :NERDTreeToggle<CR>


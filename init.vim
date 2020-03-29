" My neovim configuration
" Plugins {{{
call plug#begin()
Plug 'Shougo/deoplete.nvim'                             " Autocompletion engine
" Plug 'ncm2/ncm2' " Alternative autocompletion
Plug 'dense-analysis/ale'                                              " Linter
Plug 'scrooloose/nerdtree'                                       " File browser
Plug 'jistr/vim-nerdtree-tabs'                              " tabs for nerdtree
Plug 'autozimu/LanguageClient-neovim', {'branch':'next','do':'bash install.sh'}
Plug 'junegunn/fzf'                                  " Multi entry selection UI
Plug 'editorconfig/editorconfig-vim'                            " Editor Config
Plug 'vim-airline/vim-airline'                              " Fancy status line
Plug 'vim-airline/vim-airline-themes'            " Themes for fancy status line
Plug 'mhinz/vim-startify'                          " Fancy start screen for vim
Plug 'airblade/vim-gitgutter'                               " git tools for vim
Plug 'nathanaelkane/vim-indent-guides'        " visually displays indent levels
Plug 'godlygeek/tabular'               " eg. select lines and do :Tabularize /=
call plug#end()
" }}}
" UI {{{
set nocompatible                         " disable compatibility to old-time vi
set foldmethod=marker                                     " selects fold method 
set showmatch                                         " show matching brackets.
set ignorecase                                      " case insensitive matching
" set mouse=v                                   " middle-click paste with mouse
set mouse=a                              " mouse selection without line numbers
set hlsearch                                         " highlight search results
set tabstop=4                   " number of columns occupied by a tab character
set softtabstop=4                             " see multiple spaces as tabstops
set expandtab                                    " converts tabs to white space
set shiftwidth=4                                        " width for autoindents
set autoindent       " indent a new line the same amount as the line just typed
set number                                                   " add line numbers
set wildmode=longest,list                       " get bash-like tab completions
set cc=80                       " set an 80 column border for good coding style
set clipboard+=unnamedplus                        " enable copying to clipboard
filetype plugin indent on        " allows auto-indenting depending on file type
syntax on                                                 " syntax highlighting
colorscheme default
let g:mapleader=','                                        " set the leader key
let g:localmapleader = "\<Space>"
" }}}
" Autocompletion {{{
let g:deoplete#enable_at_startup=1
" }}}
" NERDTree {{{
let NERDTreeDirArrows=1                         " Use + - chars for directories
let NERDTreeMinimalUI=1                        " Remove excess information bars
let NERDTreeShowBookmarks=1                                    " Show Bookmarks
" let g:nerdtree_tabs_open_on_console_startup=1
" }}}
" Ale - Asyncrhonous Lint Engine {{{
let g:ale_fixers = {'python': ['autopep8'], 'c': ['clang-format'], 'c++': ['clang-format']}
" }}}
" Powerline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts=1
let g:airline_theme='wombat'
" }}}
" Startify {{{
  let g:startify_bookmarks = [ '~/.config/nvim/init.vim', '~/.zshrc', '~/.aliases' ]                                         
  let g:startify_session_detection=1     " Show current folder session file at top
  let g:startify_relative_path =1                            " Show relative paths
  let g:startify_change_to_dir=0         " Change to file's directory when opening
  let g:startify_files_number=10                         " Number of files to show
  let g:startify_list_order = [
    \ ['   Bookmarks:'], 'bookmarks',
    \ ['   Recent Files:'], 'files' ]
" }}}
" Indent Guides {{{
let g:indent_guides_enable_on_vim_startup = 1
" }}}
" Mappings {{{
nnoremap <leader>s :set invspell<CR>                     " Toggle spell checker
nnoremap <space> za                                    " toggle fold with space
nnoremap <leader>l :set invnumber<CR>                     " toggle line numbers
nnoremap <leader>n :NERDTreeToggle<CR>                        " Toggle NERDTree
nnoremap <leader>v :so $MYVIMRC<CR>                              " Reload vimrc
nnoremap <leader>w :set wrap!<CR>                            " Toggle line wrap
"nnoremap <leader>y "*y                                   " copy from clipboard
"nnoremap <leader>p "*p                                  " paste from clipboard
" disable arrow keys
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
" }}}

" My neovim configuration
" Plugins {{{
call plug#begin()
Plug 'JamshedVesuna/vim-markdown-preview'   " Opens markdown preview in browser
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }  " Autocompletion
Plug 'airblade/vim-gitgutter'                               " git tools for vim
Plug 'autozimu/LanguageClient-neovim', {'branch':'next','do':'bash install.sh'}
Plug 'dense-analysis/ale'                                              " Linter
Plug 'editorconfig/editorconfig-vim'                            " Editor Config
Plug 'godlygeek/tabular'                  " eg. align lines by '=' with :Tab /=
Plug 'jistr/vim-nerdtree-tabs'                 " make NERDTree same in all tabs
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }         " Fuzzy file finder
Plug 'kien/rainbow_parentheses.vim'  " Matching coloring of parentheses, braces
Plug 'majutsushi/tagbar'                            " Displays tags in a window
Plug 'mhinz/vim-startify'                          " Fancy start screen for vim
Plug 'nathanaelkane/vim-indent-guides'        " visually displays indent levels
Plug 'ntpeters/vim-better-whitespace'             " Removes trailing whitespace
Plug 'preservim/nerdcommenter'              " Intensely nerdy commenting powers
Plug 'sbdchd/neoformat'             " auto format code - requires yapf from pip
Plug 'scrooloose/nerdtree'                                       " File browser
Plug 'tpope/vim-fugitive'                                         " git wrapper
Plug 'vim-airline/vim-airline'                              " Fancy status line
Plug 'vim-airline/vim-airline-themes'            " Themes for fancy status line
Plug 'vim-scripts/a.vim'              " Alternate Files quickly (.c --> .h etc)
Plug 'zchee/deoplete-jedi'                         " deoplete source for python
call plug#end()
" }}}
" UI {{{
set nocompatible                         " disable compatibility to old-time vi
set foldmethod=syntax                                     " selects fold method
set showmatch                                         " show matching brackets.
set cursorline                                         " highlight current line
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
" set clipboard=unnamed                        " enable copying to clipboard
filetype plugin indent on        " allows auto-indenting depending on file type
syntax on                                                 " syntax highlighting
colorscheme default
filetype indent on                        " load filetype-specific indent files
filetype plugin on                                    " enable filetype plugins

let g:mapleader=','                                        " set the leader key
let g:maplocalleader="\\"                            " set the local leader key
" }}}
" Whitespace {{{
let g:better_whitespace_ctermcolor='yellow'
let g:better_whitespace_guicolor='yellow'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:better_whitespace_filetypes_blacklist=[
            \ 'diff',
            \ 'gitcommit',
            \ 'unite',
            \ 'qf',
            \ 'help',
            \ 'markdown']
" enable whitespace marking in markdown files but with disabled stripping
:autocmd FileType markdown EnableWhitespace
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
let g:startify_bookmarks = [
            \ '~/.config/nvim/init.vim',
            \ '~/.zshrc',
            \ '~/.aliases' ]
let g:startify_session_detection=1    " Show current folder session file at top
let g:startify_relative_path =1                           " Show relative paths
let g:startify_change_to_dir=0        " Change to file's directory when opening
let g:startify_files_number=10                        " Number of files to show
let g:startify_list_order = [
    \ ['   Bookmarks:'], 'bookmarks',
    \ ['   Recent Files:'], 'files' ]
" }}}
" NERDTree {{{
let NERDTreeDirArrows=1                         " Use + - chars for directories
let NERDTreeMinimalUI=1                        " Remove excess information bars
let NERDTreeShowBookmarks=1                                    " Show Bookmarks
" let g:nerdtree_tabs_open_on_console_startup=1
" Solve issue with startify not opening when tabs are enabled
autocmd VimEnter *
                \   if !argc()
                \ |   Startify
		\ |   execute 'NERDTreeTabsOpen'
                \ |   wincmd w
\ | endif
" }}}
" NERDCommenter {{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 0
" Align line-wise comment delimiters flush left
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" }}}
" Autocompletion {{{
let g:deoplete#enable_at_startup=1
" }}}
" Ale - Asyncrhonous Lint Engine {{{
let b:ale_linters = {
            \ 'python': ['flake8', 'pylint'],
            \ 'c': ['clangtidy'], 'cpp': ['clangtidy']}
let g:ale_fixers = {
            \ 'python': ['autopep8','yapf'],
            \ 'c': ['uncrustify'], 'cpp': ['uncrustify']}
let b:ale_warn_about_trailing_whitespace = 0
" }}}
" Indent Guides {{{
let g:indent_guides_enable_on_vim_startup = 1
" }}}
" Rainbow Parentheses {{{
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['red',         'firebrick3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" }}}
" Markdown Preview {{{
" select markdown preview format
let vim_markdown_preview_github=1
" select browser for preview
let vim_markdown_preview_browser='Google Chrome'
" replace ctrl+p with ctrl+m
let vim_markdown_preview_hotkey='<C-m>'
" }}}
" Functions {{{
" toggle between number and relative line numbers
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
" }}}
" Mappings {{{
" toggle fold with space
nnoremap <space> za
" Toggle spell checker
nnoremap <leader>s :set invspell<CR>
" toggle line numbers
nnoremap <leader>l :set invnumber<CR>
" Toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
" Reload vimrc
nnoremap <leader>v :so $MYVIMRC<CR>
" Toggle line wrap
nnoremap <leader>w :set wrap!<CR>
" Toggle Taglist
nnoremap <leader>t <ESC>:TagbarToggle<CR>
" Turn off search highlighting
nnoremap <leader><space> :nohlsearch<CR>
" close autocompletion window
nnoremap <leader>x :pclose<CR>

" commenting in and out with nerdcommenter
map - <leader>cc
map + <leader>cu
map 0 <leader>ci

" Bind Ctrl+hjkl keys to navigate opened buffers instead of Ctrl+w+hjkl
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k""

" disable arrow keys
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

" Toggle relative/absolute line numbers
nnoremap <leader>l :set invnumber<CR>
nnoremap <leader>rl :set invrelativenumber<CR>

" Enable tab-based autocompletion cycling
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" }}}
" Filetypes {{{
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
autocmd BufNewFile,BufReadPost *.launch,*.urdf,*.xacro,*.sdf set filetype=xml
autocmd BufNewFile,BufRead,BufReadPost *.markdown,*.mdown,*.mkd,*.mkdn,*.md set filetype=markdown
" }}}
" Organization {{{
set modeline
" set modeline=1
" Enable foldlevel=marker for vimrc only
" }}}
" vim:foldmethod=marker:foldlevel=0

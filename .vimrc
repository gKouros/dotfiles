" My vimrc configuration
set nocompatible                 " explicitely declare no-compatibillity with vi
" Vundle  {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'universal-ctags/ctags'
Plugin 'vim-scripts/indentLine.vim'
Plugin 'vim-scripts/mru.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'godlygeek/tabular'              " eg. select lines and do :Tabularize /=
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/UltiSnips'           " custom autocompletion eg. if, for etc
Plugin 'honza/vim-snippets'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'vim-scripts/fugitive.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'taketwo/vim-ros'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'mhinz/vim-startify'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rhysd/vim-clang-format'
call vundle#end()
" }}}
" Colors and Themes {{{
set t_Co=256
colorscheme wombat256mod                                  " set vim color scheme
syntax enable                                         " enable syntax processing
" - highlight line number column
highlight Comment ctermfg=66
let &colorcolumn=81                                            " color column 81
autocmd FileType c,cpp :set colorcolumn=121
highlight colorcolumn ctermfg=red ctermbg=black
" }}}
" rainbow parenthesis {{{
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
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" execute :RainbowParenthesesActivate to display the rainbow
" }}}
" Spaces and Tabs {{{
set tabstop=2                                  " number of visual spaces per TAB
set softtabstop=2                         " number of spaces in tab when editing
set expandtab                                                  " tabs are spaces
set shiftwidth=2           " use two spaces indentation with reindent (<< or >>)
set cino=(2                   " begaviour of indentation in unclosed parenthesis
set autoindent                             " keep indentation from previous line
set smartindent                            " automatic indentation in some cases
" }}}
" Taglist {{{
let Tlist_Use_Right_Window=1
let Tlist_WinWidth=40
let Tlist_GainFocus_On_ToggleOpen=1
" }}}
" UI Config {{{
set shell=/bin/bash
set encoding=utf-8
set number                                                   " show line numbers
set showcmd                                         " show command in bottom bar
set cursorline                                          " highlight current line
filetype indent on                         " load filetype-specific indent files
filetype plugin on                                     " enable filetype plugins
set wildmenu                              " visual autocomplete for command menu
set lazyredraw                                     " redraw only when we need to
set showmatch                                        " highlight matching [{()}]
set ignorecase                                          " ignore case by default
set smartcase                 " ignore case at search, unless camel case is used
set clipboard=unnamed         " use the system clipboard for for yank/put/delete
set laststatus=2                                      " always show status lines
set ruler                                                   " show column number
set mouse=v                                           " enable mouse in terminal
set textwidth=0
set formatoptions-=t
set listchars=eol:¬,tab:\|\ ,trail:~,extends:>,precedes:<       " set list chars
set backspace=indent,eol,start

highlight ExtraWhitespace ctermbg=red
" autocmd BufEnter * EnableWhitespace
if &filetype !~ 'markdown'
  autocmd BufEnter * EnableStripWhitespaceOnSave
endif

" - indent lines and leading spaces
let g:indentLine_color_term=239
let g:indentLine_enabled=1
let g:indentLine_leadingSpaceEnabled=1
" }}}
" Spellchecking {{{
set spelllang=en
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.tex setlocal spell

" }}}
" Filetypes {{{
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
autocmd BufNewFile,BufReadPost *.launch,*.urdf,*.xacro,*.sdf set filetype=xml
autocmd BufNewFile,BufRead,BufReadPost *.md set filetype=markdown
" autocmd BufNewFile,BufRead,BufReadPost *.markdown,*.mdown,*.mkd,*.mkdn,README.md  setf markdown
" }}}
" Searching {{{
set incsearch                                 " search as characters are entered
set hlsearch                                                 " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" Center window under cursor when searching
nmap N Nzz
nmap n nzz
nmap * *zz
" }}}
" Folding {{{
set foldenable                                                  " enable folding
set foldlevelstart=10                               " open most folds by default
set foldnestmax=10                                          " 10 nested fold max
" - space open/close folds
nnoremap <space> za
set foldmethod=syntax                                     " fold based on syntax
" }}}
" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Custom Functions {{{
" - toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
" }}}
" Ultisnips {{{
let g:UltiSnipsSnippetsDirectories=["UltiSnipps", "my_snippets"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:Ultisnips_python_style="doxygen"
let g:UltiSnipsListSnippets="<c-b>"
"}}}
" Statusline {{{
let g:airline_powerline_fonts=1
let g:airline_theme='wombat'
" }}}
" Git {{{
" - Show number of non-zero  modifications next to branch name in git repos
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" }}}
" Markdown {{{
let vim_markdown_preview_github=1
" let vim_markdown_preview_toggle=2
let vim_markdown_preview_browser='Google Chrome'
" let vim_markdown_preview_temp_file=1
" }}}
" NERDTree {{{
let NERDTreeDirArrows=0                          " Use + - chars for directories
let NERDTreeMinimalUI=1                         " Remove excess information bars
let NERDTreeShowBookmarks=1                                     " Show Bookmarks
"}}}
" YouCompleteMe {{{
let g:ycm_python_binary_path = '/usr/local/lib/python2.7'
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_comments_and_strings  = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_key_list_select_completion=['<tab>', '<Down>']
let g:ycm_key_list_previous_completion=['<s-tab>', '<Up>']
let g:ycm_auto_trigger = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_semantic_triggers = {
\   'roslaunch' : ['="', '$(', '/'],
\   'rosmsg,rossrv,rosaction' : ['re!^', '/'],
\ }
" }}}
" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 3
let b:syntastic_mode = "passive"
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_check_header = 0
let g:syntastic_c_check_header = 0
let g:syntastic_cpp_remove_include_errors = 0
highlight SyntasticErrorSign guifg=white guibg=red
" }}}
" clang-formater SETTINGS {{{
let g:clang_format#command = "clang-format-3.6"
let g:clang_format#code_style = "google"
let g:clang_format#style_options = {
      \ "ConstructorInitializerIndentWidth" : 2,
            \ "ColumnLimit" : 100,
            \ "BreakBeforeBraces" : "Stroustrup"}
" }}}
" Comments {{{
let g:NERDSpaceDelims=1                              " leave space after comment
let g:NERDCompactSexyComs=0                             " enable sexy commenting
map - <leader>ci
" }}}
" Startify {{{
let g:startify_bookmarks = [ '~/.vim/vimrc', '~/.zshrc', '~/.aliases' ]
let g:startify_session_detection=1     " Show current folder session file at top
let g:startify_relative_path =1                            " Show relative paths
let g:startify_change_to_dir=0         " Change to file's directory when opening
let g:startify_files_number=10                         " Number of files to show
" Order of info display
let g:startify_list_order = [
      \ ['   Bookmarks:'],
      \ 'bookmarks',
      \ ['   Recent Files:'],
      \ 'files',
      \ ]
" }}}
" Custom bindings {{{
" - replace character and exit insert mode
nnoremap <C-I> s <ESC>r
" - gui undo binding
nnoremap <leader>u :GundoToggle<CR>
" - edit vimrc binding
nnoremap <leader>ev :vsp $MYVIMRC<CR>
" - source vimrc binding
nnoremap <leader>sv :source $MYVIMRC<CR>
" - toggle rainbow parentheses
nnoremap <leader>r :RainbowParenthesesToggle<CR>
" - toggle nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>
" - toggle line wrapping
nnoremap <leader>w :set wrap!<CR>
" - copy and paste from system clipboard
nnoremap <leader>y "*y
nnoremap <leader>p "*p
" - toggle taglist
nnoremap <leader>t <ESC>:TlistToggle<CR>
" - syntastic check
nnoremap <leader>s <ESC>:SyntasticCheck<CR>
" - run python script
nnoremap <buffer> <F9> :exec '!python -B' shellescape(@%, 1)<cr>

" }}}
" Custom Movements {{{
" - move to beginning/end of line
nmap <C-j> <C-W>j
nmap <C-h> <C-W>h
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
" - don't jump wrapped lines
nnoremap j gj
nnoremap k gk
noremap <Up> g<Up>
noremap <Down> g<Down>
imap <Up> <C-o>gk
imap <Down> <C-o>gj
" Bind Ctrl+<movement> keys to move around the windows,
" " instead of using Ctrl+w + <movement>
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k"
" }}}
" Disable Arrow keys {{{
" Esc Mode
" noremap <Up> <nop>
" noremap <Down> <nop>
" noremap <Left> <nop>
" noremap <Right> <nop>
" Insert mode
" inoremap <Up> <nop>
" inoremap <Down> <nop>
" inoremap <Left> <nop>
" provide hjkl movements in Command-line mode via the <Alt> modifier key
" cnoremap <A-h> <Left>
" cnoremap <A-j> <Down>
" cnoremap <A-k> <Up>
" cnoremap <A-l> <Right> inoremap <Right> <nop>
" hjkl in insert mode via alt key
" inoremap <A-h> <C-o> h
" inoremap <A-j> <C-o> j
" inoremap <A-k> <C-o> k
" inoremap <A-l> <C-o> l
"}}}
" Organization {{{
set modeline
" set modelines=1
" }}}
" vim:foldmethod=marker:foldlevel=0

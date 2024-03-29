" =============================================================================
" ~/.vimrc
" Last updated: January 27, 2024 by Abdullah Alharbi
" =============================================================================


" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Arabic support
set encoding=utf-8
set arabicshape


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard^=unnamed,unnamedplus

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-c> :nohl<CR>
vnoremap <C-c> :nohl<CR>
inoremap <C-c> :nohl<CR>


" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=88
highlight ColorColumn ctermbg=233


" Relative numbers
set relativenumber


" Easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Indentation
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 shiftround expandtab
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 shiftround expandtab
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 shiftround expandtab
autocmd FileType htmldjango setlocal tabstop=2 softtabstop=2 shiftwidth=2 shiftround expandtab
autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2 shiftround expandtab
autocmd FileType scss setlocal tabstop=2 softtabstop=2 shiftwidth=2 shiftround expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()


" Setup The NERD Tree
" git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
map <C-n> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeIgnore = ['^__pycache__$[[dir]]']


" Setting custom indent colors
" cd ~/.vim/bundle
" git clone git://github.com/nathanaelkane/vim-indent-guides.git
let indent_guides_auto_colors = 0
let indent_guides_guide_size = 1
hi IndentGuidesOdd ctermbg=236
hi IndentGuidesEven ctermbg=237


" Syntastic syntax checking plugin
" cd ~/.vim/bundle
" git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_flake8_post_args = "--ignore=E501"
let g:syntastic_python_pylint_args = "--load-plugins pylint_django"


" Settings for vim-javascript
" cd ~/.vim/bundle
" git clone https://github.com/pangloss/vim-javascript.git
let g:javascript_plugin_flow = 1


" Syntax highlighting and indenting for JSX
" cd ~/.vim/bundle
" git clone https://github.com/maxmellon/vim-jsx-pretty.git
let g:vim_jsx_pretty_highlight_close_tag = 1


" Settings for emmet-vim
" cd ~/.vim/bundle
" git clone https://github.com/mattn/emmet-vim.git
" Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,htmldjango,css,javascript EmmetInstall


" Settings for commentary.vim
" cd ~/.vim/bundle
" git clone https://tpope.io/vim/commentary.git
autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}


" surround.vim
" cd ~/.vim/bundle
" git clone https://tpope.io/vim/surround.git


" Syntax highlighting for Django templates
" download django.vim from https://www.vim.org/scripts/script.php?script_id=1487
" mkdir ~/.vim/syntax
" mv django.vim ~/.vim/syntax


" Settings for vim-plug
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Black formatter (for Python)
Plug 'psf/black', { 'branch': 'stable' }

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

" =============================================================================
" Python IDE Setup
" =============================================================================


" Settings for flake8
" cd ~/.vim/bundle
" git clone https://github.com/nvie/vim-flake8.git
" autocmd FileType python map <buffer> <Leader>f :call flake8#Flake8()<CR>


" Settings for Black
noremap <Leader>f :Black<CR>


" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone https://github.com/Lokaltog/vim-powerline.git
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
map <leader>4 :CtrlPClearCache<CR>
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone https://github.com/davidhalter/jedi-vim.git
" NOTE: you should have jedi already installed.
" To install jedi: sudo pip install jedi
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

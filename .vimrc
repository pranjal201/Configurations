" plugins
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let need_to_install_plugins = 1
endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'luochen1990/rainbow'
Plug 'vim-syntastic/syntastic'
Plug 'codota/tabnine-vim'
call plug#end()

let g:rainbow_active = 1
"set to 0 if you want to enable it later via :RainbowToggle

"tabnine repository path
set rtp+=~/.vim/plugged/tabnine-vim
"SYNTASTIC CONFIGURATION
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_open = 1
map <leader>s :SyntasticReset<CR>

" this is foour  background
set background=dark

filetype plugin indent on
syntax on

if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

" always show the status bar
set laststatus=2

" enable 256 colors
set t_Co=256

" turn on line numbering
set number
set relativenumber
" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
set path+=**
set wildmenu
" sane editing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set viminfo='25,\"50,n~/.viminfo

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" mouse
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
funct! ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunc

" color scheme
syntax on
colorscheme dankneon 
filetype on
filetype plugin indent on

" lightline
set noshowmode
let g:lightline = { 'colorscheme': 'ayu_dark' }


" file browser
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0
map <leader>n :call NERDTreeToggle()<CR>
funct! NERDTreeToggle()
    NERDTreeTabsToggle
   if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
    endif
endfunc

funct! StartUp()
    if 0 == argc()
        NERDTree
        
    end
endfunc
autocmd VimEnter * call StartUp()


inoremap jj <Esc> 
nmap <Tab> <C-w>w
imap { {}<Esc>i
imap ( ()<Esc>i
imap [ []<Esc>i
noremap '' i#TabNine::sem<Esc>o



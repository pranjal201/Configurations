" plugins
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    let need_to_install_plugins = 1
endif

" This checks for the plugins "
if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif


call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-syntastic/syntastic'
Plug 'tabnine/YouCompleteMe'
Plug 'audibleblink/hackthebox.vim'
Plug 'mhartington/oceanic-next'
call plug#end()
"
"Important!!
   " The configuration options should be


" This closes the extra buffer window in vim for function definition
let g:ycm_autoclose_preview_window_after_insertion = 1


"SYNTASTIC CONFIGURATION
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ['flake8']
nnoremap <leader>s :SyntasticReset<Enter>
"
" this is fo  background
set background=dark
filetype plugin indent on
syntax on

" always show the status bar
set laststatus=2
set textwidth=80

" turn on line numbering
set number
set relativenumber
" sane text files
set wrap
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

"This is very useful for mainting color config while in tmux
if exists("+termguicolors")
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
colorscheme OceanicNext
filetype on
filetype plugin indent on
"
" lightline
set noshowmode
let g:lightline = { 'colorscheme': 'solarized' }


" file browser
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

nmap <C-t> :tabnew<Enter>
nmap <Tab> :tabnext<Enter>
nmap <C-e> :tabclose<Enter>
nmap <C-w> <C-w>w
inoremap { {}<left>
inoremap {{ {
inoremap {} {}
inoremap [ []<left>
inoremap [[ [
inoremap [] []
inoremap ( ()<left>
inoremap (( (
inoremap () ()
inoremap " ""<left>
inoremap "" ""
inoremap ' ''<left>
inoremap '' ''
noremap j gj
noremap k gk

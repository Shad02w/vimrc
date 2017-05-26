source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nocompatible
set hidden
set encoding=utf-8

"change language to english
set langmenu=en_US
let $LANG = 'en_US'

"turn off bebebe sound and flash screen
set vb t_vb=
au GuiEnter * set t_vb=

filetype off

"Manage Plugins using Vundle
"setup vundle to manage itself
set rtp+=$VIM\vimfiles\bundle\Vundle.vim\
call vundle#begin('$VIM/vimfiles/bundle/')

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Shougo/neocomplete.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'derekmcloughlin/gvimfullscreen_win32'
Plugin 'mattn/emmet-vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/restart.vim'

call vundle#end()
filetype plugin indent on

"highlight
syntax enable
syntax on

"set linenumber
set number
set relativenumber

"change color scheme
colorscheme monokai

"change font family
set guifont =Source_Code_Pro:h10

"hide the right bar 
set guioptions-=r
set guioptions-=l
set guioptions-=R
set guioptions-=L
"toggle top tool bar
set guioptions-=m
set guioptions-=T
map <silent> <C-F2> :if &guioptions =~# 'T'<Bar>  
        \set guioptions-=T <Bar>  
        \set guioptions-=m <bar>  
    \else <Bar>  
        \set guioptions+=T <Bar>  
        \set guioptions+=m <Bar>  
    \endif<CR> 


"show the cursir position
set ruler
"show the status line

set laststatus=2
"highlight the recent row and line
set cursorline
set cursorcolumn

"show newine symbol
set list
set listchars=tab:▸\ ,eol:¬
"set up the indent space
set tabstop=4
set softtabstop=4
set shiftwidth=4

"set for nerdtree
map <silent><C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

"set airline/vim-airline

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
 
let g:airline_theme='molokai'
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1  
let g:airline#extensions#branch#enabled = 1
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#whitespace#check(),0)} ⏳%{strftime("%H:%M")}'

"cancel the highlight after find
map <silent><M-f> :set nohlsearch<CR>

"open current directory on windows explorer
map <silent><Leader>cd :exe "!explorer ".expand("%:p:h")<CR><CR>
"open with chromium local file
map <silent><M-1> :exe "!C:/chrome-win32/chrome.exe ".expand("%:p")<CR><CR>
"open withe chromium when xampp on
map <silent><M-2> :exe "!C:/chrome-win32/chrome.exe "."http://127.0.0.1"<CR><CR>
"fire http-server form node 
map <silent><M-F2> :exe "!C:/chrome-win32/chrome.exe "."http://127.0.0.1:8080"<CR><CR>
"restart key
map <silent><F5> :Restart<CR>

"Full window when openning
autocmd GUIEnter * simalt ~x

"Press F11 to fullscreen
map <C-F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

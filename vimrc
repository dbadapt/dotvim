" Vundle settings
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" status/tabline
Plugin 'bling/vim-airline'
" The sparkup vim script is in a subdirectory of this repo called vim.  Pass
" the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" supertab
Plugin 'ervandew/supertab'
" ultisnips
Plugin 'SirVer/ultisnips'
" snippets
Plugin 'honza/vim-snippets'
" perl completion
Plugin 'c9s/perlomni.vim'
" completion engine
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line             

" Wordstar/Joeisms

" Top of file
map  <C-k><C-u> ggi
map! <C-k><C-u> <Esc>ggi
" End of file
map  <C-k><C-v> Gi
map! <C-k><C-v> <Esc>Gi
" begining of line
map  <C-a> 0i
map! <C-a> <Esc>0i
" end of line
map  <C-e> $a
map! <C-e> <Esc>$a
" delete line
map  <C-y> ddi
map! <C-y> <Esc>ddi
" delete to end of line
map  <C-j> d$a
map! <C-j> <Esc>d$a
" goto line
map  <C-k><C-l> :
map! <C-k><C-l> <Esc>:
" find
map  <C-k><C-f> /
map! <C-k><C-f> <Esc>/
map  <C-l> /<Enter>i
map! <C-l> <Esc>/<Enter>
" Save and exit
map  <C-k><C-x> :x<Enter>
map! <C-k><C-x> <Esc>:x<Enter>
" mark block
map  <C-k><C-b> v
map! <C-k><C-b> <Esc>v

" MySQL recommended settings
set tabstop=8
set shiftwidth=2
set bs=2
set et 
set sts=2
set tw=78
set formatoptions=cqroa1
set cinoptions=g0:0t0c2C1(0f0l1
set cindent

" highlight trailing spaces as errors
let c_space_errors=1

" path for GF
set path+=.,include,../include,/usr/include

" mouse on
set mouse=a

" syntax highlighting on
syntax on
colorscheme desert

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


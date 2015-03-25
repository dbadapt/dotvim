" Vundle settings
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Package manager
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" git plugin
Plugin 'tpope/vim-fugitive'

" file manager plug-in 
Plugin 'git://git.wincent.com/command-t.git'

" status/tabline
Plugin 'bling/vim-airline'

" HTML plugin
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

" Wordstar/Joeisims

" Top of file
map  <C-k><C-u> gg
map! <C-k><C-u> <Esc>ggi
" End of file
map  <C-k><C-v> G
map! <C-k><C-v> <Esc>Gi
" begining of line
map  <C-a> 0
map! <C-a> <Esc>0i
" end of line
map  <C-e> $a
map! <C-e> <Esc>$a
" delete line
map  <C-y> dd
map! <C-y> <Esc>ddi
" delete to end of line
map  <C-j> d$
map! <C-j> <Esc>d$a
" goto line
map  <C-k><C-l> :
map! <C-k><C-l> <Esc>:
" find
map  <C-k><C-f> /
map! <C-k><C-f> <Esc>/
map  <C-l> /<Enter>
map! <C-l> <Esc>/<Enter>i
" Save and exit
map  <C-k><C-x> :x<Enter>
map! <C-k><C-x> <Esc>:x<Enter>i
" mark block
map  <C-k><C-b> v
map! <C-k><C-b> <Esc>vi
" split the window
map  <C-k><C-o> :split<Enter>
map! <C-k><C-o> <Esc>:split<Enter>i 
" next window
map  <C-k><C-n> :wincmd j<Enter>
map! <C-k><C-n> <Esc>:wincmd j<Enter>i
" previous window
map  <C-k><C-p> :wincmd k<Enter>
map! <C-k><C-p> <Esc>:wincmd k<Enter>i
" Ctrl-C quit
map  <C-c> :q<Enter>
" Load new file in current window
map  <C-k><C-e> :new 
map! <C-k><C-e> <Esc>:new 
" Read new file at cursor postion
map  <C-k><C-r> :read 
map! <C-k><C-r> <Esc>:read 
" Save
map  <C-k><C-d> :w<Enter>
map! <C-k><C-d> <Esc>:w<Enter>i
" Go to matching brace
map  <C-g> %
map! <C-g> <Esc>%i
" Format paragraph 
map  <C-k><C-j> gqip
map! <C-k><C-j> <Esc>gqipi
" help
map  <C-k><C-h> :help<Enter>
map! <C-k><C-h> <Esc>:help<Enter>

"
" MySQL recommended settings
set tabstop=8
set shiftwidth=2
set bs=2
set et 
set sts=2
set tw=78
set formatoptions=qr1
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

" Spell checking
setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.md set complete+=kspell
autocmd BufRead,BufNewFile *.txt set complete+=kspell
hi clear SpellBad
hi SpellBad cterm=underline

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"

" automatic backups
set backup
silent! call mkdir($HOME . '/.vim/.backups')
set backupdir=~/.vim/.backups
silent execute '!find ~/.vim/.backups -type f -mtime +30 -exec rm {} \;&'


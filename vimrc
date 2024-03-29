" dbpercona/dotvim - my vim configuration

if v:version >= 500

  " Vundle settings
  set nocompatible              " be iMproved, required
  filetype off                  " required

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim

  " Package manager
  call vundle#begin()

  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'

  " .localvimrc files
  Plugin 'embear/vim-localvimrc'

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

  if v:version >= 703

    " easily locate cursor after search
    Plugin 'inside/vim-search-pulse'

    " improved incremental searching
    Plugin 'haya14busa/incsearch.vim'

  endif

  if v:version >= 704

    " ultisnips
    Plugin 'SirVer/ultisnips'

  endif 

  " snippets
  Plugin 'honza/vim-snippets'

  " perl completion
  Plugin 'c9s/perlomni.vim'

  if v:version > 701 || ( v:version == 701 && has('patch175') )

    " syntastic
    Plugin 'scrooloose/syntastic'

    " tagbar
    " Plugin 'majutsushi/tagbar'

    " CtrlP - fuzzy tag search
    Plugin 'ctrlpvim/ctrlp.vim'

  endif    

  " completion based on platform
  "
  if filereadable($HOME . '/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so')

    let _completerType = 'ycm'

    " YCM
    Plugin 'Valloric/YouCompleteMe' 

    " YCM Generator
    Plugin 'rdnetto/YCM-Generator'

  elseif has('lua') && ( v:version > 703 || ( v:version == 703 &&  has('patch885') ) ) && v:version < 802

    let _completerType = 'neo'

    " neocomplete
    Plugin 'Shougo/neocomplete'

  else

    let _completerType = 'omni' 

  endif

  " restore cursor position 
  Plugin 'restore_view.vim'

  Plugin 'tranngocthachs/gtags-cscope-vim-plugin'

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
endif

if v:version >= 703

  " incsearch and vim search pulse
  let g:vim_search_pulse_disable_auto_mappings = 1
  let g:incsearch#auto_nohlsearch = 1
  map / <Plug>(incsearch-forward)
  map ? <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)

  " Next or previous match is followed by a Pulse
  map n <Plug>(incsearch-nohl-n)<Plug>Pulse
  map N <Plug>(incsearch-nohl-N)<Plug>Pulse
  map * <Plug>(incsearch-nohl-*)<Plug>Pulse
  map # <Plug>(incsearch-nohl-#)<Plug>Pulse
  map g* <Plug>(incsearch-nohl-g*)<Plug>Pulse
  map g# <Plug>(incsearch-nohl-g#)<Plug>Pulse

  " Pulses the first match after hitting the enter keyan
  autocmd! User IncSearchExecute
  autocmd User IncSearchExecute :call search_pulse#Pulse()

endif

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
map! <C-j> <Esc><Right>d$a
" goto line
map  <C-k><C-l> :
map! <C-k><C-l> <Esc>:
" find
map  <C-k><C-f> /
map! <C-k><C-f> <Esc>/

" find next
map  <C-l> n
map! <C-l> <Esc>n
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
" undo
map  <C-_> :u<Enter> 
map! <C-_> <Esc>:u<Enter>i
" redo
map  <C-^> :red<Enter> 
map! <C-^> <Esc>:red<Enter>i

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
set path+=.,include,../include,/usr/include,/usr/include/mysql,/usr/include/cppconn

" mouse on
if v:version >= 500

  set mouse=a

endif

" syntax highlighting on
syntax on
colorscheme desert
hi Comment ctermfg=LightBlue

" Spell checking
setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.md set complete+=kspell
autocmd BufRead,BufNewFile *.txt set complete+=kspell
hi clear SpellBad
hi SpellBad cterm=underline

if _completerType == 'ycm'

  " make YCM compatible with UltiSnips (using supertab)
  let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
  let g:SuperTabDefaultCompletionType = '<C-n>'
  let g:ycm_extra_conf_globlist = ['~/*','/ssd/*']

  " ultisnips is broken atm
  " better key bindings for UltiSnipsExpandTrigger
"  let g:UltiSnipsExpandTrigger = "<c-j>"
"  let g:UltiSnipsJumpForwardTrigger = "<c-b>"
"  let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

elseif _completerType == 'neo'

  let g:neocomplete#enable_at_startup = 1
  autocmd VimEnter * NeoCompleteEnable

else

  filetype plugin on
  set omnifunc=syntaxcomplete#Complete

endif

" automatic backups (keep for 30 days)
set backup
silent! call mkdir($HOME . '/.vim/.backups')
set backupdir=~/.vim/.backups
silent execute '!find ~/.vim/.backups -type f -mtime +30 -exec rm {} \;&'

" initialize airline
set laststatus=2
set ttimeoutlen=50

" initialize tagbar
nmap <F8> :TagbarToggle<CR>

" change paste behavior
nnoremap p P

" turn off REPLACE toggle
map! <Ins> <Esc>i

" set modeline for modes in comments
set modeline

" a few visual select behaviors I like 
vnoremap > >gv
vnoremap < <gv

map <S-Down> V<Down>
map! <S-Down> <Esc><Right>V<Down>
vnoremap <S-Down> <Down>

map <S-Up> V<Up>
map! <S-Up> <Esc><Right>V<Up>
vnoremap <S-Up> <Up>

map <S-Right> v<Right>
map! <S-Right> <Esc><Right>v<Right>
vnoremap <S-Right> <Right>

map <S-Left> v<Left>
map! <S-Left> <Esc><Right>v<Left>
vnoremap <S-Left> <Left>

" cut
vnoremap <C-X> d

" copy
vnoremap <C-C> y

" paste
map <C-V> p
map! <C-V> <Esc>pi

" restore_view
set viewoptions=cursor,folds,slash,unix
" let g:skipview_files = ['*\.vim']

" let all *.md files be markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" look up for tags
set tags=./tags,tags;
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
set cscopetag

" Lodestone's vimrc


" Several from: http://items.sjbach.com/319/configuring-vim-right
" ---------------------------------------------------------------

" These two enable syntax highlighting
" We're running Vim, not Vi!
set nocompatible
" No wrap mutherfuckah
set nowrap
" Enable syntax highlighting
syntax on
" utf-8
scriptencoding utf-8
" Set spell check
set spell
" Line numbers
set number 

" set noswapfile

" Change <leader> to ,
let mapleader = ","
 
" Set CtrlP's extensions
let g:ctrlp_extensions = ['tag', 'buffertag']

" Set a temporary background color.
"  I use this to differentiate 
"  visually between windows easily.
function! SetBackground(color)
  let setbg=':highlight Normal guibg=' . a:color
  exec setbg
endfunction
command! -nargs=? BackgroundColor :call SetBackground(<f-args>)

function! ChangeToProject(project)
  let setdir=':cd ~/projects/' . a:project
  let settree=':NERDTree ~/projects/' . a:project
  exec setdir
  exec settree
endfunction
command! -nargs=? ChangeProject :call ChangeToProject(<f-args>)

" nmap <leader>bg :call s:colour_hex()
nmap <leader>bg :BackgroundColor #
nmap <leader>kp :ChangeProject 

" Autoload and save session
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

"Show syntax highlighting groups for word under cursor
map <C-S-I> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val,  "name")')
endfunc
" 

colorscheme lodestone
" colorscheme denseloot
" Other nifty colorschemes
" colorscheme molokai
" colorscheme blackboard
" colorscheme ir_black
" colorscheme railscasts


" This sets up breaking lines at words instead of
" mid-word by simply doing :set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set formatoptions+=l
 
 
" Softtabs, 2 spaces - I like 2 space indentation. 
" I get to see more on the screen
set tabstop=2
set shiftwidth=2
 
" don't use a real Tab, use spaces please.
set expandtab
" 
" case-sensitive only if there is a capital letter in the search expression
set ignorecase
set smartcase
 
" see :help shortmess
" set shortmess=atI
 
" Don't ding
set visualbell
      
" make tabs and trailing spaces visible when requested:
set list listchars=tab:»·,trail:· ",eol:$
nmap <silent> <leader>ss :set nolist!<CR>
" 
" set hidden
" 
" 
" :W works like :w
" adding the ! overwrites a command, this gives a polite error upon reparsing
" if not set
command! WRITE write

" Increase history
set history=500

" " Quick timeouts on key combinations.
set timeoutlen=600

" Send contents of current file to private gist
map gist :Gist -p<CR>
let g:gist_open_browser_after_post = 1
 
" Set yankring history file
let g:yankring_history_file = '.vim_yankring_history'
 
let g:yankring_replace_n_pkey = '<C-v>'
 
" Quick edit .vimrc
map <leader>vc :e ~/.vimrc<CR>
" Quick edit my color scheme
map <leader>vl :e ~/.vim/colors/lodestone.vim<CR>

" Quick switch to last buffer without reaching up to the caret ^
map <C-k><C-k> :b#<CR>
 
vmap > >gv
vmap < <gv
nmap > >>
nmap < <<
 
" I can't seem to reach $ as easily as I _should_ (double meaning)
nmap - $
 
" Make spacebar behave like a webpage
nmap <space> 10<Down>
nmap <S-space> 10<Up>
 

" Find All
map <leader>fa :Ack ""<LEFT>
 
" Show only the current window/tab/whatevers
nmap <leader>o :only<CR>

 
" TextMate fuzzy finder with <leader>t
let g:fuzzy_ignore = "*.log"
 
 
" let g:CommandTMatchWindowAtTop=1
" let g:CommandTMaxHeight=20
" let g:CommandTMatchWindowReverse=0
 
" make mouse work in console mode vim
set mouse=nv
" 
" map <leader>rake :Rake<CR>
" 
"map <silent> <leader>t :FuzzyFinderTextMate<CR>
" map <leader>t :FuzzyFinderTextMate<CR>
" _find _buffer
map <leader>fb :FuzzyFinderBuffer<CR>
map <leader>ff :FuzzyFinderBuffer<CR>
" _find file in current buffer's _directory
map <leader>fd :FuzzyFinderFileWithCurrentBufferDir<CR>
" _find _recent
map <leader>fr :FuzzyFinderMruFile<CR>
" _find _tag
map <leader>ft :FuzzyFinderTag<CR>
" _find _Tag with cursor word
map <leader>fT :FuzzyFinderTagWithCursorWord<CR>

" Set default quick-switch with double leader
map <leader>bl :BufExplorer<CR>
map <leader><leader> :FuzzyFinderBuffer<CR>
let g:bufExplorerSplitVertSize=20
 
" Buffer movement
nmap <C-j> :BufSurfBack<CR>
nmap <C-h> :BufSurfBack<CR>
nmap <C-k> :BufSurfForward<CR>
nmap <C-l> :BufSurfForward<CR>
 
" RIP joe, you were a great friend...
" entering joe (Joe's Own Editor, Wordstar clone) compatibility mode: 
map <C-k>x :x<CR>
map <C-k><C-x> :x<CR>
map <C-k>e :e 
map <C-k><C-e> :e 
map <C-k>d :w<CR> 
map <C-k><C-d> :w<CR> 

map <C-k>n :bn<CR>
map <C-k><C-n> :bn<CR>
map <C-k>p :bp<CR>
map <C-k><C-p> :bp<CR>

" These are standard bash/emacs/mac text movement/manipulation
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-k> <C-o>d$
imap <C-a> <Home>
vmap <C-a> <Home>
omap <C-a> <Home>
imap <C-e> <End>
vmap <C-e> <End>
omap <C-e> <End>
inoremap <C-d> <Del>
vnoremap <C-d> <Del>
onoremap <C-d> <Del>
cnoremap <C-d> <Del>
cnoremap <C-k> <C-f>d$<C-c><End>
imap <C-k> <C-o>d$

" Yank all -- Can also do standard: ggyG
map <leader>yall :%y<CR>
" 
" 
autocmd BufRead,BufNewFile *.js set ft=javascript.jquery
 
 
" highlight the current line 
set cursorline
"  

" By default, pressing <TAB> in command mode will choose the first 
" possible completion with no indication of how many others there might be. 
" The following configuration lets you see what your other options are:
set wildmenu
" 
" To have the completion behave similarly to a shell, 
" i.e. complete only up to the point of ambiguity 
" (while still showing you what your options are), also add the following:
" This is set in the Pickles section below
" set wildmode=list:longest

" set title

set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp


" Intuitive backspacing in insert mode
" (allow backspacing over everything in insert mode)
set backspace=indent,eol,start
 
" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
filetype plugin indent on
" filetype plugin on
" filetype indent on

" Omnicomplete mode on
set ofu=syntaxcomplete#Complete

" Let SuperTab determine the completion mode
let g:SuperTabDefaultCompletionType = "omni" 
let g:SuperTabContextDefaultCompletionType = "<c-x><c-u>"

" Disable's <c-k> in insert mode as an autocomplete call 
" (From WordFuzzyCompletion)
let g:fuzzywordcompletion_disable_keybinding = 1

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

" --------------------------------------------------------------
"
" The following is picked from a peck of Pickled Vim Configuration.
" Thanks technicalpickles

" Section: configuration



"sm:    flashes matching brackets or parentheses
set showmatch

"sta:   helps with backspacing because of expandtab
set smarttab

" Set temporary directory (don't litter local dir with swp/tmp files)
set directory=/tmp/

" When scrolling off-screen do so 3 lines at a time, not 1
set scrolloff=3

" enable line numbers 
set number
setlocal numberwidth=5

" Turn off local file indentation
" nnoremap <F8> :setl noai nocin nosi inde=<CR>

" first tab shows all matches. next tab starts cycling through the matches
set wildmode=list:longest,full
" set wildignore=*.o,*.fasl

" Display extra whitespace
" set list listchars=tab:»·,trail:·

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault

" Folding
set foldenable
set foldmethod=syntax
set foldlevel=999 " make it really high, so they're not displayed by default
  
" Turn on rails bits of statusbar
let g:rails_statusline=0
let g:rails_defalt_file="config/routes.rb"

let g:delimitMate_autoclose=0
let g:delimitMate_smart_quotes=0

" NERDTree Options
" colored NERD Tree
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
" let NERDTreeShowHidden = 1
let NERDTreeShowHidden = 0
" map enter to activating a node
" let NERDTreeMapActivateNode='<CR>'
let NERDTreeIgnore=['\.git','\.DS_Store']

" limit number of results shown for performance
let g:fuzzy_matching_limit=20
" ignore stuff that can't be openned, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;coverage/**;tmp/**;rdoc/**"
" increase the number of files scanned for very large projects
let g:fuzzy_ceiling=2000
" display relative path, 
" instead of abbrevated path 
" (lib/jeweler.rb vs l/jeweler.rb)
" let g:fuzzy_path_display = 'relative_path'

let g:browser = 'open '

  augroup myfiletypes
    
    " Clear old autocmds in group
    autocmd!
    " autoindent with two spaces, always expand tabs
    autocmd FileType ruby,eruby,yaml set autoindent shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType vim set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType cucumber set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    " markdown goodness
    autocmd BufRead *.mkd  set autoindent formatoptions=tcroqn2 comments=n:>
    au BufRead,BufNewFile *etc/nginx/* set ft=nginx 
    " treat rackup files like ruby
    au BufRead,BufNewFile *.ru set ft=ruby
    au BufRead,BufNewFile *.coffee set ft=coffee
  augroup END


  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endi

  " Turn on language specific omnifuncs
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c set omnifunc=ccomplete#Complete
  autocmd FileType coffee set omnifunc=javascriptcomplete#CompleteJS
  " let g:rubycomplete_rails = 1


  " have some fun with bufexplorer
  " let g:bufExplorerDefaultHelp=0       " Do not show default help.
  let g:bufExplorerShowRelativePath=1  " Show relative paths.

" Section: mappings
"   Exit Insert mode quickly without ESC
imap jl <Esc>


" Toggle NERDTree with <leader>d
map <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
" 
" " search next/previous -- center in page
nmap n nzz
nmap N Nzz
nmap * *Nzz
nmap # #nzz
" 
" " Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$
" 
" 
" toggle Quickfix window with <leader>q

function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>


" Having this set will not leave any additional file(s) around after having closed VIM. This is what most people might be looking to have set.
set nobackup

" The default is :set writebackup This will keep a backup file while the file is being worked. Once VIM is closed; the backup will vanish.
set nowritebackup
 
"   set autoindent		" always set autoindenting on
" 
" endif " has("autocmd")
" 
" Leader shortcuts for Rails commands
map <leader>m :Rmodel 
map <leader>c :Rcontroller 
map <leader>v :Rview 
 
" 
"
" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

call pathogen#infect()
call pathogen#helptags()

" Lodestone's vimrc

" Several from: http://items.sjbach.com/319/configuring-vim-right
" ---------------------------------------------------------------

" These two enable syntax highlighting
" We're running Vim, not Vi!
set nocompatible
" Enable syntax highlighting
syntax on


" Change <leader> to ,
let mapleader = ","
" This fixes the Command-T Arrow keys in vim console
" set notimeout		    " don't timeout on mappings
" set ttimeout		    " do timeout on terminal key codes
" set timeoutlen=100	" timeout after 100 msec

" Set a temporary background color.
"  I use this to differentiate 
"  visually between windows easily.
function! SetBackground(color)
  let setbg=':highlight Normal guibg=' . a:color
  exec setbg
endfunction

command! -nargs=? BackgroundColor :call SetBackground(<f-args>)
" nmap <leader>bg :call s:colour_hex()
nmap <leader>bg :BackgroundColor #

" Autoload and save session
let g:session_autosave = 1
let g:session_autoload = 1

"Show syntax highlighting groups for word under cursor
map <C-S-I> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val,  "name")')
endfunc


" For some reason my colorscheme only works if I do vibrantink first...
" TODO: Investigate why this is
colorscheme vibrantink
colorscheme lodestone
" Other nifty colorschemes
" colorscheme molokai
" colorscheme blackboard
" colorscheme ir_black
" colorscheme railscasts

" don't fake me out by appearing as if there is more than one line
set nowrap


" Softtabs, 2 spaces - I like 2 space indentation. 
" I get to see more on the screen
set tabstop=2
set shiftwidth=2

" don't use a real Tab, use spaces please.
set expandtab

" case-sensitive only if there is a capital letter in the search expression
set ignorecase
set smartcase

" see :help shortmess
set shortmess=atI

" Don't ding
" set visualbell
      
" make tabs and trailing spaces visible when requested:
" set list listchars=tab:»·,trail:· ",eol:$
" nmap <silent> <leader>ss :set nolist!<CR>

set hidden


" :W works like :w
" adding the ! overwrites a command, this gives a polite error upon reparsing
" if not set
command! WRITE write

" Increase history
set history=500

" Quick timeouts on key combinations.
set timeoutlen=600

" Send contents of current file to private gist
map gist :Gist -p<CR>
let g:gist_open_browser_after_post = 1

" Quick edit .vimrc
map <leader>vc :e ~/.vimrc<CR>
" Quick edit my color scheme
map <leader>vl :e ~/.vim/colors/lodestone.vim<CR>

" Quick switch to last buffer without reaching up to the caret ^
map <C-k><C-k> :b#<CR>

vmap > >gv
vmap < <gv

" Use TAB to switch to next buffer
" nmap <tab> :bn<CR>

" Make spacebar behave like a webpage
" nmap <space> 10<Down>
" nmap <S-space> 10<Up>

" Search in Project (Ack.vim)
map <leader>a :Ack 
" Find All
map <leader>fa :Ack 
map <leader>cn :cnext<CR>
map <leader>cp :cprevious<CR>
map <leader>cN :cprevious<CR>

" nmap lj :BufExplorerHorizontalSplit<CR>

" ` is more useful than ' but less accessible.
" Makes ' move to line AND column
nnoremap ' `
nnoremap ` '

" TextMate fuzzy finder with <leader>t
let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 20


" make mouse work in console mode vim
set mouse=nv

map <leader>rake :Rake<CR>

"map <silent> <leader>t :FuzzyFinderTextMate<CR>
" map <leader>t :FuzzyFinderTextMate<CR>
" Find Buffer
map <leader>fb :FuzzyFinderBuffer<CR>
map <leader>ff :FuzzyFinderBuffer<CR>

" Find file in current buffer's Directory
map <leader>fd :FuzzyFinderFileWithCurrentBufferDir<CR>

" Find Recent
map <leader>fr :FuzzyFinderMruFile<CR>

" Set default quick-switch with double leader
" map <leader><leader> :BufExplorerHorizontalSplit<CR>
" map <leader><leader> :BufExplorer<CR>
map <leader><leader> :CommandTBuffer<CR>
let g:bufExplorerSplitVertSize=20
" let g:bufExplorerSplitHorizSize=20

" Change directory for project:
map <leader>kp :cd ~/projects/

" Open NERD Tree
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
" Mirror NERD Tree
" map <leader>dd :execute 'NERDTreeMirror'<CR>

" Capitalize/Uncapitalize Current word
" map <Leader>C mzb~`z

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

" Note: Pick some mappings for these:
"map <silent> <LocalLeader>rb :RunAllRubyTests<CR>
"map <silent> <LocalLeader>rc :RunRubyFocusedContext<CR>
"map <silent> <LocalLeader>rf :RunRubyFocusedUnitTest<CR>

" Yank all -- Can also do standard: ggyG
map <leader>yall :%y<CR>

" I can't seem to reach $ as easily as I _should_ (double meaning)
nmap - $

autocmd BufRead,BufNewFile *.js set ft=javascript.jquery

" Change which file opens after executing :Rails command
" let g:rails_default_file='config/routes.rb

" current directory is always matching the
" content of the active window
" set autochdir

" Set up a key to refresh FuzzyFinder list:
map <special> <F12> :ruby finder.rescan!<ENTER>

" TODO Reload .vimrc (and .gvimrc)
map <special> <F8> :source $MYVIMRC<CR> 
" :source $MYGVIMRC<ENTER>

" I want this:
"Adding #{} to AutoClose Plugin and activating it for String interpolation
" using delimitMate now
 

" highlight the current line and column the cursor is on
" set cursorline
set nocursorline
" set cursorcolumn!

" 
" function! PreviewMKD()
" ruby << EOF
"   require 'rubygems'
"   require 'bluecloth'
"   parser = BlueCloth
"   t = ""
"   VIM::Buffer.current.count.times {|i| t += "#{VIM::Buffer.current[i + 1]}\\n"}
"   html_file = VIM::Buffer.current.name.gsub(/.(md|mkd)$/, '.html')
"   if html_file == VIM::Buffer.current.name
"     print "Error! - This file extension is not supported for Markdown previews"
"   end
"   File.open(html_file, 'w') do |f|
"     f.write(parser.new(t).to_html)
"   end
"   system("open #{html_file}")
" EOF
" endfunction

" map <leader>p :call PreviewMKD()<CR>

" By default, pressing <TAB> in command mode will choose the first 
" possible completion with no indication of how many others there might be. 
" The following configuration lets you see what your other options are:
set wildmenu

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
filetype on
filetype plugin on
filetype indent on

" Omnicomplete mode on
set ofu=syntaxcomplete#Complete

" Let SuperTab determine the completion mode
let g:SuperTabDefaultCompletionType = "context" 

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

" --------------------------------------------------------------
"
" The following is picked from a peck of Pickled Vim Configuration.
" Thanks technicalpickles

" Section: configuration
"
scriptencoding utf-8


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
set list listchars=tab:»·,trail:·

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault

" Nice statusbar
" set statusline+=%B\  " shows hex byte of char under cursor
set laststatus=2
set statusline=\ "
set statusline+=%f\ " file name
set statusline+=[
set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&fileformat}] " file format
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=%= " right align
set statusline+=%-16.(%l/%L,%c%V%)\ %<%P\  " offset

" enable setting title
" set title
" configure title to look like: Vim /path/to/file
" set titlestring=VIM:\\ %-25.55F\\ %a%r%m titlelen=70

" can has foldin plz?
set foldenable
set foldmethod=syntax
set foldlevel=999 " make it really high, so they're not displayed by default
  

" Turn on rails bits of statusbar
let g:rails_statusline=0
let g:rails_defalt_file="config/routes.rb"

let g:delimitMate_autoclose=0
let g:delimitMate_smart_quotes=0
" Don't quit NERDTree after openning a file
let NERDTreeQuitOnOpen=0
" colored NERD Tree
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeShowHidden = 1
" map enter to activating a node
let NERDTreeMapActivateNode='<CR>'
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

" Section: functions

  " function! s:RunShellCommand(cmdline)
  "   botright new

  "   setlocal buftype=nofile
  "   setlocal bufhidden=delete
  "   setlocal nobuflisted
  "   setlocal noswapfile
  "   setlocal nowrap
  "   setlocal filetype=shell
  "   setlocal syntax=shell

  "   call setline(1,a:cmdline)
  "   call setline(2,substitute(a:cmdline,'.','=','g'))
  "   execute 'silent $read !'.escape(a:cmdline,'%#')
  "   setlocal nomodifiable
  "   1
  " endfunction

  " Open the Rails ApiDock page for the word under cursor, using the 'open'
  " command
  " function! OpenRailsDoc(keyword)
  "   let url = 'http://apidock.com/rails/'.a:keyword
  "   exec '!'.g:browser.' '.url
  " endfunction

  " Open the Ruby ApiDock page for the word under cursor, using the 'open'
  " command
  " function! OpenRubyDoc(keyword)
  "   let url = 'http://apidock.com/ruby/'.a:keyword
  "   exec '!'.g:browser.' '.url
  " endfunction


" Section: mappings

" Tab navigation
"nmap <leader>tn :tabnext<CR>
"nmap <leader>tp :tabprevious<CR>
"nmap <leader>te :tabedit

" Exit Insert mode quickly without ESC
imap jl <Esc>

" insert hashrocket, =>, with control-l
imap <C-l> <Space>=><Space>

" Toggle NERDTree with <leader>d
map <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" search next/previous -- center in page
nmap n nzz
nmap N Nzz
nmap * *Nzz
nmap # #nzz

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Hide search highlighting
map <silent> <leader>nh :nohls <CR>

command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

" toggle Quickfix window with <leader>q
map <silent> <leader>q :QFix<CR>

" nnoremap <leader>irb :<C-u>below new<CR>:setfiletype irb<CR>:set syntax=ruby<CR>:set buftype=nofile<CR>:set bufhidden=delete<CR>i

" Easily lookup documentation on apidock
" noremap <leader>rb :call OpenRubyDoc(expand('<cword>'))<CR>
" noremap <leader>rr :call OpenRailsDoc(expand('<cword>'))<CR>

" Having this set will not leave any additional file(s) around after having closed VIM. This is what most people might be looking to have set.
set nobackup

" 
" The default is :set writebackup This will keep a backup file while the file is being worked. Once VIM is closed; the backup will vanish.
set nowritebackup

 
" From the VIM help file.
" - Don’t use this for big files.
" - Recovery will be impossible!
" In essence; if security is a concern, use noswapfile. Keep in mind that this option will keep everything in memory.
" set noswapfile

" Simplify window navigation
" vim supports splitting a window vertically and horizontally, and then navigating between them. 
" The default way kinda hurts my hands.
" Let’s reduce it to <leader>s to split horizontally,
" <leader>v to split vertically, and <leader>w to cycle to the next window.

" window splitting mappings
" split vertically with <leader> v
" split horizontally with <leader> s
"nmap <leader>v :vsplit<CR> <C-w><C-w>
"nmap <leader>s :split<CR> <C-w><C-w>

" Make it way easier to switch windows (<leader>w)
" nmap <leader>w <C-w><C-w>_

" Show only the current window/tab/whatevers
nmap <leader>o :only<CR>

" http://github.com/jferris/config_files/ Joe Ferris
" " This is an alternative that also works in block mode, but the deleted
" " text is lost and it only works for putting the current register.
" "vnoremap p "_dp
" 
" " Switch syntax highlighting on, when the terminal has colors
" " Also switch on highlighting the last used search pattern.
" if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
"   syntax on
"   set hlsearch
" endif
" 
" " Only do this part when compiled with support for autocommands.
" if has("autocmd")
" 
"   " Enable file type detection.
"   " Use the default filetype settings, so that mail gets 'tw' set to 72,
"   " 'cindent' is on in C files, etc.
"   " Also load indent files, to automatically do language-dependent indenting.
"   filetype plugin indent on
" 
"   " Put these in an autocmd group, so that we can delete them easily.
"   augroup vimrcEx
"   au!
" 
"   " For all text files set 'textwidth' to 78 characters.
"   autocmd FileType text setlocal textwidth=78
" 
"   " When editing a file, always jump to the last known cursor position.
"   " Don't do it when the position is invalid or when inside an event handler
"   " (happens when dropping a file on gvim).
"   autocmd BufReadPost *
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \ endif
" 
"   augroup END
" 
" else
" 
"   set autoindent		" always set autoindenting on
" 
" endif " has("autocmd")
" 
" " if has("folding")
"   " set foldenable
"   " set foldmethod=syntax
"   " set foldlevel=1
"   " set foldnestmax=2
"   " set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
" " endif
" 
" 
" " Leader shortcuts for Rails commands
map <leader>m :Rmodel 
map <leader>c :Rcontroller 
map <leader>v :Rview 
" map <Leader>u :Runittest 
" map <Leader>f :Rfunctionaltest 
" map <Leader>tm :RTmodel 
" map <Leader>tc :RTcontroller 
" map <Leader>tv :RTview 
" map <Leader>tu :RTunittest 
" map <Leader>tf :RTfunctionaltest 
" map <Leader>sm :RSmodel 
" map <Leader>sc :RScontroller 
" map <Leader>sv :RSview 
" map <Leader>su :RSunittest 
" map <Leader>sf :RSfunctionaltest 
" 
" " Hide search highlighting
" map <Leader>h :set invhls <CR>
" 
" " Opens an edit command with the path of the currently edited file filled in
" " Normal mode: <Leader>e
" map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" 
" " Opens a tab edit command with the path of the currently edited file filled in
" " Normal mode: <Leader>t
" map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
" 
" " Inserts the path of the currently edited file into a command
" " Command mode: Ctrl+P
" cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
" 
" " Maps autocomplete to tab
" imap <Tab> <C-N>
" 
" " Duplicate a selection
" " Visual mode: D
" vmap D y'>p
" 
" " Press ^F from insert mode to insert the current file name
" imap <C-F> <C-R>=expand("%")<CR>
" 
" " Press Shift+P while in visual mode to replace the selection without
" " overwriting the default register
" vmap P p :call setreg('"', getreg('0')) <CR>
" 
" " Display extra whitespace
" set list listchars=tab:»·,trail:·
" 
" Edit routes
command! Rroutes :e config/routes.rb
command! RTroutes :tabe config/routes.rb
" 
" " Local config
" if filereadable(".vimrc.local")
"   source .vimrc.local
" endif
" 
" " Use Ack instead of Grep when available
" if executable("ack")
"   set grepprg=ack\ -H\ --nogroup\ --nocolor
" endif
" 
" 
" 
" " Tab completion options
" " (only complete to the longest unambiguous match, and show a menu)
" set completeopt=longest,menu
" set wildmode=list:longest,list:full
" set complete=.,t
" 
" 
" " Tags
" let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
" 
call pathogen#runtime_append_all_bundles() 


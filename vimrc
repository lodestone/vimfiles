" Lodestone's vimrc

colorscheme vibrantink
colorscheme lodestone
" colorscheme molokai
" colorscheme blackboard
" colorscheme ir_black

"set guifont=Monaco:h10
" Turn on line numbering
" set number

" don't fake me out by appearing as if there is more than one line
set nowrap

" These two enable syntax highlighting
" We're running Vim, not Vi!
set nocompatible
" Enable syntax highlighting
syntax on

" Several from: http://items.sjbach.com/319/configuring-vim-right
" ---------------------------------------------------------------
set hidden

" Change <leader> to ,
let mapleader = ","

command WRITE write
" Increase history
" set history=1000

" Send file to gist
map gist :Gist -p<CR>
let g:gist_open_browser_after_post = 1

" Quick edit .vimrc
map <leader>vc :e ~/.vimrc<CR>

" Use TAB to switch to next buffer
" nmap <tab> :bn<CR>

" Make spacebar behave like a webpage
" nmap <space> 10<Down>
" nmap <S-space> 10<Up>


"map <leader>sh :!zsh<CR>

" TextMate fuzzy finder with <leader>t
let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 30


map <leader>rake :Rake<CR>

"map <silent> <leader>t :FuzzyFinderTextMate<CR>
" map <leader>t :FuzzyFinderTextMate<CR>
map <leader>fb :FuzzyFinderBuffer<CR>
map <leader>fr :FuzzyFinderMruFile<CR>

" TextMate fuzzy finder in a new horizontal split window
"map <silent> <leader>st <C-w><C-s>:FuzzyFinderTextMate<CR>
" TextMate fuzzy finder in a new vertical split window
"map <silent> <leader>vt <C-w><C-v>:FuzzyFinderTextMate<CR>

" Change directory for project:
" map <C-k>p :cd ~/projects/
" map <C-k><C-p> :cd ~/projects/
map <leader>kp :cd ~/projects/

" Open NERD Tree
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
" Mirror NERD Tree
map <leader>dd :execute 'NERDTreeMirror'<CR>

" Capitalize/Uncapitalize Current word
map <leader>C mzb~`z

" RIP joe, you were a great friend...
" joe compatibility mode: 
map <C-k>x :x<CR>
map <C-k><C-x> :x<CR>
map <C-k>e :e 
map <C-k><C-e> :e 
map <C-k>d :w<CR> 
map <C-k><C-d> :w<CR> 

map <C-k>n :bn<CR>
map <C-k>p :bp<CR>

" These are standard bash/emacs/macos text movement/manipulation
cmap <C-a> <Home>
cmap <C-e> <End>
imap <C-a> <Home>
vmap <C-a> <Home>
omap <C-a> <Home>
imap <C-e> <End>
vmap <C-e> <End>
omap <C-e> <End>
inoremap <C-d> <Del>
vnoremap <C-d> <Del>
onoremap <C-d> <Del>
cnoremap <C-k> <C-f>d$<C-c><End>
imap <C-k> <C-o>d$

" Note: Pick some mappings for these:
"map <silent> <LocalLeader>rb :RunAllRubyTests<CR>
"map <silent> <LocalLeader>rc :RunRubyFocusedContext<CR>
"map <silent> <LocalLeader>rf :RunRubyFocusedUnitTest<CR>

" Note: bde selects and deletes the current word.
" Note: so does diw
" Yank all -- Can also do standard: ggyG
map <leader>ya :%y<CR>

" FuzzyFinder tags with <leader>T
"nnoremap <silent> <leader>T :FuzzyFinderTag!<CR>

" For my sanity
" Switch j k
" noremap j k
" noremap k j
 
" I can't seem to reach $ as easily as I "should" (double meaning)
nmap - $

autocmd BufRead,BufNewFile *.js set ft=javascript.jquery


" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'



" Set up a key to refresh FuzzyFinder list:
map <special> <F12> :ruby finder.rescan!<ENTER>

" TODO Reload .vimrc (and .gvimrc)
"map <special> <F11> :source $MYVIMRC<ENTER>:source $MYGVIMRC<ENTER>

" I want this:
"Adding #{} to AutoClose Plugin and activating it for String interpolation
"let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'} 
"let g:AutoCloseProtectedRegions = ["Character"] 
 

" highlight the current line and column the cursor is on
set cursorline
" set cursorcolumn!



function! PreviewMKD()
ruby << EOF
  require 'rubygems'
  require 'bluecloth'
  parser = BlueCloth
  t = ""
  VIM::Buffer.current.count.times {|i| t += "#{VIM::Buffer.current[i + 1]}\n"}
  html_file = VIM::Buffer.current.name.gsub(/.(md|mkd)$/, '.html')
  if html_file == VIM::Buffer.current.name
    print "Error! - This file extension is not supported for Markdown previews"
  end
  File.open(html_file, 'w') do |f|
    f.write(parser.new(t).to_html)
  end
  system("open #{html_file}")
EOF
endfunction

map <Leader>p :call PreviewMKD()<CR>







































" mapclear <leader>tt           
" 
" mapclear <leader>tsq          
" mapclear <leader>tsp          
" mapclear <leader>tml          
" mapclear <leader>tab          
" 
" mapclear <leader>t@           
" mapclear <leader>t~           
" mapclear <leader>t?           
" mapclear <leader>ts=          
" mapclear <leader>ts<          
" mapclear <leader>ts;          
" mapclear <leader>ts:          
" mapclear <leader>ts,          
" mapclear <leader>t=           
" mapclear <leader>t<           
" mapclear <leader>t;           
" mapclear <leader>t:           
" mapclear <leader>t,           
" mapclear <leader>t#           
" mapclear <leader>t|           
" mapclear <leader>t<C-L>       

" By default, pressing <TAB> in command mode will choose the first 
" possible completion with no indication of how many others there might be. 
" The following configuration lets you see what your other options are:
set wildmenu

" To have the completion behave similarly to a shell, 
" i.e. complete only up to the point of ambiguity 
" (while still showing you what your options are), also add the following:
" This is set in the Pickles section below
" set wildmode=list:longest

set title

set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp


" Intuitive backspacing in insert mode
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


  " Enable filetype-specific indenting and plugins
  filetype plugin indent on

  " show the `best match so far' as search strings are typed
  set incsearch

  " Highlight search results once found:
  set hlsearch

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

  " Enable tab complete for commands.
  " first tab shows all matches. next tab starts cycling through the matches
  set wildmenu
  set wildmode=list:longest,full

  " Display extra whitespace
  "set list listchars=tab:»·,trail:·

  " assume the /g flag on :s substitutions to replace all matches in a line:
  set gdefault

  " Load matchit (% to bounce from do to end, etc.)
  runtime! macros/matchit.vim

  " Nice statusbar
  set laststatus=2
  set statusline=\ "
  set statusline+=%f\ " file name
  set statusline+=[
  set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
  set statusline+=%{&fileformat}] " file format
  set statusline+=%h%1*%m%r%w%0* " flag
  set statusline+=%= " right align
  set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

  " enable setting title
  set title
  " configure title to look like: Vim /path/to/file
  set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

  " Make backspace work in insert mode
  set backspace=indent,eol,start

  " can has foldin plz?
  set foldenable
  set foldmethod=syntax
  set foldlevel=999 " make it really high, so they're not displayed by default
  

  " Turn off rails bits of statusbar
  let g:rails_statusline=0

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
  " let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"
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
  let g:rubycomplete_rails = 1


  " have some fun with bufexplorer
  " let g:bufExplorerDefaultHelp=0       " Do not show default help.
  let g:bufExplorerShowRelativePath=1  " Show relative paths.

" IRB {{{
  " autocmd FileType irb inoremap <buffer> <silent> <CR> <Esc>:<C-u>ruby v=VIM::Buffer.current;v.append(v.line_number, eval(v[v.line_number]).inspect)<CR>

" Section: functions

  function! s:RunShellCommand(cmdline)
    botright new

    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal nobuflisted
    setlocal noswapfile
    setlocal nowrap
    setlocal filetype=shell
    setlocal syntax=shell

    call setline(1,a:cmdline)
    call setline(2,substitute(a:cmdline,'.','=','g'))
    execute 'silent $read !'.escape(a:cmdline,'%#')
    setlocal nomodifiable
    1
  endfunction

  " Open the Rails ApiDock page for the word under cursor, using the 'open'
  " command
  function! OpenRailsDoc(keyword)
    let url = 'http://apidock.com/rails/'.a:keyword
    exec '!'.g:browser.' '.url
  endfunction

  " Open the Ruby ApiDock page for the word under cursor, using the 'open'
  " command
  function! OpenRubyDoc(keyword)
    let url = 'http://apidock.com/ruby/'.a:keyword
    exec '!'.g:browser.' '.url
  endfunction

" Section: commands

  " Shell
  " command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)

  " Ruby code metrics
  " command! -complete=file -nargs=+ Reek :Shell reek <q-args>
  " command! -complete=file -nargs=+ Roodi :Shell roodi <q-args>
  " command! -complete=file -nargs=+ Flog :Shell flog -m -I lib <q-args> 2>/dev/null

" Section: mappings

  " Tab navigation
  "nmap <leader>tn :tabnext<CR>
  "nmap <leader>tp :tabprevious<CR>
  "nmap <leader>te :tabedit

  " Remap F1 from Help to ESC.  No more accidents.
  " nmap <F1> <Esc>
  " map! <F1> <Esc>

  nmap <leader>sh :Shell

  " Quick way to leave insert mode, without leaving homerow
  imap ii <Esc>

  " insert hashrocket, =>, with control-l
  imap <C-l> <Space>=><Space>

  " align hashrockets with <leader>t control-l
  " vmap <leader>t<C-l> :Align =><CR>

  " Toggle NERDTree with <leader>d
  map <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

  " TextMate fuzzy finder with <leader>t
  "map <silent> <leader>t :FuzzyFinderTextMate<CR>
  " TextMate fuzzy finder in a new horizontal split window
  " map <silent> <leader>st <C-w><C-s>:FuzzyFinderTextMate<CR>
  " TextMate fuzzy finder in a new vertical split window 
  " map <silent> <leader>vt <C-w><C-v>:FuzzyFinderTextMate<CR>

  " FuzzyFinder tags with <leader>T
  " nnoremap <silent> <leader>T :FuzzyFinderTag!<CR>

  " <leader>F to begin searching with ack
  "map <leader>F :Ack<space>

  " search next/previous -- center in page
  nmap n nzz
  nmap N Nzz
  nmap * *Nzz
  nmap # #nzz

  " Yank from the cursor to the end of the line, to be consistent with C and D.
  nnoremap Y y$

  " Hide search highlighting
  map <silent> <leader>nh :nohls <CR>

  " toggle Quickfix window with <leader>q
  map <silent> <leader>q :QFix<CR>

  " nnoremap <leader>irb :<C-u>below new<CR>:setfiletype irb<CR>:set syntax=ruby<CR>:set buftype=nofile<CR>:set bufhidden=delete<CR>i

" Easily lookup documentation on apidock
noremap <leader>rb :call OpenRubyDoc(expand('<cword>'))<CR>
noremap <leader>rr :call OpenRailsDoc(expand('<cword>'))<CR>


" bind command-/ to toggle comment
" requires NERD Commenter to be installed: http://www.vim.org/scripts/script.php?script_id=1218
" nmap <D-/> ,c<space>
" vmap <D-/> ,c<space>
" imap <D-/> <C-O>,c<space>

"Simplify window navigation
"vim supports splitting a window vertically and horizontally, and then navigating between them. The default way kinda hurts my hands. Let’s reduce it to \s to split horizontally, \v to split vertically, and \w to cycle to the next window.

" window splitting mappings
" split vertically with <leader> v
" split horizontally with <leader> s
"nmap <leader>v :vsplit<CR> <C-w><C-w>
"nmap <leader>s :split<CR> <C-w><C-w>

" Make it way easier to switch windows (<leader>w)
"nmap <leader>w <C-w><C-w>_

" http://github.com/jferris/config_files/ Joe Ferris
" " Use Vim settings, rather then Vi settings (much better!).
" " This must be first, because it changes other options as a side effect.
" set nocompatible
" 
" " allow backspacing over everything in insert mode
" set backspace=indent,eol,start
" 
" set nobackup
" set nowritebackup
" set history=50		" keep 50 lines of command line history
" set ruler		" show the cursor position all the time
" set showcmd		" display incomplete commands
" set incsearch		" do incremental searching
" 
" " Don't use Ex mode, use Q for formatting
" map Q gq
" 
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
"     \   exe "normal g`\"" |
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
" " Softtabs, 2 spaces
" set tabstop=2
" set shiftwidth=2
" set expandtab
" 
" " Always display the status line
" set laststatus=2
" 
" " \ is the leader character
" let mapleader = "\\"
" 
" " Edit the README_FOR_APP (makes :R commands work)
" map <Leader>R :e doc/README_FOR_APP<CR>
" 
" " Leader shortcuts for Rails commands
" map <Leader>m :Rmodel 
" map <Leader>c :Rcontroller 
" map <Leader>v :Rview 
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
" " For Haml
" au! BufRead,BufNewFile *.haml         setfiletype haml
" 
" " No Help, please
" nmap <F1> <Esc>
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
" " Edit routes
" command! Rroutes :e config/routes.rb
" command! RTroutes :tabe config/routes.rb
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
" " Color scheme
" colorscheme vividchalk
" highlight NonText guibg=#060606
" highlight Folded  guibg=#0A0A0A guifg=#9090D0
" 
" " Numbers
" set number
" set numberwidth=5
" 
" " Snippets are activated by Shift+Tab
" let g:snippetsEmu_key = "<S-Tab>"
" 
" " Tab completion options
" " (only complete to the longest unambiguous match, and show a menu)
" set completeopt=longest,menu
" set wildmode=list:longest,list:full
" set complete=.,t
" 
" " case only matters with mixed case expressions
" set ignorecase
" set smartcase
" 
" " Tags
" let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"
" 

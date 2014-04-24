" Lodestone's vimrc

" These two enable syntax highlighting
" We're running Vim, not Vi!
set nocompatible

" Set my colorscheme
" colorscheme lodestone-dark
colorscheme iceberg

filetype off

set hidden

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'vundle'
" Bundle 'bling/vim-airline'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'Tabular'
Bundle 'rking/ag.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neomru.vim'
Bundle 'Shougo/vimshell.vim'
Bundle 'Shougo/unite.vim'
Bundle 'honza/vim-snippets'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'basyura/unite-rails'
Bundle 'h1mesuke/unite-outline'
Bundle 'xolox/vim-misc' 
Bundle 'xolox/vim-session'
" Bundle 'mkitt/tabline.vim'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'ton/vim-bufsurf'
Bundle 'davidoc/taskpaper.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'int3/vim-extradite'
Bundle 'Sixeight/unite-grep'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'haya14busa/vim-easyoperator-line'
Bundle 'haya14busa/vim-easyoperator-phrase'
Bundle 'mhinz/vim-startify'
Bundle 'kmnk/vim-unite-giti'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'lilydjwg/colorizer'
Bundle 'Keithbsmiley/rspec.vim'
Bundle 'thoughtbot/vim-rspec'
Bundle 'airblade/vim-rooter'
Bundle 'itchyny/lightline.vim'


" Set Autoload Session
let g:session_autoload = 'yes'

" Make help open full screen
au BufEnter * if &buftype=='help'|set awa|only|endif 

" No wrap
set nowrap

" Enable syntax highlighting
syntax on

" utf-8
scriptencoding utf-8

" Set spell check
set nospell

" Line numbers
set number 

set laststatus=2

set t_Co=256


" Change <leader> to , because I don't want carpool tunnel syndrome
let mapleader = ","

" Set a temporary background color.
"  I use this to differentiate 
"  visually between windows easily.
"  ,bg (Works in MacVim)
function! SetBackground(color)
  let setbg=':highlight Normal guibg=' . a:color
  exec setbg
  " let setbg=':highlight Normal ctermbg=' . a:color
  " exec setbg
endfunction
command! -nargs=? BackgroundColor :call SetBackground(<f-args>)
nmap <leader>bg :BackgroundColor #

" Switch to project directory with ,kp
function! ChangeToProject(project)
  let setdir=':cd ~/' . a:project
  let settree=':NERDTreeCWD'
  " . a:project
  exec setdir
  exec settree
endfunction
command! -complete=file -nargs=? ChangeProject :call ChangeToProject(<f-args>) 
nmap <leader>kp :ChangeProject 

" Set Airline Theme
" let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1

" Autoload and save session
let g:session_autosave = 'yes'

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

" case-sensitive only if there is a capital letter in the search expression
set ignorecase
set smartcase

" see :help shortmess
set shortmess+=atI
 
" Don't ding
set visualbell
      
" make tabs and trailing spaces visible when requested:
set list listchars=tab:»·,trail:· ",eol:$
nmap <silent> <leader>ss :set nolist!<CR>

" :W works like :w
" adding the ! overwrites a command, this gives a polite error upon reparsing if not set
command! WRITE write

" Increase history
set history=1500

" Quick timeouts on key combinations.
set timeoutlen=550

" Use spacebar in normal mode like a web browser
map <Space> 20j
map <S-Space> 20k

" Send contents of current file to private gist
map gist :Gist -p<CR>
let g:gist_open_browser_after_post = 1

" Quick edit Vim Config (.vimrc)
map <leader>vc :e ~/.vimrc<CR>

" Quick edit my color scheme
map <leader>vl :e ~/.vim/colors/lodestone.vim<CR>

" Quick switch to last buffer without reaching up to the caret ^
map <C-k><C-k> :b#<CR>
map <leader><leader> <C-^>

map <leader> <Plug>(easymotion-prefix)

vmap > >gv
vmap < <gv
nmap > >>
nmap < <<

" I can't seem to reach $ as easily as I _should_ (double meaning)
nmap - $

" Find All
map <leader>fa :Ag ""<LEFT>

" Show only the current window/tab/whatevers
nmap <leader>o :only<CR>

" make mouse work in console mode vim
set mouse=a

" Buffer movement
" nmap <C-j> :BufSurfBack<CR>
" nmap <C-h> :BufSurfBack<CR>
" nmap <C-k> :BufSurfForward<CR>
" nmap <C-l> :BufSurfForward<CR>

" Used by autocomplete
" nmap <C-n> <Down>
" nmap <C-p> <Up>

" Let tilde do some cools stuffs
set tildeop 

" Who uses plain javascript?
autocmd BufRead,BufNewFile *.js set ft=javascript.jquery

" highlight the current line 
set cursorline

" By default, pressing <TAB> in command mode will choose the first 
" possible completion with no indication of how many others there might be. 
" The following configuration lets you see what your other options are:
set wildmenu
" first tab shows all matches. next tab starts cycling through the matches
set wildmode=list:longest,full
set wildignore+=*.o,*.fasl,*.git/*,*.DS_Store

" To have the completion behave similarly to a shell, 
" i.e. complete only up to the point of ambiguity 
" (while still showing you what your options are), also add the following:
" This is set in the Pickles section below
" set wildmode=list:longest

set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Intuitive backspacing in insert mode
" (allow backspacing over everything in insert mode)
set backspace=indent,eol,start

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
filetype plugin indent on

" Highlight search terms...
set hlsearch

" ... dynamically as they are typed.
set incsearch 

" flash matching brackets or parentheses
set showmatch

" help with backspacing because of expandtab
set smarttab

" Set temporary directory (don't litter local dir with swp/tmp files)
set directory=/tmp/

" When scrolling off-screen do so 3 lines at a time, not 1
set scrolloff=3

" Set the left column to a nice width
setlocal numberwidth=5

" Toggle Paste mode
set pastetoggle=<F5>

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault

" Folding
set foldenable
set foldmethod=syntax
set foldlevel=999 " make it really high, so they're not displayed by default

" Turn on rails bits of statusbar
let g:rails_statusline=0
let g:rails_defalt_file="config/routes.rb"

" let g:delimitMate_autoclose=0
" let g:delimitMate_smart_quotes=0

" NERDTree Options
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_focus_on_files = 1
" colored NERD Tree
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeShowHidden = 0
let NERDTreeIgnore=['\.git','\.DS_Store']

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
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd FileType c set omnifunc=ccomplete#Complete
" autocmd FileType coffee set omnifunc=javascriptcomplete#CompleteJS
let g:rubycomplete_rails = 1

" Exit Insert mode quickly without ESC
imap jl <Esc>

" Toggle NERDTree with <leader>d
" map <silent> <leader>d :execute 'NERDTreeTabsToggle ' . getcwd()<CR>
map <silent> <leader>d :execute 'NERDTreeMirrorToggle '<CR>
map <C-S-r> :execute 'NERDTreeFind '<CR>

" comment out a line
nmap <leader>cc gcc

" search next/previous -- center in page
nmap n nzz
nmap N Nzz
nmap * *Nzz
nmap # #nzz

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$
nnoremap ; :
" nnoremap : ;


" Map <C-*> to grep the word under the cursor
" nmap <C-S-8> :Grep<CR> 

" Yank all -- Can also do standard: ggyG
map <leader>yall :%y<CR>

" fix meta-keys which generate <Esc>a .. <Esc>z
let c='a'
while c <= 'z'
  exec "set <M-".toupper(c).">=\e".c
  exec "imap \e".c." <M-".toupper(c).">"
  let c = nr2char(1+char2nr(c))
endw

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

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Let tab move between open windows
nmap <Tab> <C-w><C-w>

" Let's not get crazy here. No folding please.
let g:vim_markdown_folding_disabled=1

" NeoComplete
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#force_overwrite_completefunc = 1

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><CR>  pumvisible() ? "\<C-n>".neocomplete#close_popup() : "\<CR>"
inoremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : "\<CR>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 0

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*:'

 
" NeoSnippet
" Plugin key-mappings
" imap <C-Space>     <Plug>(neosnippet_expand_or_jump)
" smap <C-Space>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-Space>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Make <C-/> work for comment/uncomment
nmap <S-/> gcc
vmap <S-/> gcc
nmap <C-_> gcc
vmap <C-_> gcc

filetype plugin indent on

autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
set title

" Unite.vim settings
" -----------------------------------
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_prompt='» '
let g:unite_enable_short_source_names = 0
let g:unite_source_file_mru_long_limit = 16
let g:unite_source_directory_mru_long_limit = 16
let g:unite_source_grep_command="ag"

" sort file results by length
" call unite#custom#source('file', 'sorters', 'sorter_length')
" call unite#custom#source('file_rec/async', 'sorters', 'sorter_length')
" call unite#custom#source('file_mru', 'sorters', 'sorter_length')
" call unite#custom#source('rails/model', 'sorters', 'sorter_length')

call unite#custom#source('file', 'sorters', 'sorter_selecta')
" call unite#custom#source('file_rec/async', 'sorters', 'sorter_selecta')
call unite#custom#source('file_mru', 'sorters', 'sorter_selecta')
call unite#custom#source('rails/model', 'sorters', 'sorter_selecta')
call unite#custom#source('rails/controller', 'sorters', 'sorter_selecta')
call unite#custom#source('buffer', 'sorters', 'sorter_selecta')

" limit results for recently edited files
call unite#custom#source('file_mru', 'max_candidates', 20)
call unite#custom#source('file_rec/async', 'max_candidates', 0)

" ignored files for file_mru
" call unite#custom#source('file_mru', 'ignore_pattern', 'COMMIT_EDITMSG')

" sort buffers by number
call unite#custom#source('buffer', 'sorters', 'sorter_selecta')

" noremap <C-@> :Unite buffer tab file_rec/async file_mru<CR>
" noremap <A-Space> :Unite buffer tab file_rec/async file_mru<CR>

" Find Function / Action
map  <D-P> :Unite command mapping function<CR>
" Find Anything
map  <D-p> :Unite -unique buffer tab file_rec/async<CR>
" Find open file
map  <D-b> :Unite buffer tab<CR>
" Find method (CTAGS)
map  <D-r> :Unite outline<CR>

" Find by git status
map <D-B> :Unite giti/status<CR>

"bind command-] to indent
nmap <D-]> >
vmap <D-]> >gv
imap <D-]> <C-O>>

"bindcommand-[ to outdent
nmap <D-[> <
vmap <D-[> <gv
imap <D-[> <C-O><

map <D-o> :!open %<CR><CR>


" map  <D-t> <D-p>
" nmap <C-p> <D-p>

" nmap <C-k> :Unite command function mapping register<CR>
map  <leader>fx :Unite command function mapping register<CR>
map  <leader>fr :Unite file_mru<CR>
map  <leader>fb :Unite buffer<CR>
map  <leader>ff :Unite buffer tab file_rec/async file_mru<CR>
map  <leader>fy :Unite history/yank<CR>
map  <leader>fo :Unite outline -vertical -winwidth=30 -start-insert<CR>
map  <leader>fl :Unite line<CR>
map  <leader>fj :Unite jump<CR>
map  <leader>fg :Unite grep:.<CR>
map  <leader>g  :Unite grep:.<CR>

" unite-rails shortcuts
map <leader>rc    :Unite rails/controller<CR>
map <leader>rm    :Unite rails/model<CR>
map <leader>rg    :Unite rails/config<CR>
map <leader>rdb   :Unite rails/db<CR>
map <leader>rv    :Unite rails/view<CR>
map <leader>rjs   :Unite rails/javascript<CR>
map <leader>rcss  :Unite rails/stylesheet<CR>
map <leader>ri    :Unite rails/initializer<CR>
map <leader>rl    :Unite rails/lib<CR>
" map <leader>rspec :Unite rails/spec<CR>

nnoremap <leader>x :Unite buffer<cr>

" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_find_command = 'ag'
  let g:unite_source_rec_async_command = 'ag'
endif

" call unite#filters#sorter_default#use(['sorter_rank', 'sorter_ftime'])
call unite#filters#sorter_default#use(['sorter_rank', 'sorter_selecta'])
call unite#filters#matcher_default#use(['matcher_fuzzy'])

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.
  nmap <buffer> <ESC>     <Plug>(unite_exit)
  imap <buffer> <ESC>     <Plug>(unite_exit)
  imap <buffer> <C-c>     <Plug>(unite_exit)
  imap <buffer> <TAB>     <Plug>(unite_select_next_line)
  imap <buffer> <S-TAB>   <Plug>(unite_select_previous_line)
  " imap <buffer> <C-j>     <Plug>(unite_select_next_line)
  imap <buffer> <C-n>     <Plug>(unite_select_next_line)
  " imap <buffer> <C-k>     <Plug>(unite_select_previous_line)
  imap <buffer> <C-p>     <Plug>(unite_select_previous_line)
  nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
  nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
  nmap <buffer> <C-v>     <Plug>(unite_toggle_auto_preview)
  " nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  imap <C-k>               <C-e><Plug>(unite_delete_backward_line)
  " imap <C-0>               <Plug>(unite_rotate_next_source)
  " nmap <C-0>               <Plug>(unite_rotate_next_source)
endfunction

" These are standard bash/emacs/mac text movement/manipulation
cmap <C-a> <Home>
nmap <C-a> <Home>
cmap <C-k> <C-o>d$
imap <C-a> <Home>
vmap <C-a> <Home>
omap <C-a> <Home>
nmap <C-e> <End>
cnoremap <C-e> <End>
inoremap <C-e> <End>
vnoremap <C-e> <End>
onoremap <C-e> <End>
inoremap <C-d> <Del>
vnoremap <C-d> <Del>
onoremap <C-d> <Del>
cnoremap <C-d> <Del>
inoremap <C-o><C-k> <C-k>
inoremap <C-k> <C-o>d$
" <C-k> normally inserts a digraph (:help digraph)
" Let's remap that so it is still accessible and
" add the mapping for a normal _Kill_Until_EOL_ functionality
" -- Special thanks to https://github.com/houtsnip/vim-emacscommandline
cnoremap <C-o><C-k> <C-K>
cnoremap <C-k> <C-\>e<SID>KillLine()<CR>
function! <SID>KillLine()
    call <SID>saveUndoHistory(getcmdline(), getcmdpos())
    let l:cmd = getcmdline()
    let l:rem = strpart(l:cmd, getcmdpos() - 1)
    if ('' != l:rem)
        let @c = l:rem
    endif
    let l:ret = strpart(l:cmd, 0, getcmdpos() - 1)
    call <SID>saveUndoHistory(l:ret, getcmdpos())
    return l:ret
endfunction
let s:oldcmdline = [ ]
function! <SID>saveUndoHistory(cmdline, cmdpos)
    if len(s:oldcmdline) == 0 || a:cmdline != s:oldcmdline[0][0]
        call insert(s:oldcmdline, [ a:cmdline, a:cmdpos ], 0)
    else
        let s:oldcmdline[0][1] = a:cmdpos
    endif
    if len(s:oldcmdline) > 100
        call remove(s:oldcmdline, 100)
    endif
endfunction

let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = [
      \ '                                                     .\',
      \ '            .. ......................................;;.\',
      \ '   GO!       ..:::::..........................:::::::;;;;\.',
      \ '            .. :::::..........................:::::::;;:;/',
      \ '                            ..........................;/',
      \ '                                                      •'
      \ ]

hi StartifyBracket ctermfg=240
hi StartifyFooter  ctermfg=111
hi StartifyHeader  ctermfg=203
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }


let g:rspec_command = "!bundle exec rspec"
let g:rspec_runner = "os_x_iterm"


let &colorcolumn=join(range(81,999),",")


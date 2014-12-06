" Lodestone's vimrc

" These two enable syntax highlighting
" We're running Vim, not Vi!
set nocompatible

" Set my colorscheme
" Set color schemes, 
" both light and dark variables
" to be used by F1 and F2 to
" switch between them.
let g:colorscheme_light = "pencil"
let g:colorscheme_dark = "hybrid"
execute 'colorscheme '.g:colorscheme_dark

filetype off

set hidden

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=/Users/matt/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/matt/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
"
" NeoBundle 'lambdalisue/unite-grep-vcs'
NeoBundle 'sgur/unite-git_grep'
NeoBundle 'termoshtt/unite-bibtex'
NeoBundle 'Keithbsmiley/rspec.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/junkfile.vim'
NeoBundle 'Sixeight/unite-grep'
NeoBundle 'Tabular'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'basyura/unite-rails'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'ercolanelli-leo/candyVirus'
NeoBundle 'gorkunov/smartgf.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'honza/vim-snippets'
NeoBundle 'int3/vim-extradite'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'junegunn/seoul256.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'lodestone/vim-markdown'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'maxbrunsfeld/vim-yankstack'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'reedes/vim-colors-pencil'
NeoBundle 'reedes/vim-pencil'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'skalnik/vim-vroom'
NeoBundle 'sunaku/vim-ruby-minitest'
NeoBundle 'szw/vim-tags'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'tommcdo/vim-exchange'
NeoBundle 'tommcdo/vim-lion'
NeoBundle 'tpope/vim-characterize'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'ujihisa/neco-look' 
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'wting/gitsessions.vim'
NeoBundle 'xolox/vim-misc' 
NeoBundle 'xolox/vim-session'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'gmarik/sudo-gui.vim'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'dag/vim-fish'

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#emacs_like_keymap = 1

" NeoBundle 'Lokaltog/vim-easymotion'
" NeoBundle 'haya14busa/vim-easyoperator-line'
" NeoBundle 'haya14busa/vim-easyoperator-phrase'
" NeoBundle 'nathanaelkane/vim-indent-guides'
" NeoBundle 'ton/vim-bufsurf'

" You can specify revision/branch/tag.
" NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

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

" Set nospell check
set nospell
map <F8> :setlocal spell! spelllang=en_us<CR>

" Line numbers
set number 

set laststatus=2

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
command! W write " Just in case

" Increase history
set history=5000

" Quick timeouts on key combinations.
set timeoutlen=350

" Use spacebar in normal mode like a web browser
nmap <Space> 20jzz
nmap <S-Space> 20kzz

" I don't use 's' so make S more convenient
vmap s S

" Send contents of current file to private gist
map gist :Gist -p<CR>
let g:gist_open_browser_after_post = 1

" Quick edit Vim Config (.vimrc)
map <leader>vc :e ~/.vimrc<CR>

" Quick edit my color scheme
map <leader>vl :e ~/.vim/colors/lodestone.vim<CR>

" Quick switch to last buffer without reaching up to the caret ^
map <C-k><C-k> :b#<CR>

map <leader> <Plug>(easymotion-prefix)

vmap > >gv
vmap < <gv
nmap > >>
nmap < <<

" I can't seem to reach $ as easily as I _should_ (double meaning)
nmap - $

" Show only the current window/tab/whatevers
nmap <leader>o :only<CR>

" make mouse work in console mode vim
set mouse=a

" Let tilde do some cools stuffs
set tildeop 

" Who uses plain javascript?
autocmd BufRead,BufNewFile *.js set ft=javascript.jquery

" highlight the current line (or don't)
set nocursorline

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

" Set the left column to a nice width
set numberwidth=5

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
let g:rails_defalt_file="Gemfile"

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set autoindent shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType vim set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType cucumber set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
  " autocmd FileType markdown set background=light colorscheme=pencil
  " markdown goodness
  " autocmd BufRead *.mkd  set autoindent formatoptions=tcroqn2 comments=n:>
  au BufRead,BufNewFile *etc/nginx/* set ft=nginx 
  " treat rackup files like ruby
  au BufRead,BufNewFile *.ru set ft=ruby
  au BufRead,BufNewFile *.coffee set ft=coffee
  " au BufNewFile,BufRead *.mkd set filetype=markdown autoindent tabstop=2 shiftwidth=2 
augroup END

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" autocmd BufReadPost *
"       \ if line("'\"") > 0 && line("'\"") <= line("$") |
"       \   exe "normal g`\"" |
"       \ endi

" Turn on language specific omnifuncs
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
" imap jl <Esc>

" Toggle NERDTree with <leader>d
" map <silent> <leader>d :execute 'NERDTreeTabsToggle ' . getcwd()<CR>
" map <silent> <leader>d :execute 'NERDTreeMirrorToggle '<CR>
" map <C-S-r> :execute 'NERDTreeFind '<CR>

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

" Yank all -- Can also do standard: ggyG
map <leader>yall :%y<CR>

" fix meta-keys which generate <Esc>a .. <Esc>z
let c='a'
while c <= 'z'
  exec "set <M-".toupper(c).">=\e".c
  exec "imap \e".c." <M-".toupper(c).">"
  let c = nr2char(1+char2nr(c))
endw

nnoremap <leader>q :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

" Having this set will not leave any additional file(s) around after having closed VIM. This is what most people might be looking to have set.
set nobackup

" The default is :set writebackup This will keep a backup file while the file is being worked. Once VIM is closed; the backup will vanish.
set nowritebackup


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
    \ 'dictionary' : '/usr/share/dict/words',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" let g:neocomplete#sources#dictionary#dictionaries = {
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions'
"         \ }

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
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType text setlocal omnifunc=<D-P>

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*:'

" NeoSnippet
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

let g:vimfiler_execute_file_list = {
        \ '_' : 'vim'
        \ }

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets,~/.vim/bundle/neosnippet-snippets/neosnippets,~/.vim/bundle/vim-snippets/snippets'

nmap <S-/> gcc
vmap <S-/> gcc
" Make <C-/> work for comment/uncomment
" nmap <C-_> gcc
" vmap <C-_> gcc

" Esc clears the highlight in normal mode
nmap <C-h> :noh<CR>

" Make backspace do something useful
nmap <Backspace> :b#<CR>

" autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
" set title

" VimFiler
function! s:my_vimfiler_settings()
	" nmap <buffer> q <Plug>(vimfiler_exit)
	" nnoremap <buffer> <Esc> <Plug>(vimfiler_hide)
  " nmap <buffer> Q <Plug>(vimfiler_hide)
	" nmap <buffer> <C-h> <Plug>(vimfiler_switch_to_parent_directory)
endfunction

autocmd FileType vimfiler call s:my_vimfiler_settings()

let g:vimfiler_as_default_explorer = 1

nmap      <Leader>d [VimFiler]
nnoremap  <silent> [VimFiler]f :<C-u>VimFiler -toggle<CR>
nnoremap  <silent> [VimFiler]b :<C-u>VimFilerBufferDir -toggle<CR>
nnoremap  <silent> [VimFiler]d :<C-u>VimFilerCurrentDir -toggle<CR>

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
let g:vimfiler_enable_auto_cd = 1

" let g:vimfiler_edit_action = "tabopen"

" Unite.vim settings
" -----------------------------------
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_prompt='•••••••» '
let g:unite_enable_short_source_names = 0
let g:unite_source_file_mru_long_limit = 90
let g:unite_source_directory_mru_long_limit = 90
let g:unite_source_grep_command="ag"


" sort file results by length
" call unite#custom#source('file', 'sorters', 'sorter_length')
" call unite#custom#source('file_rec/async', 'sorters', 'sorter_length')
" call unite#custom#source('file_mru', 'sorters', 'sorter_length')
" call unite#custom#source('rails/model', 'sorters', 'sorter_length')

call unite#custom#source('outline', 'sorters', [])
call unite#custom#source('file', 'sorters', 'sorter_selecta')
call unite#custom#source('file_rec/async', 'sorters', ['sorter_ftime', 'sorter_selecta'])
call unite#custom#source('file_mru', 'sorters', ['sorter_ftime', 'sorter_reverse'])
call unite#custom#source('rails/model', 'sorters', 'sorter_length')
call unite#custom#source('rails/controller', 'sorters', 'sorter_selecta')
call unite#custom#source('buffer', 'sorters', 'sorter_selecta')
call unite#custom#source('command', 'sorters', 'sorter_length')
call unite#custom#source('mapping', 'sorters', 'sorter_length')
call unite#custom#source('function', 'sorters', 'sorter_length')
call unite#custom#source('history/jump', 'sorters', 'sorter_ftime')
call unite#custom#source('neomru/file', 'sorters', ['sorter_ftime', 'sorter_reverse'])
call unite#custom#source('neomru/file', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])
call unite#custom#source('file_rec/async', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])
call unite#custom#source('file_rec/async', 'matchers', ['matcher_fuzzy', 'matcher_project_files'])

" limit results for recently edited files
call unite#custom#source('file_mru', 'max_candidates', 75)
call unite#custom#source('file_rec/async', 'max_candidates', 75)
" ignored files for file_mru
" call unite#custom#source('file_mru', 'ignore_pattern', 'COMMIT_EDITMSG')

" sort buffers by number
call unite#custom#source('buffer', 'sorters', 'sorter_selecta')

" #keep
" noremap <C-@> :Unite buffer tab file_rec/async file_mru<CR>
" noremap <A-Space> :Unite buffer tab file_rec/async file_mru<CR>

" What does this do? 
" map <D-l> :Unite -toggle -prompt=> -no-cursor-line -hide-source-names -winheight=5 file<CR>

" Find Function / Mapping / Command
map  <D-P> :Unite -buffer-name=commands -no-split command mapping function<CR>
map  <C-P> :Unite -buffer-name=commands -no-split command mapping function<CR>

" Find Anything
map  <D-p> :Unite -hide-source-names -buffer-name=files -no-split -unique file_rec/async<CR>
map  <C-p> :Unite -hide-source-names -buffer-name=files -no-split -unique file_rec/async<CR>

" Find open file
map  <D-b> :Unite -buffer-name=buffers -no-split buffer tab<CR>

" Find method (CTAGS)
map  <leader>fm :Unite -no-split outline<CR>
map  <D-r> :Unite -no-split outline<CR>

" Find all in project
map <leader>fa :Unite -no-split grep:.<CR>
noremap <D-F> :Unite -no-split grep:.<CR>

" Quick jump to a jump location
nnoremap "" :Unite -no-split jump<CR>
nnoremap <leader>fj :Unite -no-split jump<CR>

" Quick jump to a buffer
nnoremap ,, :Unite -no-split -no-start-insert buffer<CR>

" Search the word in the cursor in the current directory,
noremap <silent> <Leader>fw :Unite grep:.::<C-R><C-w><CR>
noremap <silent> <Leader>fW :Unite grep:.::<C-R><C-W><CR>

" Find by git status
map <D-B> :Unite -no-split giti/status<CR>
map <leader>fg :Unite -no-split giti/status<CR>

" Search the search history
map <leader>fs :Unite -no-split history/search<CR>

"bind command-] to indent
nmap <D-]> >
vmap <D-]> >gv
imap <D-]> <C-O>>

"bindcommand-[ to outdent
nmap <D-[> <
vmap <D-[> <gv
imap <D-[> <C-O><

" Command+O => Open the file with the system application
" useful for opening Markdown in Marked for example.
map <D-o> :!open %<CR><CR>

map <leader>fu  :Unite -no-split 
map <leader>fur :Unite -no-split rails/
map <leader>fub :Unite -no-split bookmark -no-start-insert <CR>

" nmap <C-k> :Unite command function mapping register<CR>
map  <leader>fx :Unite -buffer-name=commands -no-split command function mapping register<CR>
map  <leader>fc :Unite -buffer-name=commands -no-split command function mapping register<CR>
map  <leader>fr :Unite -buffer-name=recent -no-split neomru/file<CR>
map  <leader>ff <C-p>
map  <leader>fo :Unite -buffer-name=openfiles -no-split buffer tab window<CR>
map  <leader>fy :Unite -no-split history/yank<CR>
map  <leader>fl :Unite -no-split line<CR>

" unite-rails shortcuts
map <leader>rc    :Unite -buffer-name=rails -no-split rails/controller<CR>
map <leader>rm    :Unite -buffer-name=rails -no-split rails/model<CR>
map <leader>rv    :Unite -buffer-name=rails -no-split rails/view<CR>
map <leader>rl    :Unite -buffer-name=rails -no-split rails/lib<CR>
map <leader>rspec :Unite -buffer-name=rails -no-split rails/spec<CR>

" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --hidden --column'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_find_command = 'ag'
  let g:unite_source_rec_async_command='ag --nocolor --nogroup --column --ignore ".gif" --ignore ".png" --ignore ".git" --ignore ".jpg" --ignore ".pdf" --hidden -g ""'
endif

call unite#filters#sorter_default#use(['sorter_ftime', 'sorter_selecta'])
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank', 'sorter_ftime'])
" call unite#filters#sorter_default#use(['sorter_selecta'])
" call unite#filters#matcher_default#use(['matcher_fuzzy'])

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.
  nmap <buffer> <ESC>     <Plug>(unite_exit)
  " imap <buffer> <ESC>     <Plug>(unite_exit)
  imap <buffer> <C-c>     <Plug>(unite_exit)
  imap <buffer> <TAB>     <Plug>(unite_select_next_line)
  imap <buffer> <S-TAB>   <Plug>(unite_select_previous_line)
  imap <buffer> <C-n>     <Plug>(unite_select_next_line)
  imap <buffer> <C-p>     <Plug>(unite_select_previous_line)
  nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
  nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
  nmap <buffer> <C-v>     <Plug>(unite_toggle_auto_preview)
  imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
  inoremap <expr><buffer><C-k>   repeat('<Del>', len(substitute(getline('.')[col('.')-1 :], '.', 'x', 'g')))
  " nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
endfunction


" These are standard bash/emacs/mac text movement/manipulation

" Used to use this to move to the beginning of the line
" in normal mode, but now I use it to increment numbers (the default)
" nmap <C-a> <Home>
cmap <C-a> <Home>
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
nnoremap <C-d> <Del>
inoremap <C-o><C-k> <C-k>
cmap <C-k> <C-o>d$
nmap <C-k> d$
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

" Colorize the area beyond 80 columns
" let &colorcolumn=join(range(81,999),",")

" Debug
" set debug+=msg

" Set a dictionary for word completion by using <C-x> <C-k>
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
set complete-=k complete+=k



" Hit ^l to autocomplete from the dictionary file
inoremap <C-l> <C-x><C-k>

let g:pencil#wrapModeDefault = 'soft'

augroup pencil
  autocmd!
  autocmd FileType markdown call pencil#init()
  autocmd FileType mkd call pencil#init()
  autocmd FileType md call pencil#init()
  autocmd FileType textile call pencil#init()
  autocmd FileType text call pencil#init()
  " autocmd FileType text call pencil#init({'wrap': 'hard'})
augroup END

" Exchange word command
nmap <leader>xx cxiw

" Escape clears the current highlights
nnoremap <silent> <esc> :noh<return><esc>

map <F2> :set background=light <CR>:execute 'colorscheme '.g:colorscheme_light<CR>
map <F1> :set background=dark <CR>:execute 'colorscheme '.g:colorscheme_dark<CR>


" Make not so slow when typing!
set foldmethod=manual

" Don't do this. The latest vim-ruby handles it.
" let g:ruby_path = system('echo $HOME/.rbenv/shims')

" Use OSX clipboard
" set clipboard=unnamed

" Vroom! (test runner for vim ruby)
" let g:vroom_cucumber_path="cucumber"
" let g:vroom_use_spring=1
" let g:vroom_use_bundle_exec=0
" let g:vroom_use_binstubs=1
" let g:vroom_binstubs_path='.bundle/ruby/2.0.0/bin'

" SmartGF (Doesn't seem to take)
" let g:smartgf_key = 'gm'
" nmap <leader>gf gF

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif


" Switch between MacVim and Atom Editor
map <D-E> :!open -a Atom.app %<CR><CR>

set selectmode=mouse

set shell=/usr/local/bin/bash
" set fileformats=unix,dos,mac

" Map s to something useful
" noremap s <NOP> 

let g:unite_bibtex_bib_files=["/Users/matt/Dropbox/References.bib"]  

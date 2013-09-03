set guioptions-=T
" set guifont=Monaco:h10
" set guifont=Inconsolata:h14
" set guifont=Inconsolata-dz_for_Powerline:h12
set guifont=Envy_Code_R:h13
" set guifont=Envy_Code_R:h13
" How you set this on Linux
" set guifont=Monospace\ 9
set linespace=0
" set noantialias
set noantialias

set columns=160
set lines=40
" color ir_black
" For normal, dark background
" color lodestone
" color denseloot

" BackgroundColor(#151525)

" When I go full screen, maximize both horizontally and vertically
set fuoptions=maxvert,maxhorz

" For bright sun:
" color github

" Command-T for CommandT
macmenu &File.New\ Tab key=<D-T>
map <D-t> :tabnew<CR>:CtrlP<CR>
imap <D-t> <Esc>:tabnew<CR>:CtrlP<CR>

map <D-r> :Rake<CR>
map <D-/> :TComment<CR>
map <D-Left> :BufSurfBack<CR>
map <D-Right> :BufSurfForward<CR>
macmenu &File.Print key=<D-P>
map <D-p> :CtrlP<CR>

" Cmd+d selects word
map <D-d> viw
" Cmd+l selects line
" map <D-l> Vj0

set noballooneval



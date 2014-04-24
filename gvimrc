set guioptions-=T
" set guifont=Monospace\ 9
set guifont=Inconsolata:h14
set guifont=Monospatial:h14
set linespace=1
" set noantialias
" set noantialias
set antialias

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
" macmenu &File.New\ Tab key=<D-T>
" map <D-t> :tabnew<CR><C-P>
" imap <D-t> <Esc>:tabnew<CR><C-P>

" map <D-r> :Rake<CR>
map <D-/> gcc
" map <D-Left> :BufSurfBack<CR>
" map <D-Right> :BufSurfForward<CR>
" macmenu &File.Print key=<D-P>
map <D-p> <C-p><CR>
map <D-[> :bp<CR>
map <D-]> :bn<CR>

" Cmd+d selects word
map <D-d> viw
" Cmd+l selects line
" map <D-l> Vj0

set noballooneval


" For some reason if I don't source this again, <D-p> doesn't work... 2014-04-09
source ~/.vimrc


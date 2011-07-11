set guioptions-=T
" set guifont=Monaco:h10
" set guifont=Inconsolata:h14
set guifont=Envy_Code_R:h13
" How you set this on Linux
" set guifont=Monospace\ 9
set linespace=0
set noantialias

set columns=160
set lines=40
" color ir_black
" For normal, dark background
color lodestone
" BackgroundColor(#151525)

" When I go full screen, maximize both horizontally and vertically
set fuoptions=maxvert,maxhorz

" For bright sun:
" color github

" Command-T for CommandT
  macmenu &File.New\ Tab key=<D-T>
  map <D-t> :tabnew<CR>:CommandT<CR>
  imap <D-t> <Esc>:tabnew<CR>:CommandT<CR>


map <D-/> :TComment<CR>


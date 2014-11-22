" set guioptions-=Tc
set guioptions-=T
set guioptions+=c
set guioptions-=r
set guioptions-=L
" Make highlights auto-push into clipboard buffer
" set guioptions+=a 
" Set Font
" set guifont=Monospace\ 9
" set guifont=Inconsolata:h14
" set guifont=Monospatial:h14
set guifont=MonospaceTypewriter:h12
set linespace=1

" set noantialias
set antialias

set transparency=10

set columns=160
set lines=40

" When I go full screen, maximize both horizontally and vertically
set fuoptions=maxvert,maxhorz

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
map <D-l> V

set noballooneval

" For some reason if I don't source this again, <D-p> doesn't work... 2014-04-09
" source ~/.vimrc


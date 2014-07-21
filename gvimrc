" -----------------------------------------------
" dphase's .vimrc
" (C) 2004 Joshua Deere - joshua.deere@gmail.com
" -----------------------------------------------

" Better window switching
nmap <silent> <D-Left>  :wincmd h<CR>
nmap <silent> <D-Down>  :wincmd j<CR>
nmap <silent> <D-Up>    :wincmd k<CR>
nmap <silent> <D-Right> <esc>:wincmd l<CR>
imap <silent> <D-Left>  <esc>:wincmd h<CR>
imap <silent> <D-Down>  <esc>:wincmd j<CR>
imap <silent> <D-Up>    <esc>:wincmd k<CR>
imap <silent> <D-Right> <esc>:wincmd l<CR>

" Fonts
set guifont=Envy\ Code\ R\ for\ Powerline:h13
set linespace=2

set guioptions-=T
set guioptions-=r
set guioptions-=m
set guioptions-=l
set guioptions+=LlRrb
set guioptions-=LlRrb
set lines=50 columns=130
set ambiwidth=single
set number
set cursorline

nnoremap <leader>1 :set guifont=ProFontWindows:h12<CR>
nnoremap <leader>2 :set guifont=Wunexus:h10<CR>
nnoremap <leader>3 :set guifont=lime:h11<CR>
nnoremap <leader>4 :set guifont=Sheldon\ Narrow:h12<CR>
nnoremap <leader>5 :set guifont=Terminus:h12<CR>
nnoremap <leader>6 :set guifont=Envy\ Code\ R\ for\ Powerline:h13<CR>

" local color hacks
hi NonText guifg=#268bd2 gui=NONE cterm=NONE term=NONE

" load up local specific configs
source ~/.vim/gvimrc.local

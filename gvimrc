" -----------------------------------------------
" dphase's .vimrc
" (C) 2004 Joshua Deere - joshua.deere@gmail.com
" -----------------------------------------------

"colorscheme peaksea
"colorscheme dphase_obsidian

" lets get solarized
"let g:solarized_bold=0
"let g:solarized_underline=0
"let g:solarized_italic=0

"""colorscheme solarized
"colorscheme tomorrow-night 

" gvim win stuff
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 6.5
""set guifont=ProFontWindows\ 9
"set guifont=Monaco:h9
""set guifont=Andale\ Mono:h12
"set guifont=Ubuntu\ Mono:h14
"set guifont=Wunexus:h10
set guifont=Envy\ Code\ R:h13
set guioptions-=T
set guioptions-=r
set guioptions-=m
set guioptions-=l
set guioptions+=LlRrb
set guioptions-=LlRrb
"set noantialias
"colorscheme dphasecolor
 set lines=50 columns=90
 " turn on line numbers
set number
set cursorline
"highlight LineNr guibg=#22242E guifg=#48494A
"hi NonText guifg=#48494a

nnoremap <leader>1 :set guifont=Envy\ Code\ R:h13<CR>
nnoremap <leader>2 :set guifont=Wunexus:h10<CR>
nnoremap <leader>3 :set guifont=lime:h11<CR>

" local hacks
hi Comment          guifg=#5c5b59         
hi LineNr           guifg=#282829           guibg=#6D6F73
hi CursorLine       guibg=#2a2a2a
hi CursorLineNr     guifg=#353535           guibg=#929292           gui=none
hi StatusLine       guifg=#23272d           guibg=#898b8f           gui=none
hi StatusLineNC     guifg=#383636           guibg=#646669          gui=none
hi Folded           guifg=#91d6f8           guibg=#363946           gui=none
hi FoldColumn       guifg=#91d6f8           guibg=#363946           gui=none
hi VertSplit        guifg=#898b8f           guibg=#898b8f           gui=none
hi SignColumn       guibg=#636363
"hi NonText          guifg=#268bd2           guibg=#00252E
hi Normal guibg=#232323

" set transparency=10

" cool guy status bar
"source ~/.vim/extra/statusline.vim

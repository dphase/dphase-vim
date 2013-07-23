" -----------------------------------------------
" dphase's .vimrc
" (C) 2004 Joshua Deere - joshua.deere@gmail.com
" -----------------------------------------------


" color highlighting for X terms
if has("terminfo")
 set t_Co=16
 set t_Sf=[3%p1%dm
 set t_vb=
else
 set t_Co=16
 set t_Sf=[3%dm
 set t_Sb=
 set t_vb=
endif

" setup the feel of the app
syntax on
filetype indent on
set foldmethod=marker
set smartindent
set smarttab
set autoindent
set noinsertmode
set backspace=2
set ruler
set showcmd
set laststatus=2
set background=dark
set nocompatible
set expandtab
set vb
set number
set cursorline

" color columns after 78 chars
""set colorcolumn=78

" make code tabbing more sane
set tabstop=2
set shiftwidth=2

" custom statusline
set statusline=[%n]\ %f\ %(\ %M%R%Y%H%)%=%-14.(%l,%c,%V%)\ %P

" persistent undo
set undodir=~/.vim/undodir
set undofile

" backup dir
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

" session
set ssop-=options

" hilight search
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase
nnoremap <leader><space> :nohlsearch<CR>
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" no format on middle click pasting
map <MouseMiddle> <Esc>"*p


" clear out default colors
highlight Constant    NONE
highlight Delimiter   NONE
highlight Directory   NONE
highlight Error       NONE
highlight ErrorMsg    NONE
highlight Identifier  NONE
highlight LineNr      NONE
highlight ModeMsg     NONE
highlight MoreMsg     NONE
highlight Normal      NONE
highlight NonText     NONE
highlight PreProc     NONE
highlight Question    NONE
highlight Search      NONE
highlight Special     NONE
highlight SpecialKey  NONE
highlight Statement   NONE
highlight StatusLine  NONE
highlight Title       NONE
highlight Todo        NONE
highlight Type        NONE
highlight Visual      NONE
highlight WarningMsg  NONE

" new colors for non-gui mode
highlight Comment     ctermfg=6
highlight Constant    cterm=bold ctermfg=5
highlight Delimiter   term=bold cterm=bold ctermfg=1
highlight Directory   term=bold ctermfg=DarkBlue
highlight Error       term=standout cterm=bold ctermbg=1 ctermfg=1
highlight ErrorMsg    term=standout cterm=bold ctermfg=1
highlight Identifier  term=underline ctermfg=3
highlight LineNr      term=underline cterm=bold ctermfg=3
highlight ModeMsg     term=bold cterm=bold ctermfg=3 ctermbg=1
highlight MoreMsg     term=bold cterm=bold ctermfg=2
highlight NonText     ctermfg=7
highlight Normal      ctermfg=white
highlight PreProc     ctermfg=DarkMagenta
highlight Question    term=standout cterm=bold ctermfg=2
highlight Search      term=reverse ctermbg=2
highlight Special     cterm=bold ctermfg=1
highlight SpecialKey  term=bold ctermfg=DarkBlue
highlight Statement   cterm=bold ctermfg=3
highlight StatusLine  ctermfg=0 ctermbg=7
highlight Title       term=bold cterm=bold ctermfg=4
highlight Todo        term=bold ctermfg=red ctermbg=yellow
highlight Type        term=underline cterm=bold ctermfg=2
highlight Visual      term=reverse cterm=bold ctermfg=6 ctermbg=5
highlight WarningMsg  term=standout cterm=bold ctermfg=1 ctermbg=4

" colors for non-gui
set t_Co=256
"colorscheme peaksea
"colorscheme tomorrow-night
colorscheme smyck
hi ColorColumn ctermbg=236

" pathogen
"call pathogen#runtime_append_all_bundles()
execute pathogen#infect()
"call pathogen#helptags()

" various
let g:Powerline_symbols = 'fancy'

" various mappings
map <F2> :NERDTreeToggle<CR>
map <F3> :TagbarToggle<CR>
map <F4> :w<CR>
map <F5> :SessionSave<CR>
map <F6> :runtime! syntax/2html.vim<CR>
map <F7> :call Sethl7()<CR>
map <F8> :ConqueTermSplit zsh<CR>

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" always show gutters
let g:gitgutter_sign_column_always = 1

" my macros
nnoremap <leader>y "+y
"nnoremap <leader>p "+gP
nnoremap <leader>7 :set filetype=hl7<CR>
nnoremap <leader>m :TMiniBufExplorer<CR>
nnoremap <leader>b :MiniBufExplorer<CR>
nnoremap <leader>jd i Josh Deere (josh.deere@hattiesburgclinic.com)
nnoremap <leader>tps :%s/tps-tmplt/tps_
nnoremap <leader>- 72i-<ESC>
nnoremap <leader>_ 35i-<ESC>

" indent guides
"let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" startify
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_custom_header = [
      \ '                                  ___',
      \ '         ___        ___          /__/\',
      \ '        /__/\      /  /\        |  |::\',
      \ '        \  \:\    /  /:/        |  |:|:\',
      \ '         \  \:\  /__/::\      __|__|:|\:\',
      \ '     ___  \__\:\ \__\/\:\__  /__/::::| \:\',
      \ '    /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/',
      \ '    \  \:\|  |:|     \__\::/  \  \:\',
      \ '     \  \:\__|:|     /__/:/    \  \:\',
      \ '      \__\::::/      \__\/      \  \:\',
      \ '          ~~~~                   \__\/',
      \ '',
      \ ]

hi StartifyHeader  ctermfg=203 guifg=#c4a3e1
hi StartifySlash ctermfg=240 guifg=#969696
hi StartifyPath ctermfg=203 guifg=#757575

" hl7 syntax
au BufRead,BufNewFile *.hl7 setfiletype hl7
au BufRead,BufNewFile *.bts setfiletype hl7

" plugin configs
let g:SuperTabDefaultCompletionType = "context"
let g:tagbar_usearrows = 1

" minibuf
let g:miniBufExplModSelTarget = 1
"let g:miniBufExplorerMoreThanOne = 0
"let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplVSplit = 25
"let g:miniBufExplSplitBelow=1

"tagma buf
let g:TagmaBufMgrLocation = 'R'
let g:TagmaBufMgrWidth = 20

"ctrlp stuff
let g:ctrlp_dont_split = 'nerdtree'

" nerdtree stuff
let NERDTreeShowBookmarks=1

" textmate style mappings
" bind control-l to hashrocket
imap <C-l> <Space>=><Space>"
" bind command-" to shift right
nmap <D-]> >>
vmap <D-]> >>
imap <D-]> <C-O>>>
"
" " bind command-[ to shift left
nmap <D-[> <<
vmap <D-[> <<
imap <D-[> <C-O><<

" easy window switching
nmap <leader>w <C-w><C-w>

" hl7 fun
function! Sethl7()
  set statusline=%<%f\ (HL7:\ %{HL7SegmentInfo()})\ %h%m%r%=\ %-14.(%l,%c%V%)\ %P
endfunction
" This function adds the segment name and field number to the status line.
function! HL7SegmentInfo()
  let line=getline(".")
  let pieces=split(line,"|")
  let cursorAt = col(".")
  if len(pieces) == 0
    return "No Segment"
  elseif (len(pieces) == 1) || (cursorAt <= strlen(pieces[0]))
    if strlen(pieces[0]) > 3
      return "Invalid segment?"
    else
      return pieces[0]
    endif
  endif
  let seg=pieces[0] . "-"
  let position=strlen(pieces[0])
  let segNum=0
  for index in range(1, len(pieces) - 1)
    let segNum += 1
    let position += 1
    let piece = pieces[index]
    if cursorAt <= (position + strlen(piece))
      return seg . segNum
    endif
    let position += strlen(piece)
  endfor
  " If the last piece was the separator (|) then VIM doesn't treat that
  " as a separate piece so we have to account for this special case.
  if strpart(line, strlen(line)-1, 1) == "|"
    let segNum += 1
  endif
  return seg . segNum
endfunction

" make orgmode kinda work
" source ~/.vim/orgmode.vimrc
hi LineNr ctermfg=16 ctermbg=248
hi CursorLine ctermbg=233 cterm=none
source ~/.vim/extra/xterm_status.vim
filetype plugin indent on


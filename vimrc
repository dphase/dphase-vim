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
set expandtab
set vb
set number
set cursorline
set regexpengine=1 " use pre 7.4 regex engine until it parses erb better
set t_Co=256
set autoread

if has('gui_running')
  set background=dark
  colorscheme base16-dphase
else
  set background=dark
  colorscheme smyck
endif

" color columns after 78 chars
set colorcolumn=80

" make code tabbing more sane
set tabstop=2
set shiftwidth=2

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
" set showmatch
set ignorecase
set smartcase
nnoremap <leader><space> :nohlsearch<CR>
" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" read .json as js
" au BufNewFile,BufRead *.json setf javascript

" no format on middle click pasting
map <MouseMiddle> <Esc>"*p

" pathogen
execute pathogen#infect()
call pathogen#helptags()

" syntastic settings
let g:syntastic_enable_balloons = 0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='→'
let g:syntastic_ignore_files=['\c\.erb$']

" various mappings
map <F2> :NERDTreeToggle<CR>
map <F3> :TagbarToggle<CR>
map <F4> :w<CR>
map <F6> :runtime! syntax/2html.vim<CR>

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" always show gutters
let g:gitgutter_sign_column_always = 1
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

" my macros
nnoremap <leader>jd i Josh Deere (josh@project93.com)
nnoremap <leader>- A  <ESC>72i-<ESC>
nnoremap <leader>= A  <ESC>35i-<ESC>

" indent guides
let g:indent_guides_guide_size = 1

" startify
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_files_number = 15
let g:startify_bookmarks = [ '~/.vim/vimrc', '~/.vim/gvimrc' ]
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

" plugin configs
let g:tagbar_usearrows = 1
let g:tagbar_autofocus = 1

"tagma buf
let g:TagmaBufMgrLocation = 'R'
let g:TagmaBufMgrWidth = 20

"ctrlp stuff
let g:ctrlp_dont_split = 'nerdtree'

" nerdtree stuff
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2

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

" bind ctrlp to ;
" nmap ; :CtrlP<CR>
nmap <leader>F :CtrlPClearAllCaches<CR>
nnoremap <C-]> :CtrlPtjump<cr>
nmap , :Ag<space>

" make Esc happen without waiting for timeoutlen
" " fixes Powerline delay
augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END

" speedy terminal
" ----------------------------------- 
set ttyfast
set notimeout
set ttimeout
set ttimeoutlen=100
syntax sync minlines=256
set synmaxcol=256

" make orgmode kinda work
" source ~/.vim/orgmode.vimrc
" hi LineNr ctermfg=16 ctermbg=248
" hi CursorLine ctermbg=233 cterm=none
filetype plugin indent on

" for my custom ruby debug indicators
" hi Error guifg=#ffffff guibg=#e45050 ctermbg=248 ctermfg=16

" NeoTools
" ----------------------------------- 
" Neo-Complete
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

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
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" jd -- cleaner neocomplete cancel on escape
function! NeoEscape()
  return pumvisible() ? '' : "\<ESC>" 
endfunction
inoremap <ESC> <C-R>=NeoEscape()<CR>

" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

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
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType eruby,html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" ---------------------------
" NeoSnippets
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Make ruby lambdas look cool
syntax keyword Statement lambda conceal cchar=λ
hi! link Conceal Statement
set conceallevel=2

" gmail for vim
source ~/.vimgmail

" vimshell configs
nmap <leader>S :VimShell<CR>
nmap <leader>cS :VimShellCreate<CR>
let g:vimshell_prompt_expr = 'fnamemodify(getcwd(), ":~")." ❯❯ "'
let g:vimshell_prompt_pattern = '^\f\+ ❯❯ '
autocmd FileType vimshell setlocal wrap
autocmd FileType int-bundle setlocal wrap

" fugitive
nmap <leader>G :Gcommit -a<CR>

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '-'
let g:gitgutter_sign_modified_removed = '--'
let g:gitgutter_sign_removed = '_ '

" lightline
source ~/.vim/dphase_lightline.vim

" Unite
" ------------------------------------------------------------------------ 
" Settings
" ----------------------------------- 
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ 'tmp/',
      \ '.sass-cache',
      \ ], '\|'))
let g:unite_source_history_yank_enable = 1

" Mappings
" ----------------------------------- 
function! s:unite_settings()
  nmap <buffer> <ESC> <plug>(unite_exit)
  imap <buffer> <ESC> <plug>(unite_exit)
  nmap <buffer> <C-r> <Plug>(unite_redraw)
  imap <buffer> <C-r> <Plug>(unite_redraw)
endfunction
autocmd FileType unite call s:unite_settings()
" let g:unite_split_rule = 'bottomleft'

nmap <leader>bl :<C-u>Unite -no-split -start-insert -buffer-name=buffer buffer<CR>
nmap <leader>y :<C-u>Unite -direction=below -buffer-name=yank history/yank<CR>
nmap <leader>h :Unite -start-insert -buffer-name=help help<CR>
nmap <leader>o :Unite -direction=above outline<CR>
nmap ; :<C-u>Unite -direction=below -start-insert -buffer-name=files file_rec/async<CR>
" ------------------------------------------------------------------------ 

" vim-emmet
nmap <leader>e <C-Y>,a

" insert erb tab
inoremap <c-e> <% %><ESC>2hi

" easyalign
" ------------------------------------------------------------------------ 
vnoremap <silent> <Enter> :EasyAlign<Enter>

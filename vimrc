" -----------------------------------------------
" dphase's .vimrc
" (C) 2004 Joshua Deere - joshua.deere@gmail.com
" -----------------------------------------------


filetype plugin on
filetype plugin indent on
syntax on
filetype indent on
runtime! macros/matchit.vim

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
" set re=1 " use pre 7.4 regex engine until it parses erb better
set t_Co=256
set autoread
set clipboard=unnamed
set printfont=Monaco:h13
set tags+=gems.tags

" pathogen
execute pathogen#infect('bundle/{}')
execute pathogen#helptags()

if has('gui_running')
  set background=dark
  " colorscheme base16-dphase
  let g:seoul256_background = 234
  colorscheme seoul256
else
  set background=dark
  colorscheme base16-dphase
endif

" color columns after 93 chars
set colorcolumn=93

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

" open my outliner
nnoremap <silent><leader>T :e /Users/dphase/Dropbox/TODO.otl<CR>

" CSV Viewing/Editing
" let g:csv_autocmd_arrange = 1
" 
aug CSVNoWrap
  au!
  au BufRead *.csv :set nowrap
aug end

" read .json as js
" au BufNewFile,BufRead *.json setf javascript

" no format on middle click pasting
map <MouseMiddle> <Esc>"*p

" syntastic settings
let g:syntastic_enable_balloons = 0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='→'
let g:syntastic_ignore_files=['\c\.erb$']
let g:syntastic_stl_format='%E{💀 %fe (%e) ⮃}%W{ 💡 %fw (%w) }'

" nerdtree
let NERDTreeIgnore = ['\.tags$','^tags$']

" various mappings
noremap <leader>d :NERDTreeToggle<CR>
noremap <leader>g :TagbarOpenAutoClose<CR>

map <F4> :w<CR>

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" always show gutters
let g:gitgutter_sign_column_always = 1
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

" comment header line
function! CommentHeader()
  let times = 82 - col(".")
  let line  = getline(".")
  " let space = matchstr(line, "(^#|^\s+#)") == "#" ? " " : ""
  let space = " "
  exe ":normal A" . space . repeat("-", times)
endfunction

" my macros
" ------------------------------------------------------------------------------- 
nnoremap <leader>jd i Josh Deere (josh@project93.com)
nnoremap <leader>- :call CommentHeader()<CR>o
" nnoremap <leader>- A  <ESC>79i-<ESC>
" nnoremap <leader>= A  <ESC>45i-<ESC>

" indent guides
let g:indent_guides_guide_size = 1

" XML folding
let g:xml_syntax_folder=1
au FileType xml setlocal foldmethod=syntax

" startify
" let g:startify_session_dir = '~/.vim/sessions'
let g:startify_files_number = 15
let g:startify_bookmarks = [ '~/Dropbox/scratch/ruby.rb', '~/Dropbox/TODO.otl', '~/.vim/vimrc', '~/.vim/gvimrc' ]
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
                                                                
" let g:startify_custom_header = [
"   \ '                _|      _|  _|_|_|  _|      _|                  ',
"   \ '_|_|_|_|_|      _|      _|    _|    _|_|  _|_|      _|_|_|_|_|  ',
"   \ '                _|      _|    _|    _|  _|  _|                  ',
"   \ '_|_|_|_|_|        _|  _|      _|    _|      _|      _|_|_|_|_|  ',
"   \ '                    _|      _|_|_|  _|      _|                  ',
"   \ '',
"   \ ]

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
let NERDTreeMinimalUI=1

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
set synmaxcol=500

" javascript hax
" ------------------------------------------------------------------------ 
let g:javascript_conceal = 0

" Make ruby lambdas look cool
" ------------------------------------------------------------------------ 
" syntax keyword Statement lambda conceal cchar=λ
" hi! link Conceal Statement
set conceallevel=2

" vimshell configs
" ------------------------------------------------------------------------ 
nmap <leader>S :VimShell<CR>
nmap <leader>cS :VimShellCreate<CR>
let g:vimshell_prompt_expr = 'fnamemodify(getcwd(), ":~")." ❯❯ "'
let g:vimshell_prompt_pattern = '^\f\+ ❯❯ '
autocmd FileType vimshell setlocal wrap
autocmd FileType int-bundle setlocal wrap

" fugitive
" ------------------------------------------------------------------------ 
nmap <leader>G :Gcommit -a<CR>

" normal signs
" let g:gitgutter_sign_added = '+'
" let g:gitgutter_sign_modified = '-'
" let g:gitgutter_sign_modified_removed = '--'
" let g:gitgutter_sign_removed = '_ '
" thick marks
" let g:gitgutter_sign_added = '▐'
" let g:gitgutter_sign_modified = '▐'
" let g:gitgutter_sign_modified_removed = '▐'
" let g:gitgutter_sign_removed = '▐'
" thin marks │╏ 
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_modified_removed = '│'
let g:gitgutter_sign_removed = '│'

" lightline
" ------------------------------------------------------------------------ 
source ~/.vim/dphase_lightline.vim

" Unite
" ------------------------------------------------------------------------ 
" Settings
" ----------------------------------- 
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.bundle/',
      \ '\.yardoc/',
      \ 'nodejs/*/node_modules/',
      \ 'nodejs/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ 'tmp/',
      \ 'deprecated/',
      \ 'nodejs/node_modules/',
      \ 'assets/components/',
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
nmap <leader>y :<C-u>Unite -direction=botright -prompt-direction=top -winheight=10 -buffer-name=yank history/yank<CR>
nmap <leader>h :Unite -start-insert -winheight=10 -buffer-name=help help<CR>
nmap ; :<C-u>Unite -direction=botright -prompt-direction=top -winheight=10 -start-insert -buffer-name=files file_rec/async<CR>
" ------------------------------------------------------------------------ 

" vim-emmet
nmap <leader>e <C-Y>,a

" insert erb tab
inoremap <c-e> <% %><ESC>2hi

" Fast saving
nnoremap <leader>w :w<CR>
inoremap <c-w> <esc>:w<CR>i
" vnoremap <leader>w <esc>:w<CR>

" URL opener
nmap <leader>l :Utl<CR>

" better text folding
set fillchars=fold:\∙
function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*\("\|#\|//\|/\)\?\s*\|\s*\("\|#\)\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '│ ' . printf("%10s", lines_count . ' lines') . ' │'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('∙' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

" easyalign
" ------------------------------------------------------------------------ 
vnoremap <silent> <Enter> :EasyAlign<Enter>

" YouCompleteMe + UltiSnips
" ------------------------------------------------------------------------ 
let g:ycm_confirm_extra_conf = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_add_preview_to_completeopt = 1

function! g:UltiSnips_Complete()
  call UltiSnips_ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips_JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

" TagBar
" ------------------------------------------------------------------------ 
let g:tagbar_compact = 1
let g:tagbar_indent = 2
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_type_ruby = {
  \ 'kinds' : [
    \ 'm:modules',
    \ 'c:classes',
    \ 'd:describes',
    \ 'C:contexts',
    \ 'f:methods',
    \ 'b:filters',
    \ 'p:routes',
    \ 'F:singleton methods'
  \ ]
\ }

" BroLink
" ------------------------------------------------------------------------------- 
let g:bl_no_mappings = 1
noremap <leader>bs :BLStart<CR>
noremap <leader>br :BLReloadPage<CR>
noremap <leader>bc :BLReloadCSS<CR>

" Origami
" ------------------------------------------------------------------------------- 
let g:OrigamiFoldAtCol = 77

" CoffeeScript
" ---------------------------------------------------------------------------------
hi link coffeeSpaceError NONE
hi link coffeeSemicolonError NONE

" Vim SLIME
" ------------------------------------------------------------------------ 
let g:slime_target = "tmux"

" Unite Workflow
" ---------------------------------------------------------------------------------
" Gist-VIM
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
let g:gist_post_privates = 1

" Remove trailing whitespace on save
" ---------------------------------------------------------------------------------
autocmd FileType c,ruby,coffee,css,slim,scss,html,xml autocmd BufWritePre <buffer> :%s/\s\+$//e

" Ruby scratch buffer
" ---------------------------------------------------------------------------------
" function! s:Scratch
"   exe 'below split +buffer'
" endfunction

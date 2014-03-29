" ---------------------------------------------------------------------------------
" HackerNews Client for Vim
" © #iMPULSE
" ---------------------------------------------------------------------------------

if exists('g:vim_hackernews_loaded') || &cp
  finish
endif

let g:vim_hackernews_loaded = 1

if !exists('g:vim_hackernews_height')
  let g:vim_hackernews_height = 18
endif

" Commands
" ---------------------------------------------------------------------------------
command! HN call s:HNSetupBuffer()

" Show buffer
" ---------------------------------------------------------------------------------
function! s:HNSetupBuffer()
  let existing_hackernews_buffer = bufnr('HackerNews')

  if existing_hackernews_buffer == -1
    exe 'below split HackerNews'
  else
    exe 'below split +buffer' . existing_hackernews_buffer
  endif

  setlocal filetype=vim-hackernews
  setlocal buftype=nofile
  setlocal nobuflisted
  setlocal noswapfile
  setlocal nonumber
  setlocal nowrap
  setlocal colorcolumn=0

  " map <buffer> S <esc>:SpotifySearch 
  " map <buffer> s <esc>:SpotifySearch 
  " map <buffer> P <esc>:SpotifyPlay<cr>
  " map <buffer> p <esc>:SpotifyPlay<cr>

  call s:HNFetchNews()
  call s:HNResizeBuffer()
endfunction

" Set buffer size
" ---------------------------------------------------------------------------------
function! s:HNResizeBuffer()
  exe 'resize ' . g:vim_hackernews_height
endfunction

" Fetch latest news
" ---------------------------------------------------------------------------------
function! s:HNFetchNews()
  setlocal modifiable

  ruby VimHN::fetch_news

  setlocal nomodifiable
endfunction

" Ruby extension
" ---------------------------------------------------------------------------------
ruby << EOF

require 'json'
require 'uri'
require 'open-uri'

module VimHN
  class << self
    LIST_START = 1
    HN_API     = 'http://api.ihackernews.com/page'

    def fetch_news
      json = JSON.parse open(HN_API).readlines.join

      json['items'].each.with_index do |item,i|
        title      = item['title']
        points     = item['points']
        ago        = item['postedAgo']
        poster     = item['postedBy']
        url        = item['url']
        comments   = item['commentCount']

        link_title = "#{(i + 1).to_s.rjust(2)}. #{title}"
        link_info  = "    #{points} points by #{poster} #{ago} | #{comments} comments"

        i += i
        
        $curbuf.append i, ''
        $curbuf.append i, ''
        $curbuf[LIST_START + i]       = link_title
        $curbuf[LIST_START + (i + 1)] = link_info
      end

      $curbuf.append 0, '------------------------------------------------------------------'
      $curbuf.append 0, '[Y] HackerNews for Vim'
    end

  end
end

EOF

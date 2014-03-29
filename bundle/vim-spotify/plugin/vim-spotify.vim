" ---------------------------------------------------------------------------------
" Spotify Client for Vim
" © #iMPULSE
" ---------------------------------------------------------------------------------

if exists('g:vim_spotify_loaded') || &cp
  finish
endif

let g:vim_spotify_loaded       = 1
let g:vim_spotify_current_song = ''

if !exists('g:vim_spotify_height')
  let g:vim_spotify_height = 10
endif

if !exists('g:vim_spotify_playlist_width')
  let g:vim_spotify_playlist_width = 35
endif

" Commands
" ---------------------------------------------------------------------------------
command!          Spotify       call s:VimSpotifyCreateBuffer()
command! -nargs=1 SpotifySearch call s:VimSpotifySearch(<f-args>)
command!          SpotifyPlay   call s:VimSpotifyPlayTrack()

" Render buffer contents
" ---------------------------------------------------------------------------------
function! VimSpotifyDrawBufferContents()
  setlocal modifiable

  ruby VimSpotify::draw_about_screen
  setlocal nomodifiable
endfunction

" Show buffer
" ---------------------------------------------------------------------------------
function! s:VimSpotifyCreateBuffer()
  let existing_spotify_buffer = bufnr('Spotify')

  if existing_spotify_buffer == -1
    exe 'below split Spotify'
    call VimSpotifyDrawBufferContents()
  else
    exe 'below split +buffer' . existing_spotify_buffer
  endif

  setlocal filetype=vim-spotify
  setlocal buftype=nofile
  setlocal nobuflisted
  setlocal noswapfile
  setlocal nonumber
  setlocal nowrap
  setlocal colorcolumn=0

  map <buffer> S <esc>:SpotifySearch 
  map <buffer> s <esc>:SpotifySearch 
  map <buffer> P <esc>:SpotifyPlay<cr>
  map <buffer> p <esc>:SpotifyPlay<cr>

  call s:VimSpotifyResizeBuffer()
endfunction

" Set buffer size and attempt to lock it
" ---------------------------------------------------------------------------------
function! s:VimSpotifyResizeBuffer()
  exec 'resize ' . g:vim_spotify_height
endfunction

" Search Spotify
" ---------------------------------------------------------------------------------
function! s:VimSpotifySearch(search_string)
  let search_string = a:search_string
  call s:VimSpotifyGetURI(search_string)
endfunction

" Play Song
" ---------------------------------------------------------------------------------
function! s:VimSpotifyPlayTrack()
  ruby VimSpotify::play_track(VIM::evaluate("getline('.')"))
endfunction

" Vim -> Ruby interface
" ---------------------------------------------------------------------------------
function! s:VimSpotifyGetURI(search_string)
  setlocal modifiable

  ruby VimSpotify::get_search_uri(VIM::evaluate('a:search_string'))
  setlocal nomodifiable
endfunction

" Ruby extension
" ---------------------------------------------------------------------------------
ruby << EOF

require 'json'
require 'uri'

module VimSpotify
  class << self
    def draw_about_screen
      $curbuf.append 0, ''
      $curbuf.append 1, '  _   ___       ____          __  _ ___    '
      $curbuf.append 2, ' | | / (_)_ _  / __/__  ___  / /_(_) _/_ __'
      $curbuf.append 3, ' | |/ / /  ` \_\ \/ _ \/ _ \/ __/ / _/ // /'
      $curbuf.append 4, ' |___/_/_/_/_/___/ .__/\___/\__/_/_/ \_, / '
      $curbuf.append 5, '      music for /_/ the keyboard    /___/  '
      $curbuf.append 6, ''
      $curbuf.append 7, ' Search for songs with :SpotifySearch <search term>'
    end

    def get_search_uri(string)
      api  = URI.encode "http://ws.spotify.com/search/1/track.json?q=#{string}"
      json = JSON.parse `curl "#{api}"`

      json['tracks'].each.with_index do |track,i|
        length = Time.at(track['length']).gmtime.strftime('%M:%S')
        artist = track['artists'][0]['name'].byteslice(0..17).rjust(18).force_encoding('ASCII-8BIT')
        song   = track['name'].byteslice(0..35).ljust(36).force_encoding('ASCII-8BIT')
        album  = track['album']['name'].byteslice(0..39).ljust(40).force_encoding('ASCII-8BIT')
        href   = track['href']

        entry  = " ♫ │ #{artist} │ #{length} │ #{song} │ #{album} │ #{href} "

        $curbuf.append i, entry
      end

    end

    def play_track(line)
      meta   = line.split('│').map {|c| c.strip}

      artist = meta[1]
      song   = meta[3]
      href   = meta.last

      `osascript -e 'tell application "Spotify" to play track "#{href}"'`

      VIM::command "let g:vim_spotify_current_song = '#{artist} ⮁ #{song}'"
    end
  end
end

EOF

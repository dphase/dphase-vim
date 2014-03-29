syn match  spotifyHref   '\(spotify:.*\) $'

syn match spotifyAbout  'music for\|the keyboard'

syn match spotifyLength '\d\d:\d\d'
syn match spotifyNote   '♫'
syn match spotifyNote   ':SpotifySearch'
syn match spotifyDelim  '│'
syn match spotifyDelim  '<search term>'

syn match spotifyArtist '\v│\s.{18}\s│' contains=spotifyDelim
syn match spotifyAlbum  '\v│\s.{40}\s│' contains=spotifyDelim
syn match spotifySong   '\v│\s.{36}\s│' contains=spotifyDelim,spotifyAlbum

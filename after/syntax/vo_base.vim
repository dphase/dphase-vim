" -- dphase hacks
syn match OLCheckRegion '\[\.\]' contained contains=OLCheck,OLPending
" syn match OLCredentials ' / .*' contained contains=OLLocked

syn match OLCheck 'X' contained conceal cchar=√
syn match OLLocked '\/ \(.*\)$' contained conceal cchar=⭤

syn match OLPending '_' contained
syn match OLContact '@ .*' contained
syn match OLURL '\(https\?:\/\/.* \?\)' contained

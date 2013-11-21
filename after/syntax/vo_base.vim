" -- dphase hacks
syn match OLCheckRegion '\[\.\]' contained contains=OLCheck,OLPending
" syn match OLCheck 'X' contained conceal cchar=✗
syn match OLCheck 'X' contained conceal cchar=√
syn match OLPending '_' contained
syn match OLURL '\(https\?:\/\/.* \?\)' contained

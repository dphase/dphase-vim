" -- dphase hacks

syn match jsGlobal '\(\$\)\w*'
hi def link jsGlobal Error

" syn match dphaseBinding "binding\.pry"
" syn keyword dphaseDebug dlog
" hi def link dphaseBinding Error
" hi def link dphaseDebug Error
" 
" syn match rubyConstant ' == '
" syn match rubyConstant ' != '
" syn match rubyConstant ' < '
" syn match rubyConstant ' > '
" syn match rubyConstant ' >= '
" syn match rubyConstant ' <= '
" syn match rubyConstant ' || '
" syn match rubyConstant ' ||'
" syn match rubyConstant '&'
" syn match rubyConstant '<<'
" syn match rubyConstant '\(*\)\c'
" syn match none '=>'
" 
" syn match rubyClassVariable '\(@@\)\w+'
" 
" syn keyword rubyKeyword lambda conceal cchar=λ
" syn match rubyKeyword '->' conceal cchar=λ
" syn match rubyFloat 'Math::PI' conceal cchar=π

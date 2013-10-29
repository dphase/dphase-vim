" -- dphase hacks
syn match dphaseBinding "binding\.pry"
syn keyword dphaseDebug dlog
hi def link dphaseBinding Error
hi def link dphaseDebug Error

syn keyword rubyKeyword lambda conceal cchar=λ
syn match rubyKeyword '->' conceal cchar=λ
syn match rubyFloat 'Math::PI' conceal cchar=π

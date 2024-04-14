syntax keyword coolcHlirOp mov isvoid error eq add sub mult lt eq leq div add
syntax keyword coolcHlirOp branch neg new call typeof superclass
syntax match coolcHlirComment "\/\/.*"
syntax region coolcHlirValue start="\[" end="\]"

highlight link coolcHlirOp Keyword 
highlight link coolcHlirComment Comment 
highlight coolcHlirValue gui=bold 

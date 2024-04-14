syntax keyword coolcHlirOp mov isvoid error eq add sub mult lt eq leq div add
syntax keyword coolcHlirOp neg new call typeof superclass
syntax match coolcHlirOp "branch\.\(true\|false\|always\)"
syntax match coolcHlirComment "\/\/.*"
syntax region coolcHlirValue start="\[" end="\]"
syntax match coolcHlirFunction ".* {" contains=coolcHlirBraces
syntax match coolcHlirBraces "[{}]"
syntax match coolcHlirClass "[A-Z][a-zA-Z]*"
syntax match coolcHlirSpecialClass "__[A-Z][_a-zA-Z]*__"
syntax match coolcHlirLabel "^\s*[a-zA-Z0-9]\+:"
syntax match coolcHlirNumber "\d\+"
syntax match coolcHlirString "\".*\""
syntax keyword coolcHlirBoolean true false
syntax keyword coolcHlirvoid __void__

highlight link coolcHlirOp Keyword 
highlight link coolcHlirComment Comment 
highlight coolcHlirValue gui=bold 
highlight link coolcHlirFunction Function 
highlight link coolcHlirClass Type 
highlight link coolcHlirSpecialClass Special
highlight link coolcHlirBraces Delimiter
highlight link coolcHlirLabel Label
highlight link coolcHlirNumber Number
highlight link coolcHlirString String
highlight link coolcHlirBoolean Boolean
highlight link coolcHlirVoid Constant

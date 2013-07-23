" Vim syntax file
" Language: HL7
" Maintainer: Joshua Deere (joshua.deere@gmail.com)
" Latest Revision: 31 Jan 2010

if exists ("b:current_syntax")
  finish
endif

syn keyword hl7MsgHeader      MSH
syn keyword hl7OrderTypes     OBR OBX ORC TXA
syn keyword hl7Demo1          PD1 PID PR1 PV1 PV2
syn keyword hl7Demo2          EVN FT1 GT1 IN1 IN2 IN3 MRG NK1 DG1
syn keyword hl7Misc           NTE

syn match   hl7SegDelim       "|"
syn match   hl7FieldDelim     "\^"
syn match   hl7RepDelim       "\~"
syn match   hl7EscChar        "\\"

let b:current_syntax = "hl7"

hi def link hl7MsgHeader      String
hi def link hl7OrderTypes     Number
hi def link hl7Demo1          Type
hi def link hl7Demo2          Statement
hi def link hl7Misc           Comment

hi def link hl7SegDelim       String
hi def link hl7FieldDelim     PreProc
hi def link hl7RepDelim       Number
hi def link hl7EscChar        Constant

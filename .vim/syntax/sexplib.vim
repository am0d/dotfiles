" Vim syntax file
" Language:     S-expressions as used in Sexplib
" Filenames:    *.sexp
" Maintainers:  Markus Mottl      <markus.mottl@gmail.com>
" URL:          http://www.ocaml.info/vim/syntax/sexplib.vim
" Last Change:  2009 Apr 02 - First release (MM)

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax") && b:current_syntax == "sexplib"
  finish
endif

" Sexplib is case sensitive.
syn case match

" Comments
syn match    sexplibComment   ";.*"

" Errors
syn match    sexplibParenErr   ")"

" Some convenient clusters
syn cluster  sexplibAllErrs contains=sexplibParenErr

" Enclosing delimiters
syn region   sexplibEncl transparent matchgroup=sexplibKeyword start="(" matchgroup=sexplibKeyword end=")" contains=ALLBUT,sexplibParenErr

syn region   sexplibString       start=+"+ skip=+\\\\\|\\"+ end=+"+

syn match    sexplibNumber        "\<-\=\d\(_\|\d\)*[l|L|n]\?\>"
syn match    sexplibNumber        "\<-\=0[x|X]\(\x\|_\)\+[l|L|n]\?\>"
syn match    sexplibNumber        "\<-\=0[o|O]\(\o\|_\)\+[l|L|n]\?\>"
syn match    sexplibNumber        "\<-\=0[b|B]\([01]\|_\)\+[l|L|n]\?\>"
syn match    sexplibFloat         "\<-\=\d\(_\|\d\)*\.\?\(_\|\d\)*\([eE][-+]\=\d\(_\|\d\)*\)\=\>"

" Synchronization
syn sync minlines=50
syn sync maxlines=500

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_sexplib_syntax_inits")
  if version < 508
    let did_sexplib_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink sexplibParenErr   Error

  HiLink sexplibComment    Comment

  HiLink sexplibBoolean    Boolean
  HiLink sexplibCharacter  Character
  HiLink sexplibNumber     Number
  HiLink sexplibFloat      Float
  HiLink sexplibString     String

  HiLink sexplibEncl       Keyword

  delcommand HiLink
endif

let b:current_syntax = "sexplib"

" vim: ts=8

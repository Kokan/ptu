" Vim syntax file
" Language:  Rational Test Real Time PTU script
" Maintainer:	Péter Kókai <kokaipeter@gmail.com>
" Last Change:	2012 Aug 30

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


syn case ignore "The PTU Script language is case insensitive


" A bunch of C Test Script Language Keywords
syn keyword	ptuKeyword	ELEMENT
syn keyword	ptuKeyword	ENVIRONMENT
syn keyword	ptuKeyword	INITIALIZATION
syn keyword	ptuKeyword	SERVICE
syn keyword	ptuKeyword	SIMUL
syn keyword	ptuKeyword	ELSE_SIMUL
syn keyword	ptuKeyword	TERMINATION
syn keyword	ptuKeyword	STRUCTURE
syn keyword	ptuKeyword	TEST
syn keyword	ptuKeyword	BEGIN
syn keyword	ptuKeyword	DEFINE
syn keyword	ptuKeyword	STUB
syn keyword	ptuKeyword	EV
syn keyword	ptuKeyword	FORMAT
syn keyword	ptuKeyword	FAMILY
syn keyword	ptuKeyword	END
syn keyword	ptuKeyword	HEADER
syn keyword	ptuKeyword	IF
syn keyword	ptuKeyword	ELSE
syn keyword	ptuKeyword	INIT
syn keyword	ptuKeyword	INCLUDE
syn keyword	ptuKeyword	NEXT_TEST
syn keyword	ptuKeyword	USE
syn keyword	ptuKeyword	VAR
syn keyword	ptuKeyword	ARRAY
syn keyword	ptuKeyword	STR
syn keyword	ptuKeyword	EXCEPTION
syn keyword	ptuTodo		contained TODO FIXME XXX
"Forces the Tester to give a Testing technique
syn keyword	ptuTodo		nominal 

syn match	ptuOperator	"\v\="
syn match	ptuOperator	"\v\=\>"

syn match	ptuOperator	"\v\+"
syn match	ptuOperator	"\v\-"
syn match	ptuOperator	"\v\\"
syn match	ptuOperator	"\v\*"

"syn region ptuNativeCode start=/#/ end=/$/ keepend 
syn region ptuComment	start="--" end="$" keepend
syn region ptuComment	start="COMMENT" end="$" keepend
syn region ptuComment	start="\/\*" end="\*\/" keepend

"Numbers
syn	match	ptuNumber	"\v(0x[0-9A-Za-z]+)|([+-]?[0-9]+\.?[0-9]*)"


" Test techniques which are commonly used
syn match ptuFamily "Functional"
syn match ptuFamily "Coverage" 
syn match ptuFamily "Robustness" 
syn match ptuFamily "ErrorCondition" 
syn match ptuFamily "ErrorGuess" 

" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_ada_syn_inits")
  if version < 508
    let did_ada_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
" Define the default highlighting.
  HiLink ptuKeyword		ModeMsg
  HiLink ptuTodo		Todo
  HiLink ptuComment		Comment
  HiLink adaLabel		Label
  HiLink ptuFamily		Constant
  HiLink ptuNativeCode		Question
  HiLink ptuNumber		Number
  HiLink ptuOperator		Operator

  delcommand HiLink
endif

let b:current_syntax = "ptu"

" vim: ts=8

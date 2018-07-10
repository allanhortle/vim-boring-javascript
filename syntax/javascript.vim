" Vim syntax file

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'javascript'
endif

" Keywords
syn keyword Keyword async arguments break case catch class const continue debugger default delete do else export extends finally for function from if import in instanceof new return super switch this throw try typeof var void while with yield enum implements interface let package private protected public static await abstract boolean byte char double final float goto int long native short synchronized throws transient volatile


" Type Keywords
syntax match Keyword '\v^(type|declare|interface)'



"
" Constants
"

syn keyword Constant true false null Infinity NaN undefined

" Numbers
syn match Constant '\v<[0-9]+(\.[0-9]+)?'
syn match Constant '\<0b[0-1]*'
syn match Constant '\<0o[0-7]*'
syn match Constant '\<0x[0-9a-fA-F]*'
syn match Constant '\.[0-9]\+'
syn match Constant 'e[-+]\?[0-9]\+'


" Strings
syntax region String start='\'' end='\''
syntax region String start='"' end='"'
syntax region String start='`' end='`' contains=templateString
syntax region templateString matchGroup=String contained start='${' end='}' contains=@jsAll

" Regular Expressions
"syntax region jsBoringRegex start='\([=(:]\|^\|return\|&&\|||\|!\)\@<=\s*\(/\)\([/*+{}?>]\)\@!' end='[gimyus]?'
syntax match jsBoringRegex '\v\/{-1,}\/[gimyus]?'


" Types
"syntax match Type "\(:\)\@<=\s*\([a-zA-Z_.]\+\)\(<[a-zA-Z_, \*]*>\)" "Generics
syntax region typeDeclaration matchGroup=Type start='\vtype.*\=\s\{' end='};' contains=typeDeclarationKeyword
syntax region typeObjectNesting matchGroup=Type contained start='{' end='}' contains=typeCharacters,typeObjectNesting

syntax match typeCharacters contained "[a-zA-Z*?]"
syntax region typeGenerics matchGroup=Type contained start='\v[a-zA-Z]+\<' end='>' contains=typeGenerics

hi def link typeCharacters Type
hi def link typeDeclaration Type
hi def link typeGenerics Type

" JSX

syntax region jsxTagStart matchGroup=Meta start='<[_$a-zA-Z]*\w' end='>' contains=jsxTagStart,jsxExpression,@jsxTag
syntax match Meta '</[_$a-zA-Z]*>' 
syntax region jsxExpression matchGroup=Meta contained start='{' end='}' contains=@jsAll,jsxTagStart,jsxExpression

syntax match jsxTagEnd contained ">"
syntax match jsxTagAttribute contained "\s[a-zA-Z_]*="


" Comment
syn match Comment '//.*$'
syntax region Comment start=+/\*+ end=+\*/+ fold extend keepend
syntax region Comment start=+{/\*+ end=+\*/}+ fold extend keepend
syntax match Comment '^#!.*$'


" Grouping
syntax cluster jsAll contains=Constant,String,Keyword
syntax cluster jsxTag contains=jsxTagEnd,jsxTagAttribute,String


" Linking

hi def link jsBoringRegex String
hi def link jsxTagEnd Meta
hi def link jsxTagAttribute Meta



let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif

" Vim syntax file

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword Keyword async arguments break case catch class const continue debugger default delete do else export extends finally for function from if import in instanceof new return super switch this throw try typeof var void while with yield enum implements interface let package private protected public static await abstract boolean byte char double final float goto int long native short synchronized throws transient volatile

" Type Keywords
syn keyword Keyword type declare interface


"
" Constants
"

syn keyword Constant true false null Infinity NaN undefined

" Numbers
syn match Constant '\<[0-9]\+\(\.[0-9]\+\)\?'
syn match Constant '\<0b[0-1]*'
syn match Constant '\<0o[0-7]*'
syn match Constant '\<0x[0-9a-fA-F]*'
syn match Constant '\.[0-9]\+'
syn match Constant 'e[-+]\?[0-9]\+'


" Strings
syn region String start='\'' end='\''
syn region String start='"' end='"'
syn region String start='`' end='`'


" Comment
syn match Comment '//.*$'
syntax region Comment start=+/\*+ end=+\*/+ fold extend keepend
syntax region Comment start=+{/\*+ end=+\*/}+ fold extend keepend

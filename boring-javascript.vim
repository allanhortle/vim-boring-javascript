" Vim syntax file

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword Keyword async arguments break case catch class const continue debugger default delete do else export extends finally for function from if import in instanceof new return super switch this throw try typeof var void while with yield enum implements interface let package private protected public static await abstract boolean byte char double final float goto int long native short synchronized throws transient volatile

" Type Keywords
syn keyword Keyword type declare interface


" Strings
syn region String start='\'' end='\''
syn region String start='"' end='"'
syn region String start='`' end='`'


" Comment
syn match Comment '//.*$'
syntax region Comment start=+/\*+ end=+\*/+ fold extend keepend
syntax region Comment start=+{/\*+ end=+\*/}+ fold extend keepend

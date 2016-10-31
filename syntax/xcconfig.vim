if exists("b:current_syntax")
  finish
endif

" Comments start with // and continue for the rest of the line
syntax match xcconfigComment "\v\/\/.*" contains=@Spell oneline
highlight default link xcconfigComment Comment

" booleans
syntax keyword xcconfigBooleans
      \ YES
      \ NO
highlight default link xcconfigBooleans Boolean

" Numbers
syntax match xcconfigNumber "\v<\d+>"
syntax match xcconfigNumber "\v<\v\d+[[:digit:]\.]+\d+>"
highlight default link xcconfigNumber Number

" Various special keywords that deserve custom highlighting
syntax keyword xcconfigAttributes
      \ @rpath
      \ inherited
highlight default link xcconfigAttributes PreProc

" Includes start with one of these identifiers, followed by a double quoted path
syntax keyword xcconfigImports
      \ #include
      \ #include?
highlight default link xcconfigImports Include

" Variable regions, this matches either $(FOO) or ${BAR} style variables on a
" single line. They can contain special keywords (like 'inherited')
syntax region xcconfigVariable start=/$(/ end=/)/ contains=xcconfigAttributes oneline
syntax region xcconfigVariable start=/${/ end=/}/ contains=xcconfigAttributes oneline
highlight default link xcconfigVariable Identifier

" Strings, anything wrapped in single or double quotes for one line
syntax region xcconfigString start=/"/ end=/"/ oneline
syntax region xcconfigString start=/'/ end=/'/ oneline
highlight default link xcconfigString String

let b:current_syntax = "xcconfig"

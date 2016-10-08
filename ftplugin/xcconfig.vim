" Add @ # ? to keywords
" @ is required to easily highlight special words like `@rpath`
" # is required to easily highlight special words like `#include`
" ? is required to easily highlight special words like `#include?`
"
" This has the side effect of making `dw` delete these characters, which may be
" unexpected. In that case we can remove these and use regex to match the above
" examples.
"
setlocal iskeyword+=@-@,#,?

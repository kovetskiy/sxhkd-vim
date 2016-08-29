if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "sxhkd"

syntax match sxhkd_binding "\v^.*$" contains=sxhkd_on_release,sxhkd_binding_pass
syntax match sxhkd_on_release "\v^\@" contained
syntax match sxhkd_binding_pass "\v^\~" contained
syntax match sxhkd_exec "\v^\s+.*" contains=@sxhkd_shell
syntax match sxhkd_comment "\v#.*$"

highlight link sxhkd_comment Comment
highlight link sxhkd_binding Identifier
highlight link sxhkd_binding_on_release Conditional
highlight link sxhkd_binding_pass Constant
highlight link sxhkd_exec Macro

" match shell command
let s:current_syntax = b:current_syntax
unlet b:current_syntax

syntax include @sxhkd_shell syntax/sh.vim
let b:current_syntax = s:current_syntax

syntax region shLine matchgroup=sxhkd_exec start=/\v^\s+\s/ end=/\v$/ contains=@sxhkd_shell

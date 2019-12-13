if exists("b:did_indent")
  finish
endif

let b:did_indent = 1

setlocal indentexpr=GetIndentSXHKD()

" Only define the function once:
if exists("*GetIndentSXHKD")
  finish
endif

function GetIndentSXHKD()
	" Find a non-blank line above the current line:
	let lnum = prevnonblank(v:lnum - 1)

	" No indent for the start of the file:
	if lnum == 0
		return 0
	endif

	let prev_line = getline(lnum)
	if prev_line =~ '^\s*#'
        return 0
    elseif prev_line =~ '\v^\s+'
        return 0
    else
		return &sw
	endif
endfunction

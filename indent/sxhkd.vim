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

	let indentation = indent(lnum)
	let line = getline(lnum)

	if line =~ '\v^\t'
        let indentation = 0
    else
		let indentation = &sw
	endif

	let line = getline(v:lnum)

    " handle comments
	if line =~ '^\s*#'
		let indentation = 0
	endif

	return indentation
endfunction

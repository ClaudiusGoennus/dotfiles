set number relativenumber numberwidth=4
set shiftwidth=4 tabstop=4
set foldmethod=marker
set foldlevelstart=1

set statusline=%f%r:\ %y%=%l/%L

let mapleader = " "
let maplocalleader = "\\"
let $OLDVIMRC = "~/.vimrc"


" MAPPINGS {{{
	" NORMAL {{{
		" print messages
		nnoremap <c-m> :messages<cr>
		" edit/source vimrc
		nnoremap <leader>ev :split $OLDVIMRC<cr>	
		nnoremap <leader>sv :source $OLDVIMRC<cr>
		" surround word
		nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
		nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
		" indent file
		nnoremap <leader>i gg=G
	" }}}
	
	" INSERT {{{
		" replace <esc>
		"inoremap jk <esc>
		" uppercase word
		inoremap <c-u> <esc>viwUwi
	" }}}
	
	" VISUAL {{{
		" replace <esc>
		"vnoremap jk <esc>
		" surround selection
		vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
		vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
	" }}}
	
	" NOPs {{{
	inoremap <left> <nop>
	inoremap <right> <nop>
	inoremap <up> <nop>
	inoremap <down> <nop>
	"inoremap <esc> <nop>
	"vnoremap <esc> <nop>
	" }}}

	" OPERATORS {{{
	" either text between cursor position and end, or
	" in visual selection

	" in/around next parens type
	onoremap in( :<c-u>normal! f(vi(<cr>
	onoremap il( :<c-u>normal! F)vi(<cr>
	onoremap an( :<c-u>normal! f(va(<cr>
	onoremap al( :<c-u>normal! F)va(<cr>
	onoremap in[ :<c-u>normal! f[vi[<cr>
	onoremap il[ :<c-u>normal! F]vi[<cr>
	onoremap an[ :<c-u>normal! f[va[<cr>
	onoremap al[ :<c-u>normal! F]va[<cr>
	onoremap in{ :<c-u>normal! f{vi{<cr>
	onoremap il{ :<c-u>normal! F}vi{<cr>
	onoremap an{ :<c-u>normal! f{va{<cr>
	onoremap al{ :<c-u>normal! F}va{<cr>
	" in next email address
	onoremap in@ :<c-u>execute "normal! /\\S\\+@[a-zA-Z0-9-]\\+\\.[a-zA-Z]\\+\rvgn"<cr>
	" }}}
" }}}

"  ABBREVIATIONS {{{
		" INSERT {{{
		iabbrev @@ nikolaus.lautner@protonmail.com
		" }}}
"  }}}

" AUTOCMDS {{{
" autocmd Event filter_pattern command [<buffer>]
" autocmd-events
augroup filetype_javascript "{{{
	autocmd!
	"commenting
	autocmd filetype javascript nnoremap <buffer> <localleader>c I//<esc>
	autocmd filetype javascript vnoremap <buffer> <localleader>c <esc>`<O/*<esc>`>o*/<esc>
augroup END "}}}
augroup filetype_cs "{{{
	autocmd!
	"commenting
	autocmd filetype cs nnoremap <buffer> <localleader>c i//<esc>
	autocmd filetype cs vnoremap <buffer> <localleader>c <esc>`<O/*<esc>`>o*/<esc>
augroup END "}}}
augroup filetype_c "{{{
	autocmd!
	"commenting
	autocmd filetype c nnoremap <buffer> <localleader>c i//<esc>
	autocmd filetype c vnoremap <buffer> <localleader>c <esc>`<O/*<esc>`>o*/<esc>
augroup END "}}}
augroup filetype_vim "{{{
	autocmd!
	"commenting
	autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
augroup END "}}}
augroup filetype_xdefaults "{{{
	autocmd!
	"commenting
	autocmd FileType xdefaults nnoremap <buffer> <localleader>c I!<esc>
augroup END "}}}
augroup filetype_python "{{{
	autocmd!
	"commenting
	autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
augroup END "}}}
augroup filetype_yaml "{{{
	autocmd!
	"commenting
	autocmd FileType yaml nnoremap <buffer> <localleader>c I#<esc>
augroup END "}}}
augroup filetype_lua "{{{
	autocmd!
	"commenting
	autocmd FileType lua nnoremap <buffer> <localleader>c I--<esc>
augroup END "}}}
augroup filetype_markdown "{{{
	autocmd!
	"commenting
	autocmd FileType markdown nnoremap <buffer> <localleader>c I[//]: # <esc>O<esc>jo<esc>
	" inside/around heading
	autocmd Filetype markdown onoremap <buffer> ih :<c-u>execute "normal! ?^[=-]\\+$\r:nohlsearch\rkvg_"<cr>
	autocmd Filetype markdown onoremap <buffer> ah :<c-u>execute "normal! ?^[=-]\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END "}}}

	"autocmd FocusGained
	"autocmd WinEnter 
" }}}

" LEARN VIMSCRIPT {{{
autocmd BufNewFile * :write
" }}}

" let s:unite_source = {
"       \ 'name': 'handy',
"       \ }

" function! s:unite_source.gather_candidates(args, context)
"   " [(name, dir)]
"   " e.g. [('adaryn', '/Users/ujihisa/.vimbundles/ColorSamplerPack/colors'), ...]
"   let colorlist = map(split(globpath(&runtimepath, '*.*'), '\n'),
"       \'[fnamemodify(v:val, ":t:r"), fnamemodify(v:val, ":h")]')

"   return map(colorlist, '{
"         \ "word": v:val[0],
"         \ "source": "colorscheme",
"         \ "kind": "colorscheme",
"         \ "action__path": printf("%s/%s.vim", v:val[1], v:val[0]),
"         \ "action__directory": v:val[1],
"         \ }')
" endfunction

" function! unite#sources#colorscheme#define()
"   return s:unite_source
" endfunction



" Variables  "{{{
call unite#util#set_default('g:unite_source_git_grep_required_pattern_length', 3)
call unite#util#set_default('g:unite_source_git_grep_max_candidates', 100)
"}}}

function! unite#sources#grep#define()"{{{
	return s:source
endfunction"}}}

let s:source = {
			\ 'name'           : 'grep_interactive',
			\ 'is_volatile'    : 1,
			\ 'max_candidates' : g:unite_source_git_grep_max_candidates,
			\ 'required_pattern_length': g:unite_source_git_grep_required_pattern_length,
			\ 'hooks'    : {},
			\ }

" function! s:source.hooks.on_init(args, context)"{{{
" 	if !unite#sources#git_grep#check()
" 		call unite#util#print_error('Not a Git repoitory.')
" 	endif
" endfunction"}}}
"


function! s:source.change_candidates(args, context)"{{{
	return unite#sources#grep#interactive(a:context.input)
endfunction"}}}

" function! unite#sources#git_grep#check()"{{{
" 	call unite#util#system('git rev-parse')
" 	return (unite#util#get_last_status() == 0)? 1 : 0
" endfunction"}}}

function! unite#sources#grep#interactive(input)"{{{
	let l:result = unite#util#system('ag' . a:input . '"')
	let l:matches = split(l:result, '\r\n\|\r\|\n')
  let l:entries = map(l:matches, '[v:val, split(v:val, ":")]')
  return map(l:entries,
    \ '{
    \   "word": v:val[0],
    \   "source": "grep_interactive",
    \   "kind": "jump_list",
    \   "action__path": v:val[1][0],
    \   "action__line": v:val[1][1],
    \   "action__text": join(v:val[1][2:], ":"),
    \ }')
endfunction"}}}


let g:lightline = {
    \ 'colorscheme': 'gotham',
    \ 'component_type': {
    \   'linter_checking': 'left',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \   'linter_ok': 'left',
    \ },
    \ 'component_function': {
    \   'fugitive': 'LightLineFugitive',
    \   'filename': 'LightLineFilename',
    \   'cocstatus': 'coc#status',
    \   'currentfunction': 'CocCurrentFunction'
    \ },
    \ 'active': {
    \   'left': [
    \             [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified' ],
    \             [ 'fugitive' ],
    \   ],
    \   'right': [ ['cocstatus'],
    \              [ 'lineinfo' ],
    \              [ 'filetype' ],
    \   ],
    \ },
    \ 'inactive': {
    \   'left': [ [ 'filename', 'fugitive' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ] ]
    \ }
    \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  let full_name = expand('%:p')

  if len(full_name) ==# 0
    return ''
  endif

  let shortened_filename = GetFishLikePath(full_name, 2)
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
  \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
  \  &ft == 'unite' ? unite#get_status_string() :
  \  &ft == 'vimshell' ? vimshell#get_status_string() :
  \  &ft == 'fzf' ? '[FZF]' :
  \ '' == expand('%:t') ? '[No Name]' :
  \ '' != shortened_filename ? shortened_filename : '') .
  \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! SubstituteHome(filename)
  let TILDE = '~'
  return substitute(a:filename, $HOME, TILDE, '')
endfunction

function! ShrinkPath(path)
  return "." ==# a:path[0] ? a:path[0:1] : a:path[0]
endfunction

function! GetFishLikePath(filename, level)
  let paths = split(SubstituteHome(a:filename), '/')

  " This is the case where we are at '/'
  if len(paths) ==# 0
    return '/'
  elseif len(paths) ==# 1
    " This is the case where we are in '$HOME' aka '~/'
    if paths[0] == '~'
      return '~/'
    " This is the case where we are in a top level directory like:
    " /var, /etc, /usr, etc.
    else
      return filename
    endif
  endif

  let level = -(a:level)

  let path_folder_file = join(paths[level:], '/')
  let path_before = join(map(paths[0:level-1], {key, val -> ShrinkPath(val)}), '/')

  return path_before . '/' . path_folder_file
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler' && exists('*fugitive#head')
    return fugitive#head()
  endif
  return ''
endfunction

fun CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endf

fun OmniType()
  let type = OmniSharp#actions#documentation#TypeLookup()

  return type == 0 ? "" : type
endf

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

call denite#custom#option('default', 'prompt', '> ')
call denite#custom#option('default', 'empty', 0)
call denite#custom#option('default', 'auto_resize', 1)

call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#var('file_rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
  \ [ '.git/', '.ropeproject/', '__pycache__/',
  \   'images/', '*.min.*', 'bundle.js', 'img/', 'fonts/'])

" Change file_rec command.
call denite#custom#var('file_rec', 'command',
  \ ['ag', '--depth', '10', '--follow', '--nocolor', '--nogroup', '-g', ''])
" buffer
call denite#custom#var('buffer', 'date_format', '')

" Change grep options.
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
    \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Change file_rec matcher
call denite#custom#source('file_rec,redis_mru', 'matchers', ['matcher_cpsm'])
call denite#custom#source('line', 'matchers', ['matcher_regexp'])
" Sorter of file_rec
call denite#custom#source('file_rec,outline,redis_mru,note', 'sorters', ['sorter_rank'])

" Change mappings.
call denite#custom#map(
      \ 'insert',
      \ '<C-a>',
      \ '<denite:move_caret_to_head>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ '<C-s>',
      \ '<denite:do_action:vsplit>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ '<C-t>',
      \ '<denite:do_action:tabopen>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ '<C-d>',
      \ '<denite:do_action:delete>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ '<C-b>',
      \ '<denite:scroll_page_backwards>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ '<C-f>',
      \ '<denite:scroll_page_forwards>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ '<C-p>',
      \ '<denite:print_messages>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'normal',
      \ '<esc>',
      \ '<denite:quit>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'insert',
      \ 'jj',
      \ '<denite:quit>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'normal',
      \ 'a',
      \ '<denite:do_action:add>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'normal',
      \ 'd',
      \ '<denite:do_action:delete>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'normal',
      \ 'r',
      \ '<denite:do_action:reset>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'normal',
      \ 's',
      \ '<denite:do_action:vsplit>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'normal',
      \ 'e',
      \ '<denite:do_action:edit>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'normal',
      \ 'h',
      \ '<denite:do_action:help>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'normal',
      \ 'u',
      \ '<denite:do_action:update>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'normal',
      \ 'f',
      \ '<denite:do_action:find>',
      \ 'noremap'
      \)


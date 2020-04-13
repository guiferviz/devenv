
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufNewFile,BufRead *.csv setf csv
  au! BufNewFile,BufRead *.tsv setf tsv
  au! BufNewFile,BufRead *.cards setf cards
  au! BufNewFile,BufRead *.fl,*.flex,*.l,*.lm setf lex
  au! BufNewFile,BufRead *.y,*.ypp,*.ym setf yacc
augroup END


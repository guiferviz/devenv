
" Vim syntax file
" Language: Markdown memorization cards
" Maintainer: guiferviz
" Latest Revision: January 2020

if exists("b:current_syntax")
  finish
endif

" Inside the cards, markdown syntax highlighting is going to be used.
syn include @markdownSyn syntax/markdown.vim
unlet! b:current_syntax


"""""""""""""""""""""""""""""""""""""""""""""
"  Keywords, regex and region definitions.  "
"""""""""""""""""""""""""""""""""""""""""""""

" All text that is not inside of a card is a comment, so it's ignored
" for the card generator.
syn region cardComment
\   start="^" end="$"
\   contains=cardTodoComment,cardBlock

" Common comment tags.
syn keyword cardTodoComment contained TODO FIXME XXX NOTE

" Cards definition. Basically, anything between <<< and >>>.
" matchgroup should be before start and end.
syn region cardBlock
\   start="<\{3,\}"
\   matchgroup=cardDelimiter
\   end=">\{3,\}"
\   fold contained keepend
\   contains=cardBlockMetadata

syn region cardBlockMetadata
\   matchgroup=cardDelimiter
\   start="<\{3,\}"
\   end="\ze=\{3,\}"
\   contained keepend
\   contains=cardMetadataId,cardMetadataValue
\   nextgroup=cardBlockTitle
syn match cardMetadataId /^\w*\ze:/ contained

syn region cardBlockTitle
\   matchgroup=cardDelimiter
\   start="=\{3,\}"
\   end="\ze-\{3,\}"
\   contained keepend
\   contains=@markdownSyn
\   nextgroup=cardBlockBody

syn region cardBlockBody
\   matchgroup=cardDelimiter
\   start="-\{3,\}"
\   matchgroup=cardDelimiter
\   end=">\{3,\}"
\   contained keepend
\   contains=@markdownSyn


"""""""""""""""""""""""""""""
"  Highlight default links  "
"""""""""""""""""""""""""""""

hi def link cardComment Comment
hi def link cardTodoComment Todo
hi def link cardDelimiter Delimiter
hi def link cardMetadataId Identifier


let b:current_syntax = "cards"


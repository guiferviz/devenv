
" Start the list of vim plugins.
call plug#begin("~/.config/nvim/pluggins")

    " Add an status bar.
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Download better colorschemes.
    " Sublime text monokai.
    Plug 'crusoexia/vim-monokai'

    " File system browser.
    Plug 'scrooloose/nerdtree'

" End the list of vim plugins
call plug#end()

" Add a mapping for the NERDTree command, so you can just type :T to open
command T NERDTree

" Allow clicks with mouse to move the cursor.
" Don't use the mouse too much!!
set mouse=a

" Show line numbers.
set number
" Show row numbers relative to the current line.
set relativenumber

" Add a bar on the side which indicates the maximum row length.
set colorcolumn=80

" Set default theme.
colorscheme monokai
" Set Airline status bar theme.
let g:airline_theme='peaksea'

" Tab with 4 spaces.
set expandtab
set tabstop=4
set shiftwidth=4


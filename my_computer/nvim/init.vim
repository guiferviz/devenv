
" Start the list of vim plugins.
call plug#begin("~/.config/nvim/pluggins")

    " Add an status bar.
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Download better colorschemes.
    " Sublime text monokai.
    Plug 'crusoexia/vim-monokai'
    " Solarized (dark and light).
    Plug 'altercation/vim-colors-solarized'

    " File system browser.
    Plug 'scrooloose/nerdtree'
    " Nerdtree git support!
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " Allows you to run git commands from vim.
    Plug 'tpope/vim-fugitive'

    " A very nice git commit explorer.
    Plug 'junegunn/gv.vim'

    " Mark tabulations to a better visual experience.
    Plug 'Yggdroot/indentLine'

    " Repeat last command.
    Plug 'tpope/vim-repeat'

    " Easy work with CSV and similar separated value files.
    Plug 'mechatroner/rainbow_csv'

    " Snippet manager.
    Plug 'sirver/ultisnips'

    " Markdown Preview.
    " If you have nodejs and yarn.
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

    " Autocompletion with support for UtilSnips.
    " Follow the install instructions in:
    " https://github.com/ycm-core/YouCompleteMe/wiki/Full-Installation-Guide
    " You need to compile something.
    Plug 'ycm-core/YouCompleteMe'

" End the list of vim plugins
call plug#end()

"set encoding=utf-8
"let g:airline_theme='powerlineish'

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

" Change between dark and light colorschemes easily.
function Dark()
    set background=dark
    let g:airline_solarized_bg='dark'
    colorscheme solarized
endfunction
function Light()
    set background=light
    let g:airline_solarized_bg='light'
    colorscheme solarized
endfunction
command Dark call Dark()
command Light call Light()

" Set default theme.
" Uncomment next line to select monokai as default colorscheme.
"colorscheme monokai
" Uncomment next lines to select solarized. background can be dark or light.
let g:solarized_termcolors=256  " Needed for terminals.
syntax enable
" Set dark theme.
set background=dark
let g:airline_solarized_bg='dark'
" When installing plugins with "nvim +PlugInstall +qall" this file, the
" init.vim file, is loaded but the colorscheme is not still installed, so it
" fails. That's why I'm using here a try-catch, to avoid the error message.
try
    colorscheme solarized
catch
endtry
" Set Airline status bar theme.
let g:airline_theme='solarized'
" Activate powerline font for rendering symbols.
let g:airline_powerline_fonts = 1

" Tab with 4 spaces.
set expandtab
set tabstop=4
set shiftwidth=4

" Tab character indicator.
" Any of these are good options: '|', '¦', '┆', '┊'
let g:indentLine_char = '¦'

" Ignore __pycache__ dirs in NERDTree.
let NERDTreeIgnore = ['__pycache__']
" Show hidden files by default.
let NERDTreeShowHidden=1

" Avoid hidden characters in markdown and JSONs, like the quotes or the *.
set conceallevel=0
" The plugin indentLine requires conceallevel=0 so it changes it
" automatically. Avoid the execution of this pluging in json and markdown
" filetypes.
" More info in: https://vi.stackexchange.com/questions/12520/markdown-in-neovim-which-plugin-sets-conceallevel-2
let g:indentLine_fileTypeExclude = ['markdown', 'json', 'cards']

" Snippet manager settings.
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" Tags.
" Use notagrelative if storing the tag file inside the ".git" folder.
set notagrelative
set tags+=.git/tags
command! MakeTags !ctags -R -f ./.git/tags .

" Allow find commands to find files in subdirectories.
set path+=**

" MarkdownPreview plugin can be used in any filetype, not only markdown.
" Interested in execute the plugin in *.cards filetype.
let g:mkdp_command_for_global = 1

let g:completor_python_binary = '/usr/bin/python3.6'

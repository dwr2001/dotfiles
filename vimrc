" author: Duan Wenrui
" email: isduanwenrui2001@163.com

" => General
set autoread        " set auto (re)read when file changed from outside
set nobackup        " don't save backup file
set nocompatible    " disable Vim to Vi compatibility
set encoding=utf-8  " set character encoding
set history=1000    " set how many lines of history Vim has to remember


" => Programming language support
filetype on " enable recognation of file types
filetype indent plugin on
syntax on   " start highlighting


" => Vim menu
set wildmenu    " turn on enhanced completion menu
set wildignore=*.o,*~,.git\*
set wildmode=list:longest   " completion mode used for the character specified with


" => Vim user interface
set number          " precede each line with its line number
set cursorcolumn    " highlight the column of the cursor
set cursorline      " highlight the line of the cursor

set showbreak=>     " show string put at the start of lines that have been wrapped
set showcmd         " show command in the last line of the screen
set showmatch       " show briefly jump to the matching one when bracket inserted
set showmode        " show Vim mode on the last line of the screen
set showtabline=2   " set always show the line with tab page labels


" => Statusline
set laststatus=2                    " always show status line
set statusline=%F                   " full path to the file in the buffer
set statusline+=%m%r                " modified and readonly flag
set statusline+=%=                  " separation between alignment sections
set statusline+=\ %l:%c             " line and column number
set statusline+=\ %3p%%/%L          " percentage and number of the total line
set statusline+=\ %{&fileformat}    " file format
set statusline+=\ %y                " type of file


" => Mouse behaviour
set mouse=a     " make mouse enable in all modes
set mousefocus  " automatically activate the mouse in the current window


" => hjkl Enhanced
set whichwrap=b,s,h,l,<,>,~,[,]
set scrolloff=4 " minimal number of lines to keep above/below the cursor


" => Search
set hlsearch    " highlight search results
set ignorecase  " ignore case in search pattern
set incsearch   " match the results when typing search pattern
set smartcase   " override the 'ignorecase' if search pattern contains upper case


" => Tabs and Spaces
set tabstop=4
set softtabstop=0
set shiftwidth=4 smarttab
set autoindent smartindent " copy indent from current line when starting a new line


" => Pair match and Key map
set matchpairs=(:),{:},[:],<:>
set matchtime=2
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i

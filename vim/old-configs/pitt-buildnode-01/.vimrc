
" --- Enabling syntax highlighting
"     and color settings
syntax on
set t_Co=256
"--- colors for dark background
"--- :set background=dark 

" --- Default window width as startup
"set lines=100 columns=100


"uncomment to set the line numbers ON: line numbers are displaied for each line"
"set nu

"set the ruler ON: on the last line the position of the cursor is shown."
set ru

" ----- Settings useful for Python
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab  	" Insert spaces instead of <TAB> character when the <TAB> key is pressed. This is also the prefered method of Python coding, since Python is especially sensitive to problems with indenting which can occur when people load files in different editors with different tab settings, and also cutting and pasting between applications (ie email/news for example) can result in problems. It is safer and more portable to use spaces for indenting.
set softtabstop=4 	" People like using real tab character instead of spaces because it makes it easier when pressing BACKSPACE or DELETE, since if the indent is using spaces it will take 4 keystrokes to delete the indent. Using this setting, however, makes VIM see multiple space characters as tabstops, and so <BS> does the right thing and will delete four spaces (assuming 4 is your setting).
set autoindent 	" Very painful to live without this (especially with Python)! It means that when you press RETURN and a new line is created, the indent of the new line will match that of the previous line.
" ----- 

" --- disable system bell sound
set vb

" vim-markdown settings
let g:vim_markdown_folding_disabled = 1



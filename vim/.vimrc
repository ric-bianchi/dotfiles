


set ruler
set autoread
filetype indent plugin on

" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" source: https://gist.github.com/rocarvaj/2513367 (original author: Gerhard Gappmeier)
"

" VIM-PLUG plugin manager
" Automatically installs vim-plug if not installed
" See: https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
    :echo "vim-plug is missing on this machine. Installing it..."
    :echo ""
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" load Plugins.vim from the relative path of your vimrc
source <sfile>:h/.vim/Plugins.vim
" Initialize plugin system
call plug#end()



" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" enable mouse mode
set ttymouse=xterm2
set mouse=a

" disable vi compatibility (emulation of old bugs)
set nocompatible
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
"set textwidth=120
" turn syntax highlighting on
set t_Co=256
syntax on
" turn line numbers on
"set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" vim-cpp-enhanced-highlight settings
let g:cpp_member_variable_highlight = 1

" colorscheme
"colo wombat256mod
"colo wombat256i
"colo desert
" enable Dracula color scheme
" see: https://draculatheme.com/vim
"packadd! dracula
"syntax enable
"let g:dracula_italic = 0 " This is to fix iTerm2 behavior (https://github.com/dracula/vim/issues/127). 
"Better to fix iTerm2, see: https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/
"colorscheme dracula
if v:version < 800 " to see your version, type inside vim: ':echo v:version'
    :echo "VIM version < 8, so I set 'Dracula' theme instead of Dracula_PRO"
    syntax enable
    colorscheme dracula
    highlight Normal ctermbg=NONE
else
    " enbale dracula_pro
    packadd! dracula_pro
    syntax enable
    let g:dracula_colorterm = 0
    colorscheme dracula_pro
    "colorscheme dracula_pro_van_helsing
endif

" enable italicised comments, if your theme doesn't set that already.
" NOTE: 
" - this should be put AFTER 'colorscheme' and any theme-related commands
" - you must have a terminal which supports italic to use that effectively
" - See:
"   https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/#tmux-2.1-and-above
highlight Comment cterm=italic


" Modify the colors of the matching parenthesis, to make it more visible
hi MatchParen cterm=bold ctermbg=green ctermfg=red

" functions to be used by teh status line
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
" status line settings
set laststatus=2 " '2' means: always shows the status bar
"set statusline+=%f " shows full path of the current file in the status bar
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f " show relative path of the current file
set statusline+=%m\
set statusline+=%=
"set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
"set statusline+=\
"
 
syntax on
colorscheme dracula


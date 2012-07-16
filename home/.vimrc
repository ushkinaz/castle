syntax on            
set tabstop=2           " tabs
set shiftwidth=2		" used to expand tabs to spaces
set expandtab			" expand tabs to spaces

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden


set background=dark
set linebreak

" Show partial commands in the last line of the screen
set showcmd

set nocompatible      " no std vi
set backspace=indent,eol,start

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler


" set nobackup
" set backup
" set backupdir=$HOME/.vim/backups
" set directory=$HOME/.vim/temp

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase


set hlsearch " hightlight search
set is  " incremental search

imap <F9> <Esc>:set<Space>nu!<CR>
nmap <F9> :set<Space>nu!<CR>

map <S-tab> :tabprevious<cr>
nmap <S-tab> :tabprevious<cr>
imap <S-tab> <ESC>:tabprevious<cr>i
map <C-tab> :tabnext<cr>
nmap <C-tab> :tabnext<cr>
imap <C-tab> <ESC>:tabnext<cr>i
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>


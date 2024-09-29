source $VIMRUNTIME/defaults.vim

syntax on
filetype plugin indent on

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when tab completing
set wildmenu

" 1 tab == 2 spaces
set softtabstop=2
" set tabstop=2 " vim docs actually recommend keeping this set to 8 (default)
set shiftwidth=2

set expandtab
set smarttab
set guifont=Iosevka\ 20
set guioptions-=m
set guioptions-=T
set noesckeys
set relativenumber
set number
set ignorecase
set smartcase
set incsearch
" modelines are an alternative way of changing options without the ":set" cmd
set modeline
set laststatus=2
set statusline=%f%m%=%y\ 0x%B\ %l:%c\ %p%%

" required for mac delete to work
set backspace=indent,eol,start

set autoindent
set smartindent

" Emacs bindings for insert mode
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-d> <Del>

" ################### FILE BROWSING #########################

let g:netrw_browse_split=4 " open in prior window
let g:netrw_altv=1 " open splits to the right
let g:netrw_liststyle=3 "tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" ################### VISUALS ###############################
set background=dark
colorscheme desert

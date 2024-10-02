" i'm drawing heavily from
" https://github.com/rwxrob/dot/blob/main/vim/vimrc
" but also adding my own customizations
" /usr/share/vim/vim90
source $VIMRUNTIME/defaults.vim

syntax on
filetype plugin indent on

" ##################### GENERAL SETTINGS ###############################

" might be riskier, but git should be enough
set nobackup
set noswapfile
set nowritebackup

" format options
set fo-=t " don't auto-wrap text using text width
set fo+=c "auto-wrap comments using text width with leader
set fo-=r " don't auto-insert comment leader on enter in insert mode
set fo-=o " don't auto-insert comment leader on enter on o/O in normal mode
set fo+=q " allow formatting of comments with gq
set fo-=w " don't use trailing whitespace to determine paragraph boundaries
set fo-=a " don't auto-format paragraph changes
set fo-=n " don't recognize numbered lists
set fo+=j " delete comment prefix when joining
set fo-=v " don't use broken vi-compatible auto-wrapping
set fo-=b " don't use broken vi-compatible auto-wrapping
set fo+=l " don't break long lines in insert mode
set fo+=1 " don't break a line after a 1 letter word


" prevent truncated deletes, yanks, etc
set viminfo='20,<1000,s1000

" enable omni completion for every filetype that does not already have
" a language specific OMNI script
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \ if &omnifunc == "" |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when tab completing
set wildmenu

" 1 tab == 2 spaces
set softtabstop=2
" set tabstop=2 " vim docs actually recommend keeping this set to 8 (default)
set shiftwidth=2

set textwidth=72

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

" ################### PLUGINS ###############################

" only load plugins if Plug is detected
if filereadable(expand("~/.vim/autoload/plug.vim"))
  " github.com/junegunn/vim-plug
  
  call plug#begin('~/.local/share/vim/plugins')
  Plug 'morhetz/gruvbox'
  call plug#end()
  
  " gruvbox config
  autocmd vimenter * ++nested colorscheme gruvbox
  if (has("termguicolors"))
    set termguicolors
  endif
  let g:gruvbox_contrast_dark="hard"
endif

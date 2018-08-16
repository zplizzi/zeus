" BEGIN Vundle + Plugin config
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"" User plugins
" Show directory tree in left panel
Plugin 'scrooloose/nerdtree'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
" Nice color scheme
Plugin 'altercation/vim-colors-solarized'
Plugin 'hynek/vim-python-pep8-indent'
" Prose handling: soft-wrap, etc
Plugin 'reedes/vim-pencil'
" Github plugin
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
" Add substitute command
Plugin 'svermeulen/vim-easyclip'
" Required for vim-easyclip
Plugin 'tpope/vim-repeat'
Plugin 'zplizzi/vipy'

" Cool plugins to think about adding
" ctrlp, ack/ag

" Tried a statusbar plugin but didn't like. Font patching is annoying.
" Also eats an extra line of text for not much gain.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required, sets smart file-specific indenting settings.
" END Vundle

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Use jk for esc
:inoremap jk <Esc>

" Use comma as leader
:let mapleader = ","
set showcmd

" not sure if this does anything, but causes next line to be indented same as previous
ret autoindent

" Set up color scheme
set background=dark
colorscheme solarized

" Use system clipboard
"set clipboard=unnamedplus
set clipboard=unnamed

" Easyclip settings
let g:EasyClipUseSubstituteDefaults = 1

" confim instead of error when leaving unsaved file
set confirm

" Enable use of the mouse for all modes
set mouse=a

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" remember more than 8 commands of history
set history=400

" shortcut to source vimrc
noremap <leader>sv :source ~/.vimrc<CR>
" shortcut to edit vimrc
noremap <leader>ev :vsplit ~/zeus/dotfiles/.vimrc<CR>
noremap <leader>s :source %<CR>


" shortcuts to edit vimrc/zshrc
" currently broken because replaces vimrc in paths with this command
"ca vimrc :e ~/zeus/.vimrc
"ca zshrc :e ~/zeus/.zshrc

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Stop auto-commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Start NERDTree by default
autocmd VimEnter * NERDTree
" Don't show pyc files
let NERDTreeIgnore = ['\.pyc$']
"let NERDTreeShowBookmarks=1
nnoremap <Leader>f :NERDTreeToggle<Enter>
" It might be cool to have NERDTree open to the current file. Something like
" this.
"nnoremap <silent> <Leader>f :NERDTreeFind<CR>
" Get rid of the `Press ? for help`
let NERDTreeMinimalUI = 1
" Hide after opening a file
let NERDTreeQuitOnOpen = 1
" Nerdtree ignore filetypes
let NERDTreeIgnore = ['\.pyc$']

" Use soft-wrap by default with pencil
let g:pencil#wrapModeDefault = 'soft'

" Set tab width properly
function! TabWidth(width)
  " Expand tabs to spaces
  setlocal expandtab
  " The width of a tab character in spaces
  execute "set tabstop=".a:width
  " The with of an indent, in spaces
  execute "setlocal shiftwidth=".a:width
  " Confusing. Set same as expandtab in most cases
  execute "setlocal softtabstop=".a:width
endfunction

" function for switching to prose mode
function! Prose()
  call TabWidth(4)
  " use pencil for soft line wrapping
  call pencil#init()
  " add a bit of left padding
  set foldcolumn=1
endfunction

" function for switching to code mode
" Use tab_width spaces for an indent
function! Code(tab_width)

  call TabWidth(a:tab_width)

  " Switch syntax highlighting on
  syntax on

  " Show line numbers
  set number

  " make a column at 81, 101 chars wide.
  set colorcolumn=81,101

endfunction

"" FILETYPE-SPECIFIC STUFF
function! Filetypes()
  if &filetype == "python"
    call Code(2)
  elseif &filetype == "markdown"
    call Prose()
  elseif &filetype == "text"
    call Prose()
  elseif &filetype == "nerdtree"
  elseif &filetype == "make"
    call Code(2)
    set noexpandtab
  else
    call Code(2)
  endif
endfunction

autocmd FileType * call Filetypes()


" TODO:
" - Have nerdtree open to current file + become active pane by keystroke
"     Will use less screen real estate!!
" - follow this: https://medium.com/@victormours/a-better-nerdtree-setup-3d3921abc0b9

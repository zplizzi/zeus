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
" Nice color scheme
Plugin 'altercation/vim-colors-solarized'
Plugin 'hynek/vim-python-pep8-indent'
" Prose handling: soft-wrap, etc
Plugin 'reedes/vim-pencil'

" Cool plugins to think about adding 
" powerline or vim-airline
" ctrlp, ack/ag


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required, sets smart file-specific indenting settings.
" END Vundle

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" not sure if this does anything, but causes next line to be indented same as previous
ret autoindent		    


" Set up color scheme
set background=dark
colorscheme solarized

" Show line numbers
set number

" make a column at 81, 101 chars wide. Set color (else it's invisible awk)
set colorcolumn=81,101 
highlight ColorColumn ctermbg=8

" confim instead of error when leaving unsaved file
set confirm 

" Enable use of the mouse for all modes
set mouse=a 

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" remember more than 8 commands of history
set history=400

" use \rr shortcut to source vimrc
map <leader>rr :source ~/.vimrc<CR>

" shortcuts to edit vimrc/zshrc
ca vimrc :e ~/zeus/.vimrc
ca zshrc :e ~/zeus/.zshrc

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Stop auto-commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Start NERDTree by default
autocmd VimEnter * NERDTree
let NERDTreeShowBookmarks=1

" Use soft-wrap by default with pencil
let g:pencil#wrapModeDefault = 'soft'

" function for switching to prose mode
function! Prose()
  call pencil#init()
endfunction

" function for switching to code mode
function! Code(tab_width)

	" Expand tabs to spaces
	setlocal expandtab
	" The width of a tab character in spaces
	setlocal tabstop=a:tab_width
	" The with of an indent, in spaces
	setlocal shiftwidth=a:tab_width
	" Confusing. Set same as expandtab in most cases
	setlocal softtabstop=a:tab_width

	" Switch syntax highlighting on
	syntax on

endfunction

"" FILETYPE-SPECIFIC STUFF

" C/CPP
" For c/cpp files, sets to use tabs instead of spaces, and width of 2. 
autocmd FileType c,cpp setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
"autocmd FileType c,cpp call Code(4)

" JAVASCRIPT
autocmd Filetype javascript setlocal expandtab ts=4 sts=4 sw=4

" PYTHON
autocmd BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
"    \ set textwidth=79 |
    \ set expandtab |
"    \ set autoindent |
    \ set fileformat=unix |

" VIMRC
autocmd FileType .vimrc call Code(2)

" MARKDOWN
" Use pencil 
autocmd FileType markdown,mkd call Prose()

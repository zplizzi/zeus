" Vundle + Plugin config

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Put desired plugins here
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
" (was for vim-session) Plugin 'xolox/vim-misc'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'hynek/vim-python-pep8-indent'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required, sets smart file-specific indenting settings.
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Make backspace behave in a sane manner.
set backspace=indent,eol,start

ret autoindent		    " not sure if this does anything, but causes next line to be indented same as previous

" For c/cpp files, sets to use tabs instead of spaces, and width of 2. 
autocmd FileType c,cpp setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2

" Switch syntax highlighting on
syntax on

" Set up color scheme
set background=dark
colorscheme solarized

" Show line numbers
set number

" make a column at 81, 101 chars wide
set colorcolumn=81,101 

set confirm " confim instead of error when leaving unsaved file
set mouse=a " Enable use of the mouse for all modes

inoremap jk <esc> " jk is escape

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" remember more than 8 commands of history
set history=200

" use \rr shortcut to source vimrc
map <leader>rr :source ~/.vimrc<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Stop auto-commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Ag root is cwd (set with NERDTree) 
let g:ag_working_path_mode="c"

" Start NERDTree by default
autocmd VimEnter * NERDTree
let NERDTreeShowBookmarks=1

" CtrlP uses desired directory as root
" Remap normal ctrlp behaviour to something else
let g:ctrlp_map = '<c-a>'
" Now map it back to what we really want
noremap <C-p> :CtrlP ~/fb/connectivity-lab/hapilink_o<CR>

" Don't open files by default in Ag. also, caps are annoying
ca ag Ag!

" shortcuts
ca vimrc :e ~/zeus/.vimrc
ca zshrc :e ~/zeus/.zshrc

" Save cache on exit
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_use_caching = 1

" Search by filename (not full path) by default
let g:ctrlp_by_filename = 1

" Dont' include hidden files (dotfiles) :
let g:ctrlp_show_hidden = 0

" Increase max search 
let g:ctrlp_max_files=0 
let g:ctrlp_max_depth=40

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Try to get clipboard connected to sys clipboard
"set clipboard=unnamed


" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
" nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
"nnoremap z/ :call Do_z()<CR> 
"function! Do_z()
"	if AutoHighlightToggle()
"		set hls
"	endif
"endfunction
"function! AutoHighlightToggle()
"   let @/ = ''
"   if exists('#auto_highlight')
"     au! auto_highlight
"     augroup! auto_highlight
"     setl updatetime=0
"     echo 'Highlight current word: off'
"r     return 0
"  else
"    augroup auto_highlight
"    au!
"    au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
"    augroup end
"    setl updatetime=0
"    echo 'Highlight current word: ON'
"  return 1
" endif
"endfunction

"call AutoHighlightToggle()
"set hlsearch
"autocmd BufEnter * :call Do_z()
"autocmd BufEnter * setlocal hls
"augroup auto_highlight
"au!
"au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
"augroup end
"setl updatetime=0


autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

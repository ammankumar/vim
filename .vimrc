"Behave like vim instead of vi"
set nocompatible
 
"Attempt to detect filetype/contents so that vim can autoindent etc 
filetype indent plugin on
 
"Enable syntax highlighting 
syntax on
 
"Enable switching from an  unsaved buffer without saving it first and keep an undo history for multiple files. Warn when quitting without saving, and keep swap files.
set hidden
 
"Better command-line completion 
set wildmenu
 
"Show partial commands in the last line of the screen
set showcmd
 
"Highlight searches (use Ctrl+L to temporarily turn off highlighting)"
set hlsearch 
hi Search guibg=LightBlue
"nnoremap <C-L>  :nohlsearch<CR><C-L>:echo<CR>
nnoremap <C-L> :nohl<CR><C-L>
" Press F4 to toggle highlighting on/off, and show current value.
noremap <F4> :set hlsearch! hlsearch?<CR>
 
"Use case insensitive search, except when using capital letters
set ignorecase 
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
"When opening a new line and no filetype-specific indenting is enabled, keep the same indent as the line you're currently on(Useful for READMEs, etc)
set autoindent
 
"Display the cursor position on the last line of the screen or in the status line of a window
set ruler
 
"Always display the status line, even if only one window is displayed
set laststatus=2
 
"Instead of failing a command because of unsaved changes, instead raise a  dialogue asking if you wish to save changed files 
set confirm
 
"Use visual bell instead of beeping when doing something wrong 
set visualbell
 
"Set the command window height to 2 lines, to avoid many cases of having to press <Enter> to continue  
set cmdheight=2
 
"Display line numbers on the left
"set number
 
"Quickly time out on keycodes, but never time out on mappings 
set notimeout ttimeout ttimeoutlen=200
 
"Use F11 to toggle between paste and nopaste
set pastetoggle=<F11>
 
"Enable firefox/google chrome like tab navigation
nmap <C-S-tab> :tabprevious<CR> 
nmap <C-tab> :tabnext<CR> 
map <C-S-tab> :tabprevious<CR> 
map <C-tab> :tabnext<CR> 
imap <C-S-tab> <Esc>:tabprevious<CR>i 
imap <C-tab> <Esc>:tabnext<CR>i 
nmap <C-t> :tabnew<CR> 
imap <C-t> <Esc>:tabnew<CR>
 
"Highlight the current line
set cursorline
 
"Share windows clipboard
set clipboard+=unnamed
 
"Indentation hardtab express settings
set shiftwidth=2 
set softtabstop=2 
set expandtab
 
"Set the color theme to be used 
colors default

"if exists('+colorcolumn')
"  set colorcolumn=80
"else
"  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

filetype plugin indent on
filetype indent on
set et
" The next is your tab stop. Lot of people like to keep it 4.
set sw=2
set smarttab
"set number
"set guifont=Consolas\ 10
"set guifont=Monaco:h20
"set guifont=ProggyCleanTT\ 8
"set guifont=Neep\ 10
set guifont=Bitstream\ Vera\ Sans\ Mono\ 10.
"set lines=999 columns=999
autocmd FileType make setlocal noexpandtab
"au GUIEnter * simalt ~x

" for normal keys // comment this for original vim keys
"source $VIMRUNTIME/mswin.vim
"behave mswin
"set textwidth=80
"set ColorColumn=+1
"hi ColorColumn guibg=#2d2d2d ctermbg=246
"set wrapmargin=2
":/\%>80v./+
au BufRead,BufNewFile *.md setlocal textwidth=80
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"hi IndentGuidesOdd  ctermbg=white
"hi IndentGuidesEven ctermbg=lightgrey
hi CursorLine guibg=lightblue
"hi CursorLine guifg=black guibg=gray
"
"
"
"map <silent> <Leader>L :IndentLinesToggle<CR>
"let g:indentLine_enabled = 1
"let g:indentLine_char = '?'
"let g:indentLine_color_term = 239
"let g:indentLine_color_gui = '#A4E57E'
"let g:indentLine_char = '|'

"set ts=2 sw=2 et
"let g:indent_guides_auto_colors = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=lightcyan   ctermbg=2
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray ctermbg=2
"
"
"let g:indent_guides_start_level=2
"let g:indent_guides_start_size=1
map <F7> mzgg=G`z
map <F2> :mksession! ~/.vim_session <cr> " Quick write session with F2
map <F3> :source ~/.vim_session <cr>     " And load session with F3

set incsearch		" do incremental searching
"set clipboard+=unnamed

"""""""" for fast search or search on the go
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

""" to change/indicate the cursor in insert/command mode
autocmd InsertEnter,InsertLeave * set cul!
"other options
":autocmd InsertEnter * set cul
":autocmd InsertLeave * set nocul

"vim cursor highlight
hi CursorLine   cterm=NONE ctermbg=lightgrey ctermfg=black


"""""" Below option only for gvim 

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp) 
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction                                                          

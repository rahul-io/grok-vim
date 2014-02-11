scriptencoding utf-8
set encoding=utf-8
execute pathogen#infect()

syntax on
filetype plugin indent on
set vb
set mousehide
set laststatus=2

set number
set nowrap
let mapleader = ","
set nobackup
set nowritebackup
set noswapfile
set foldenable

set foldcolumn=0
set scrolloff=8
set wrapscan

set hidden

set autoindent
set cindent
set smartindent

set shiftwidth=4
set tabstop=4
set expandtab

set clipboard=unnamed

set showcmd
set showmatch
set nostartofline

set background=dark
colorscheme base16-tomorrow

imap jj <esc>
ino jj <esc>
cno jj <c-c>
vno v <esc>
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

nnoremap <silent> ,T :TagbarToggle<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*,*/built/*,*.class,*/target/*,*/out/*,*/components/*,*/public/*
" neocomplete
" Next generation completion framework.


let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

" Default # of completions is 100, that's crazy.
let g:neocomplete#max_list = 5
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete


let g:syntastic_enable_highlighting = 0
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:sneak#streak = 1
let g:tagbar_ctags_bin = "/opt/boxen/homebrew/bin/ctags"

au BufNewFile,BufRead *.plb set filetype=plsql
au BufNewFile,BufRead *.pls set filetype=plsql

let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? "\ue0a2": ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? "\ue0a0 "._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

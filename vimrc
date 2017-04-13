if filereadable(expand('~/src/vim/bundle/vim-pathogen/autoload/pathogen.vim'))
  source ~/src/vim/bundle/vim-pathogen/autoload/pathogen.vim
endif
if has("win32")
  let &runtimepath = substitute(&runtimepath,'\(Documents and Settings\|Users\)[\\/][^\\/,]*[\\/]\zsvimfiles\>','.vim','g')
endif
silent! execute pathogen#infect("~/.vim/vendor/{}")
silent! execute pathogen#infect("~/.vim/bundle/{}")
let g:used_javascript_libs = 'angularjs,underscore'
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:airline#extensions#tabline#enabled = 1
let g:solarized_termcolors=256
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
syntax on
filetype plugin indent on
set nocompatible 
set t_Co=256
" Get rid of visual bells/flashes
set novb
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

"make gvim look like vim in a terminal
set guioptions+=c
set guioptions+=R
set guioptions-=m
set guioptions-=r
set guioptions-=b
set guioptions-=T
set guioptions-=R
set guioptions-=L
set guioptions-=e

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

" highlight search results
set hlsearch

let base16colorspace=256
set background=dark
colorscheme solarized

" Window splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map - <C-W>-
map + <C-W>+
map <S-Tab> :bn<CR>

imap jj <esc>
ino jj <esc>
cno jj <c-c>
vno v <esc>
" nnoremap <silent> ,z :bp<CR>
" nnoremap <silent> ,x :bn<CR>

" Autoformat key
noremap <F3> :Autoformat<CR><CR>
set clipboard+=unnamed

"Ignoring things, primarily for the sake of ctrl P, might not be valid for your use case
set wildignore+=*.iml,*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*,*/built/*,*.class,*/target/*,*/out/*,*/components/*,*/public/*,*/releases/*,*/dist/*,*/www-build/*

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Set minimum syntax keyword length.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd! BufNewFile,BufRead *.raml set filetype=yaml


let g:syntastic_enable_highlighting = 0
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

"defined custom extensions for plsql we use at work
au BufNewFile,BufRead *.plb set filetype=plsql.plsqlvorax
au BufNewFile,BufRead *.pls set filetype=plsql.sqlvorax

execute pathogen#infect()
call pathogen#helptags()
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

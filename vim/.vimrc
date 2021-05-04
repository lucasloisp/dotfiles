set nocompatible
set backspace=2
filetype off
set relativenumber
set number
set rnu
set nu
set cc=80
set cursorline
syntax on
filetype plugin indent on
set encoding=utf-8

set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'

" Misc
Plug 'SirVer/ultisnips'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'dag/vim-fish'

" Text Modes
Plug 'tpope/vim-speeddating'
Plug 'vim-scripts/utl.vim'
Plug 'lervag/vimtex'
Plug 'junegunn/vim-easy-align'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
Plug 'mzlogin/vim-markdown-toc'
Plug 'ferrine/md-img-paste.vim'

" Styling
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Javascript
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', {
  \ 'for': ['javascript'] }

" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'sdiehl/vim-ormolu'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Kotlin
Plug 'udalov/kotlin-vim'

" Project
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

" Podfile
au BufRead,BufNewFile Podfile set filetype=ruby

" Fastfile
au BufRead,BufNewFile Fastfile set filetype=ruby

" Ledger
Plug 'ledger/vim-ledger'

" Linting
Plug 'dense-analysis/ale'

call plug#end()

" Misc
let mapleader=" "
imap jj <Esc>

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Ledger
au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger
autocmd FileType ledger setlocal foldmethod=syntax

" Text
autocmd BufRead,BufNewFile *.tex setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell
au FileType markdown vmap <leader>mf :EasyAlign*<Bar><Enter>
au FileType markdown setl conceallevel=2
au FileType tex setl conceallevel=0
let g:tex_conceal='mg'
au FileType tex setl wrap linebreak nolist
set spelllang=es,en
set complete+=kspell
""" Autocorrect spelling of the last word
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1
autocmd FileType markdown nmap <buffer><silent> <leader>mp :call mdip#MarkdownClipboardImage()<CR>

" Zettel
let g:zettelkasten = "~/Documents/zettel/"
command! -nargs=0 NewZettel :execute ":e" zettelkasten . sha256(strftime("%Y%m%d%H%M")) . ".md"
nnoremap <leader>nz :NewZettel<CR>

" Styling
let base16colorspace = 256
colorscheme base16-material
set termguicolors

" Project
noremap <leader>; :Buffers<CR>
noremap <leader>f :GFiles<CR>

" Javascript configuration
let g:prettier#autoformat = 0
autocmd BufWritePre *.js PrettierAsync
let g:ale_linters = {
  \ 'javascript': ['eslint']
  \ }
let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \ }

" Haskell
let g:haskell_indent_disable = 1
autocmd BufWritePost *.hs :call RunOrmolu()

" Coc Language Server
nmap <leader>lf :call CocAction('format')<CR>

" Silver Searcher configuration
let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <leader>a :Ack!<Space>

" Fish
au FileType fish compiler fish
au FileType fish setlocal textwidth=79
au FileType fish setlocal foldmethod=expr

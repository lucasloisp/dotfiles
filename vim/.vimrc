set nocompatible
set backspace=2
filetype off
set relativenumber
set number
set cc=80
set cursorline
syntax on
filetype plugin indent on
set encoding=utf-8

set rtp+=~/.vim/bundle/Vundle.vim

let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'

" Misc
Plug 'SirVer/ultisnips'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'dag/vim-fish'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Text Modes
Plug 'tpope/vim-speeddating'
Plug 'vim-scripts/utl.vim'
Plug 'lervag/vimtex'
Plug 'junegunn/vim-easy-align'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
Plug 'mzlogin/vim-markdown-toc'
Plug 'ferrine/md-img-paste.vim'

" Styling
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'

" Javascript
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

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
inoremap jj <Esc>

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Ledger
au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger
au FileType ledger setlocal foldmethod=syntax
let g:ledger_maxwidth = 80
let g:ledger_align_at = 50
let g:ledger_fold_blanks = 0

" Text
au BufRead,BufNewFile *.tex setlocal spell
au BufRead,BufNewFile *.md setlocal spell
au BufWinEnter * normal zR
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
au FileType markdown nmap <buffer><silent> <leader>mp :call mdip#MarkdownClipboardImage()<CR>

" Styling
colorscheme nord
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
highlight Comment ctermfg=3

" Project
noremap <leader>; :Buffers<CR>
noremap <leader>f :GFiles<CR>

" Javascript configuration
let g:coc_global_extensions = ['coc-tsserver']
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint']
  \ }
let g:ale_fixers = {
  \ 'javascript': ['prettier'],
  \ 'typescript': ['prettier']
  \ }
let g:ale_fix_on_save = 1

" Haskell
let g:haskell_indent_disable = 1
au BufWritePost *.hs :call RunOrmolu()

" Coc Language Server
nmap <leader>lf :call CocAction('format')<CR>

" Silver Searcher configuration
let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <leader>a :Ack!<Space>

" Fish
au FileType fish compiler fish
au FileType fish setlocal textwidth=79
au FileType fish setlocal foldmethod=expr

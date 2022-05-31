syntax on

let mapleader = "\<Space>"
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>[ gT
nnoremap <leader>] gt
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>p "0p
nnoremap <leader>6 <C-^>
nnoremap <leader>c "*y
nnoremap <leader>v :vertical resize 84<CR>
nmap <leader>t :TagbarToggle<CR>

" go specfic bindings
autocmd BufEnter *.go nmap <leader>cc  <Plug>(go-callers)
autocmd BufEnter *.go nmap <leader>i  <Plug>(go-info)
autocmd BufEnter *.go nmap <leader>ii  <Plug>(go-implements)
autocmd BufEnter *.go nmap <leader>ci  <Plug>(go-describe)
nmap <leader>cr <Plug>(coc-references)

" coc
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Override gd for go to use vim-go
autocmd FileType go nmap <silent> gd <Plug>(go-def)

set nocompatible              " be iMproved, required
filetype off                  " required

let g:go_highlight_types = 1
let g:go_highlight_functions = 1

set autowrite
set relativenumber
set number
set hlsearch
set incsearch
set title

set colorcolumn=80

set backspace=indent,eol,start

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'honza/vim-snippets'

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'preservim/nerdtree'

"git"
Plug 'tpope/vim-fugitive'

"snippets"
Plug 'SirVer/ultisnips'

Plug 'ervandew/supertab'

"bazel"
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

"terraform"
Plug 'hashivim/vim-terraform'

Plug 'preservim/tagbar'

"
" FrontEnd
"

"css preview colors
Plug 'ap/vim-css-color'

" JS syntax highlight
Plug 'pangloss/vim-javascript'

" TS syntax highlight
Plug 'leafgarland/typescript-vim'

" JSX and TSX highlight and indenting
Plug 'MaxMEllon/vim-jsx-pretty'

call plug#end()


" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

set splitbelow


colo gruvbox

" CoC extensions
" coc-jedi -> python
let g:coc_global_extensions = ['coc-tsserver', 'coc-go', 'coc-jedi', 'coc-pyright']

syntax on

" -------------------------------
"  Default setting
"
"  for more info on what the setting does:
"  :h <setting_name> 

set relativenumber
set number
set title 
set colorcolumn=80

colorscheme gruvbox

" Not imported over from vimrc
"
" set nocompatible              " be iMproved, required // not sure what for
" filetype off                  " required // not sure what for yet
" set splitbelow      // not sure but it seems to be on by default
"
" for neovim defaults see: http://neovim.io/doc/user/vim_diff.html
" Already set by neovim by default:
" set backspace=indent,eol,start
" set hlsearch         
" set incsearch       

" -------------------------------
" LEADER KEY SHORTCUTS

" leader key
let mapleader = "\<Space>"

nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>[ gT
nnoremap <leader>] gt
nnoremap <leader>p "0p
nnoremap <leader>6 <C-^>
nnoremap <leader>c "*yy
nnoremap <leader>v :vertical resize 84<CR>

" cycling to different windows
nnoremap <leader>w <C-w><C-w>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" vim-powered terminal in split window
map <Leader>t :term ++close<cr>
" tmap <Leader>t <c-w>:term ++close<cr>
" vim-powered terminal in new tab
map <Leader>T :tab term ++close<cr>
" tmap <Leader>T <c-w>:tab term ++close<cr>
" ++close means they'll automatically exit when the terminal exits, 
" so just type exit or ctrl-D.
" ctrl+w+w -> swtich between windows which can be used to swtich between term
" and normal vim window when there are only two windows.

" -------------------------------
" Plugins

call plug#begin('~/.vim/plugged')

" gruvbox colore theme
Plug 'morhetz/gruvbox'

" file search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" coc language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vim snippets TODO: check what this is for and if both needed
" Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" TODO: check what this is for
" Plug 'ervandew/supertab'

" nerdtree directory navigator
Plug 'preservim/nerdtree'


" go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'sebdah/vim-delve' " debugger

"git
Plug 'tpope/vim-fugitive'

" TODO: check what this is for
" Plug 'preservim/tagbar'

"terraform: probably not needed 
" Plug 'hashivim/vim-terraform'

" FRONTEND"

" html boilerplate auto fill
Plug 'mattn/emmet-vim'

"css preview colors
Plug 'ap/vim-css-color'

" JS syntax highlight
" TODO: check if needed
" Plug 'pangloss/vim-javascript'
" TS syntax highlight
" Plug 'leafgarland/typescript-vim'
" JSX and TSX highlight and indenting
" Plug 'MaxMEllon/vim-jsx-pretty'

call plug#end()


" -------------------------------
"  EMMET 
"  for html boilerplate autofill

let g:user_emmet_leader_key=',' " ','+',' to use emmet


" -------------------------------
"  GO
"

autocmd BufEnter *.go nmap <leader>cc  <Plug>(go-callers)
autocmd BufEnter *.go nmap <leader>i  <Plug>(go-info)
autocmd BufEnter *.go nmap <leader>ii  <Plug>(go-implements)
autocmd BufEnter *.go nmap <leader>ci  <Plug>(go-describe)
nmap <leader>cr <Plug>(coc-references)

"Override gd for go to use vim-go
autocmd FileType go nmap <silent> gd <Plug>(go-def)

" vim-go highlighting
let g:go_highlight_types = 1
let g:go_highlight_functions = 1


" -------------------------------
" COC

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" CoC extensions
" coc-jedi is for python
let g:coc_global_extensions = ['coc-tsserver', 'coc-go', 'coc-jedi', 'coc-pyright', 'coc-css', 'coc-html']


" -------------------------------
"  UltiSnips
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

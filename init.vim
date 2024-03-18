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
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets' " the snippets 
" Plug 'natebosch/dartlang-snippets'
" snipmate (alternative to ultisnips)
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'

" vscode snippet
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'Neevash/awesome-flutter-snippets'
Plug 'Alexisvt/flutter-snippets'
Plug 'golang/vscode-go'
Plug 'cstrap/python-snippets'


" fix indentation
" This resolves the issue with double indentation when pressing enter inside
" of the brackets.
Plug 'Vimjas/vim-python-pep8-indent'


" TODO: check what this is for
" Plug 'ervandew/supertab'

" nerdtree directory navigator
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
"Plug 'sebdah/vim-delve' " debugger is part of vim-go already

"git
Plug 'tpope/vim-fugitive'

" Tag bar for code navigation
" :TagbarOpen
" :TagbarClose
Plug 'preservim/tagbar'

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

" Github Copilot
" Plug 'github/copilot.vim'


" Flutter 
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'


" Brackets
Plug 'jiangmiao/auto-pairs'

call plug#end()

colorscheme gruvbox


" -------------------------------
"  EMMET 
"  for html boilerplate autofill
" let g:user_emmet_leader_key=',' " ','+',' to use emmet


" -------------------------------
"  GO
"

" some redundant with coc calls
" go-callers = coc-references
" go-implements = coc-implementation
autocmd BufEnter *.go nmap <leader>cc  <Plug>(go-callers)
autocmd BufEnter *.go nmap <leader>i  <Plug>(go-info)
autocmd BufEnter *.go nmap <leader>ii  <Plug>(go-implements)
autocmd BufEnter *.go nmap <leader>ci  <Plug>(go-describe)

"Override gd for go to use vim-go
" not sure if neccessary or useful, coc seems to work just as well
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

" -------------------------------
"  COC
" CoC extensions
" coc-jedi is for python
let g:coc_global_extensions = ['coc-tsserver', 'coc-go', 'coc-jedi', 'coc-pyright', 'coc-css', 'coc-html', 'coc-flutter']
" apply codeAction to the selected region.
" This brings up command like 'Extract Widget' 'Wrap with ...' etc.
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" make enter apply coc automcomplete
" inoremap <silent><expr> <CR> coc#pum#visible() ? (IsInsideBrackets() ?  coc#pum#confirm() . "\<ESC>dd" : coc#pum#confirm()) : "\<CR>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" disable autopairs mapping of CR which leads to conflict when autocomplete
" happens inside of the brackets.
" Unfortunately this means losing the autoindent when pressing enter inside
" of the brackets.
" If you do not turn this off then you have to deal with duplication of
" autocomplete if it is within a bracket.
" let g:AutoPairsMapCR = 0


" -------------------------------
"  UltiSnips
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories=["/Users/chrissreesangkom/.vim/plugged/vim-snippets/UltiSnips"]


" ------------
"  SnipMate
"
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
" Setting to include dart-flutter in dart scope, defined by vim-snippets
" in .vim/pluged/vim-snippets/snippets
let g:snipMate.scope_aliases['dart'] = 'dart,dart-flutter'

" ---------
"  vs code snip
imap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand)'         : '<C-j>'
imap <expr> <TAB>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<TAB>'
smap <expr> <TAB>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<TAB>'

" -------------------------------
"  Copilot
"  https://copilot.github.com/
"imap <C-]> <Plug>(copilot-next)
"imap <C-[> <Plug>(copilot-prev)


" -------------------------------
"  Dart Settings
" Check if the autocmd group 'DartSettings' exists
if exists("#DartSettings")
  " Clear the 'DartSettings' autocmd group
  autocmd! DartSettings
endif
" Create a new autocmd group named 'DartSettings'
augroup DartSettings
  autocmd!

  " When you open a Dart file, set specific settings
  autocmd FileType dart setlocal shiftwidth=2
  autocmd FileType dart setlocal expandtab
  autocmd FileType dart setlocal tabstop=2
augroup END

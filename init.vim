syntax on

" -------------------------------
"  Default setting
"
"  for more info on what the setting does:
"  :h <setting_name> 
set relativenumber
set number
set title 
set expandtab
set shiftwidth=4
set tabstop=4
" set colorcolumn=80 " mark column for line length limit


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
nnoremap <leader>c "*
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

call plug#begin()
"lsp and autocomplete, Lua native
Plug 'neovim/nvim-lspconfig'
"nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" For vsnip users. from nvim-cmp page
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" Mason for installing lsp and debugging tools with a friendly interface
Plug 'mason-org/mason.nvim'
Plug 'mason-org/mason-lspconfig.nvim'

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

" gruvbox colore theme
Plug 'morhetz/gruvbox'

" file search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" coc language server
"" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vim snippets TODO: check what this is for and if both needed
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets' " the snippets 
" Plug 'natebosch/dartlang-snippets'
" snipmate (alternative to ultisnips)
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'

" vscode snippet
" Plug 'hrsh7th/vim-vsnip'
" Plug 'hrsh7th/vim-vsnip-integ'
" Plug 'golang/vscode-go'
" Plug 'cstrap/python-snippets'


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

" brackets and quotes
Plug 'tpope/vim-surround'

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


" Brackets
Plug 'jiangmiao/auto-pairs'


" Debugger
" Plug 'puremourning/vimspector'

" Tcomment
Plug 'tomtom/tcomment_vim'

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
"" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
"" nmap <leader>qf  <Plug>(coc-fix-current)
" GoTo code navigation.
"" nmap <silent> gd <Plug>(coc-definition)
"" nmap <silent> gy <Plug>(coc-type-definition)
"" nmap <silent> gi <Plug>(coc-implementation)
"" nmap <silent> gr <Plug>(coc-references)

" -------------------------------
"  COC
" CoC extensions
" coc-jedi is for python
" coc-cland is for c
"" let g:coc_global_extensions = ['coc-tsserver', 'coc-go', 'coc-jedi', 'coc-pyright', 'coc-css', 'coc-html', 'coc-clangd', 'coc-rust-analyzer']
" apply codeAction to the selected region.
" This brings up command like 'Extract Widget' 'Wrap with ...' etc.
"" xmap <leader>a <Plug>(coc-codeaction-selected)
"" nmap <leader>a <Plug>(coc-codeaction-selected)

" make enter apply coc automcomplete
" inoremap <silent><expr> <CR> coc#pum#visible() ? (IsInsideBrackets() ?  coc#pum#confirm() . "\<ESC>dd" : coc#pum#confirm()) : "\<CR>"
"" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
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
"  Typescript Settings
" Check if the autocmd group 'TypescriptSettings' exists
if exists("#TypescriptSettings")
  " Clear the 'DartSettings' autocmd group
  autocmd! TypescriptSettings
endif

augroup TypescriptSettings
  autocmd!

  autocmd FileType typescript,javascript setlocal shiftwidth=2
  autocmd FileType typescript,javascript setlocal expandtab
  autocmd FileType typescript,javascript setlocal tabstop=2
augroup END

augroup CLangSettings
  autocmd!

  autocmd FileType c,cpp setlocal shiftwidth=4
  autocmd FileType c,cpp setlocal expandtab
  autocmd FileType c,cpp setlocal tabstop=4
augroup END

" Set tab settings for HTML files
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType css setlocal tabstop=2 shiftwidth=2 expandtab

" Tofu
" run tofu fmt everytime you save a file
autocmd BufWritePost *.tf :silent !tofu fmt %
autocmd BufWritePost *.tfvars :silent !tofu fmt %

" NERDTree
let NERDTreeShowHidden=1 " show hidden file
au VimEnter *  NERDTree " open NERDTree by default

lua << EOF
vim.diagnostic.config({
  underline = false,
  virtual_text = true,
  signs = true,
  update_in_insert = false,
})
EOF


" nvim-cmp recommended setup
lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

        -- For `mini.snippets` users:
        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
        -- insert({ body = args.body }) -- Insert at cursor
        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
        -- require("cmp.config").set_onetime({ sources = {} })
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    capabilities = capabilities
  }
EOF

" Mason setup
lua << EOF
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "ts_ls", "lua_ls", "gopls" }, -- replace with servers you want
  automatic_installation = true,
})
EOF


"""
" lspconfig key binding for code navigation

"Go to definition
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>

" Go to declaration (e.g., variable declaration)
nnoremap gD <cmd>lua vim.lsp.buf.declaration()<CR>

" Find references
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>

" Hover docs
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>

" Signature help (e.g., when inside function call)
nnoremap <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

" Rename symbol
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

" Format buffer
nnoremap <leader>f <cmd>lua vim.lsp.buf.format({ async = true })<CR>

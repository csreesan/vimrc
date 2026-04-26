-- ─────────────────────────────────────────────
--  CORE OPTIONS
-- ─────────────────────────────────────────────
vim.opt.number         = true
vim.opt.title          = true
vim.opt.expandtab      = true
vim.opt.shiftwidth     = 4
vim.opt.tabstop        = 4
vim.opt.colorcolumn    = "80"
vim.opt.termguicolors  = true
vim.opt.signcolumn     = "yes"   -- prevent layout shift on LSP signs
vim.opt.updatetime     = 250     -- faster LSP hover / CursorHold
-- vim.opt.clipboard      = "unnamedplus"  -- use system clipboard by default

-- ─────────────────────────────────────────────
--  LEADER KEY
-- ─────────────────────────────────────────────
vim.g.mapleader = " "

-- ─────────────────────────────────────────────
--  LAZY.NVIM BOOTSTRAP
-- ─────────────────────────────────────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ─────────────────────────────────────────────
--  PLUGINS
-- ─────────────────────────────────────────────
require("lazy").setup({

  -- Theme
  { "morhetz/gruvbox", priority = 1000, config = function()
      vim.cmd.colorscheme("gruvbox")
  end },

  -- File search / navigation
  { "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
  },

  -- File tree (lazy on keymap)
  { "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = { { "<leader>n", "<cmd>NvimTreeToggle<CR>" } },
    config = function()
      require("nvim-tree").setup({
        filters = { dotfiles = false },
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          local opts = function(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end
          -- load defaults first
          api.config.mappings.default_on_attach(bufnr)
          -- then add/override
          vim.keymap.set("n", "v", api.node.open.vertical,   opts("Open: Vertical Split"))
          vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))
          vim.keymap.set("n", "t", api.node.open.tab,        opts("Open: New Tab"))
        end,
      })
    end,
  },

  -- LSP
  { "neovim/nvim-lspconfig" },
  { "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = function() require("mason").setup() end,
  },
  { "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "lua_ls", "gopls", "pyright", "clangd" },
        automatic_installation = true,
      })

      -- Auto-attach every installed server with cmp capabilities
      local caps = require("blink.cmp").get_lsp_capabilities()
      for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
        vim.lsp.config(server, { capabilities = caps })
      end
    end,
  },

  -- Completion (blink.cmp — faster drop-in for nvim-cmp)
  { "saghen/blink.cmp",
    version = "*",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
      },
      completion = {
        list = {
          selection = { preselect = true, auto_insert = false },
        },
      },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      signature = { enabled = true },
    },
  },

  -- Go
  { "fatih/vim-go",
    build = ":GoInstallBinaries",
    ft = "go",
  },

  -- Git
  { "tpope/vim-fugitive", cmd = { "Git", "G" } },

  -- Surround / comments
  { "tpope/vim-surround" },
  { "tomtom/tcomment_vim" },

  -- HTML
  { "mattn/emmet-vim", ft = { "html", "css", "jsx", "tsx" } },

  -- CSS color preview
  { "ap/vim-css-color" },

  -- Markdown preview
  { "iamcco/markdown-preview.nvim",
    build = "cd app && npx --yes yarn install",
    ft = "markdown",
  },

  -- Tagbar
  { "preservim/tagbar", cmd = { "TagbarToggle" } },

  -- Python indent fix
  { "Vimjas/vim-python-pep8-indent", ft = "python" },

  -- Tofu / Terraform
  { "hashivim/vim-terraform", ft = { "tf", "tfvars" } },

}, {
  -- lazy.nvim options
  ui = { border = "rounded" },
})

-- ─────────────────────────────────────────────
--  DIAGNOSTICS
-- ─────────────────────────────────────────────
vim.diagnostic.config({
  underline     = true,
  virtual_text  = true,
  signs         = true,
  update_in_insert = false,
})
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#DB635A" })

-- ─────────────────────────────────────────────
--  KEYMAPS
-- ─────────────────────────────────────────────
local map = vim.keymap.set

-- Telescope
map("n", "<leader>f", "<cmd>Telescope find_files<CR>")
map("n", "<leader>b", "<cmd>Telescope buffers<CR>")
map("n", "<leader>r", "<cmd>Telescope live_grep<CR>")

-- Tab navigation
map("n", "<leader>[", "gT")
map("n", "<leader>]", "gt")

-- Paste from yank register (not clobbered by delete)
map("n", "<leader>p", '"0p')

-- Alternate file
map("n", "<leader>6", "<C-^>")

-- Clipboard (system register)
map({ "n", "v" }, "<leader>c", '"+y')
map({ "n", "v" }, "<leader>v", '"+p')

-- Window navigation
map("n", "<leader>w", "<C-w><C-w>")
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")

-- Vertical resize to 84 columns
map("n", "<leader>R", "<cmd>vertical resize 84<CR>")

-- Terminal splits
map("n", "<leader>t", "<cmd>split | terminal<CR>")
map("n", "<leader>T", "<cmd>tabnew | terminal<CR>")

-- LSP
map("n", "gd",         vim.lsp.buf.definition)
map("n", "gD",         vim.lsp.buf.declaration)
map("n", "gr",         vim.lsp.buf.references)
map("n", "fr",         "<cmd>Telescope lsp_references<CR>")
map("n", "K",          vim.lsp.buf.hover)
map("n", "<C-k>",      vim.lsp.buf.signature_help)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>fm", function() vim.lsp.buf.format({ async = true }) end)

-- Go (vim-go)
local go_au = vim.api.nvim_create_augroup("GoKeys", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = go_au, pattern = "go",
  callback = function()
    map("n", "<leader>cc", "<Plug>(go-callers)",  { buffer = true })
    map("n", "<leader>i",  "<Plug>(go-info)",     { buffer = true })
    map("n", "<leader>ii", "<Plug>(go-implements)",{ buffer = true })
    map("n", "<leader>ci", "<Plug>(go-describe)", { buffer = true })
    map("n", "gd",         "<Plug>(go-def)",      { buffer = true, silent = true })
  end,
})
vim.g.go_highlight_types     = 1
vim.g.go_highlight_functions = 1

-- ─────────────────────────────────────────────
--  FILETYPE INDENTATION
-- ─────────────────────────────────────────────
local indent_au = vim.api.nvim_create_augroup("FileTypeIndent", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = indent_au,
  pattern = { "typescript", "javascript", "html", "css" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop    = 2
  end,
})

-- ─────────────────────────────────────────────
--  TOFU FORMAT ON SAVE
-- ─────────────────────────────────────────────
local tofu_au = vim.api.nvim_create_augroup("TofuFmt", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = tofu_au,
  pattern = { "*.tf", "*.tfvars" },
  command = "silent !tofu fmt %",
})


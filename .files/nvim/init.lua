-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("config") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

 require("lazy").setup({
  -- LSP and autocompletion
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", build = ":MasonUpdate" },
  { "williamboman/mason-lspconfig.nvim" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "L3MON4D3/LuaSnip" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  -- Dracula theme
  { "Mofiqul/dracula.nvim" },
})
vim.cmd[[colorscheme dracula]]
-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- LSP Setup for Python
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright" },
})

local lspconfig = require("lspconfig")
lspconfig.pyright.setup({})

-- nvim-cmp (Autocomplete) setup
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
  },
})

-- Keybind to run Python file
vim.keymap.set("n", "<leader>r", ":w<CR>:!python3 %<CR>", { noremap = true, silent = true })


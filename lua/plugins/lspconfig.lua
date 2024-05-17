-- First setup neodev to get proper lsp support in nvim's lua
require("neodev").setup({})

-- Initial lsp package setup
local lspconfig = require("lspconfig")

-- Enable the language servers we want
lspconfig.clangd.setup{}
lspconfig.pyright.setup{}
lspconfig.lua_ls.setup{}
lspconfig.bashls.setup{}

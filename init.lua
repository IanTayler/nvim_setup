-- Aesthetic considerations
vim.opt.termguicolors = true

-- Clipboard that works through ssh
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

-- Other reasonable general settings
vim.opt.signcolumn = "no"

-- Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins

local plugins = {
  { "ibhagwan/fzf-lua", dependencies = { "nvim-tree/nvim-web-devicons", "junegunn/fzf" }},
  { "catppuccin/nvim", name = "catppuccin", lazy=true },
  { "rebelot/kanagawa.nvim", name = "kanagawa", priority=1000, lazy=false },
  { "folke/tokyonight.nvim", name = "tokyonight", lazy=true },

  { "nvim-treesitter/nvim-treesitter", name = "nvim-treesitter", build = ":TSUpdate"},
  { "nvim-treesitter/nvim-treesitter-textobjects", name = "nvim-treesitter-textobjects", dependencies = {"nvim-treesitter/nvim-treesitter"}},

  { "nvim-tree/nvim-tree.lua", name = "nvim-tree"},
  { "neovim/nvim-lspconfig", name = "nvim-lspconfig"},
  { "folke/neodev.nvim", name="neodev", opts = {} },
  { 'numToStr/Comment.nvim', lazy=false };
  { 'tpope/vim-fugitive', name="fugitive", lazy=false };
}


require("lazy").setup(plugins, {})

-- Plugin configurations
require("nvim-tree").setup()
require("plugins/treesitter")

require("plugins/lspconfig")

require("Comment").setup()

-- Load other configuration files

require("default_editor_settings")
require("theme")
require("mappings")

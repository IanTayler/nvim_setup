vim.g.mapleader = " "

-- Swap ; and : - : is more important and ; is more convenient to type
vim.keymap.set({'n', 'v'}, ';', ':')
vim.keymap.set({'n', 'v'}, ':', ';')

-- Launch useful searches with <leader>
vim.keymap.set({'n', 'v'}, '<leader>ff', ':FzfLua files<CR>')
vim.keymap.set({'n', 'v'}, '<leader><leader>', ':FzfLua files<CR>')
vim.keymap.set({'n', 'v'}, '<leader>fb', ':FzfLua buffers<CR>')
vim.keymap.set({'n', 'v'}, '<leader>fw', ':FzfLua live_grep<CR>')

-- Custom movement (also see treesitter plugin config)
vim.keymap.set({'n', 'v'}, '<leader>w', '<c-w>')

-- Lsp stuff
vim.keymap.set({'n', 'v'}, '<leader>ld', vim.lsp.buf.definition, {desc = "go to definition"})
vim.keymap.set({'n', 'v'}, '<leader>lD', vim.lsp.buf.declaration)
vim.keymap.set({'n', 'v'}, '<leader>li', vim.lsp.buf.implementation)
vim.keymap.set({'n', 'v'}, '<leader>ls', vim.lsp.buf.document_symbol)
vim.keymap.set({'n', 'v'}, '<leader>lf', vim.lsp.buf.format)
vim.keymap.set({'n', 'v'}, '<leader>lk', vim.lsp.buf.hover)
vim.keymap.set({'n', 'v'}, '<leader>lr', vim.lsp.buf.rename)
vim.keymap.set({'n', 'v'}, '<leader>lw', vim.lsp.buf.workspace_symbol)


-- Terminal
local terminal_fns = require("terminal_fns")

print(terminal_fns)
vim.keymap.set({'n', 'v'}, '<leader>t', terminal_fns.toggle_terminal)
vim.keymap.set({'n', 'v'}, '<leader>T', terminal_fns.new_terminal)
vim.keymap.set('t', '<esc>', '<c-\\><c-n>')

-- Lazy git
vim.keymap.set({'n', 'v'}, '<leader>g', terminal_fns.lazy_git)

-- Nvim Tree
vim.keymap.set({'n', 'v'}, '<leader>e', ":NvimTreeToggle<CR>")

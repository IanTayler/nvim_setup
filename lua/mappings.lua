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

-- Terminal and other cool side-launches
vim.keymap.set({'n', 'v'}, '<leader>t', '<c-w>s<c-w>j:terminal<CR>a')

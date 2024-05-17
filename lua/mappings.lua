vim.g.mapleader = " "

-- Swap ; and : - : is more important and ; is more convenient to type
vim.keymap.set({ 'n', 'v' }, ';', ':')
vim.keymap.set({ 'n', 'v' }, ':', ';')

-- Minor improvements to normal behaviour
vim.keymap.set('n', '<esc>', ':noh<CR><esc>')

-- Launch useful searches with <leader>
vim.keymap.set({ 'n', 'v' }, '<leader>ff', ':FzfLua files<CR>', { desc = "search files in project" })
vim.keymap.set({ 'n', 'v' }, '<leader><leader>', ':FzfLua files<CR>', { desc = "search files in project" })
vim.keymap.set({ 'n', 'v' }, '<leader>fb', ':FzfLua buffers<CR>', { desc = "search open buffers" })
vim.keymap.set({ 'n', 'v' }, '<leader>fw', ':FzfLua live_grep<CR>', { desc = "search text in project files" })

-- Custom movement (also see treesitter plugin config)
vim.keymap.set({ 'n', 'v' }, '<leader>w', '<c-w>')

-- Lsp-only overrides
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client.server_capabilities.completionProvider then
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    end
    if client.server_capabilities.definitionProvider then
      vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
      vim.keymap.set({ "n", "v" }, "gd", vim.lsp.buf.definition, { desc = "go to definition" })
    end

    if client.server_capabilities.declarationProvider then
      vim.keymap.set({ "n", "v" }, "gD", vim.lsp.buf.declaration, { desc = "go to declaration" })
    end

    if client.server_capabilities.hoverProvider then
      vim.keymap.set({ "n", "v" }, "K", vim.lsp.buf.hover, { desc = "show documentation" })
    end
  end,
})

-- General lsp stuff
vim.keymap.set({ 'n', 'v' }, '<leader>li', vim.lsp.buf.implementation, { desc = "go to implementation(s)" })
vim.keymap.set({ 'n', 'v' }, '<leader>lR', vim.lsp.buf.references, { desc = "show symbol references" })
vim.keymap.set({ 'n', 'v' }, '<leader>ls', vim.lsp.buf.document_symbol, { desc = "show symbols in document" })
vim.keymap.set({ 'n', 'v' }, '<leader>lS', vim.lsp.buf.workspace_symbol, { desc = "show symbols in workspace" })
vim.keymap.set({ 'n', 'v' }, '<leader>lf', vim.lsp.buf.format, { desc = "format buffer" })
vim.keymap.set({ 'n', 'v' }, '<leader>lk', vim.lsp.buf.hover, { desc = "show documentation" })
vim.keymap.set({ 'n', 'v' }, '<leader>lr', vim.lsp.buf.rename, { desc = "rename symbol" })


-- Terminal
local terminal_fns = require("terminal_fns")

print(terminal_fns)
vim.keymap.set({ 'n', 'v' }, '<leader>t', terminal_fns.toggle_terminal, { desc = "toggle terminal" })
vim.keymap.set({ 'n', 'v' }, '<leader>T', terminal_fns.new_terminal, { desc = "new terminal" })
vim.keymap.set('t', '<esc>', '<c-\\><c-n>')

-- Lazy git
vim.keymap.set({ 'n', 'v' }, '<leader>g', terminal_fns.lazy_git, { desc = "open lazygit" })

-- Nvim Tree
vim.keymap.set({ 'n', 'v' }, '<leader>e', ":NvimTreeToggle<CR>")

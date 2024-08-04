local function load_litmus(opts)
  local dir = opts.args

  vim.cmd.set('noequalalways')
  vim.cmd.vs(dir .. '/thread1.py')

  vim.cmd.wincmd('l')
  vim.cmd.e(dir .. '/thread2.py')

  vim.cmd('top split ' .. dir .. '/init.py')
  vim.cmd.wincmd('k')
  vim.cmd.resize(8)
  local width = vim.api.nvim_win_get_width(0)
  vim.cmd('% center' .. ' ' .. width)

  vim.cmd('bot new')
  vim.cmd.wincmd('2j')
  vim.bo.filetype = 'python'
  vim.cmd.resize(8)

  vim.cmd.wincmd('k')
  vim.cmd.wincmd('h')

  vim.diagnostic.disable()
end

return { load_litmus = load_litmus }

local term_prefix = "term://"

function is_term_bufname(name)
  return name:sub(1, #term_prefix) == term_prefix
end


function in_bottom_split(fn)
  vim.cmd("split")
  vim.cmd.wincmd("j")
  fn()
  vim.cmd("startinsert")
end

function close_window()
  win.cmd.wincmd('c')
end

function new_terminal()
  in_bottom_split(vim.cmd.terminal)
end

function toggle_terminal()
  local current_buf = vim.api.nvim_buf_get_name(0)

  if is_term_bufname(current_buf) then
    vim.cmd.wincmd("c")
    return
  end

  for i, buf_hndl in ipairs(vim.api.nvim_list_bufs()) do
    local name = vim.api.nvim_buf_get_name(buf_hndl)

    if is_term_bufname(name) and vim.api.nvim_buf_is_loaded(buf_hndl) then
      local window = vim.fn.bufwinid(buf_hndl)
      if window > 0 then
        vim.api.nvim_set_current_win(window)
        return
      else
        in_bottom_split(function() vim.cmd.buffer(buf_hndl) end)
        return
      end
    end
  end
  new_terminal()
end

function lazy_git()
  vim.cmd.terminal("lazygit")
  vim.cmd("startinsert")
end

-- Do any keystroke to kill the window
vim.cmd("au TermClose * bd")

return {
  new_terminal = new_terminal,
  toggle_terminal = toggle_terminal,
  lazy_git = lazy_git
}
local term_prefix = "term://"

function in_bottom_split(fn)
  vim.cmd("split")
  vim.cmd.wincmd("j")
  fn()
  vim.cmd("startinsert")
end

function new_terminal()
  in_bottom_split(vim.cmd.terminal)
end

function toggle_terminal()
  for i, buf_hndl in ipairs(vim.api.nvim_list_bufs()) do
    local name = vim.api.nvim_buf_get_name(buf_hndl)

    if name:sub(1, #term_prefix) == term_prefix then
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

return {
  new_terminal = new_terminal,
  toggle_terminal = toggle_terminal,
}

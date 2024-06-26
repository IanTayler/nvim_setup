local term_prefix = "term://"

local function is_term_bufname(name)
  return name:sub(1, #term_prefix) == term_prefix
end


local function in_bottom_split(fn)
  vim.cmd("botright new")
  fn()
  vim.cmd("startinsert")
end

local function load_terminal()
  vim.fn.termopen(vim.o.shell, { on_exit = function() vim.cmd.bd() end })
end

local function new_terminal()
  in_bottom_split(load_terminal)
end

local function toggle_terminal()
  local current_buf = vim.api.nvim_buf_get_name(0)

  if is_term_bufname(current_buf) then
    vim.cmd.wincmd("c")
    return
  end

  for _, buf_hndl in ipairs(vim.api.nvim_list_bufs()) do
    local name = vim.api.nvim_buf_get_name(buf_hndl)

    if is_term_bufname(name) and vim.api.nvim_buf_is_loaded(buf_hndl) then
      local window = vim.fn.bufwinid(buf_hndl)
      if window > 0 then
        vim.api.nvim_set_current_win(window)
        vim.cmd("startinsert")
        return
      else
        in_bottom_split(function() vim.cmd.buffer(buf_hndl) end)
        return
      end
    end
  end
  new_terminal()
end

local function delete_and_switch(new_buffer)
  local buffer_to_delete = vim.fn.bufnr()
  vim.cmd.buffer(new_buffer)
  vim.cmd.bdelete(buffer_to_delete)
end
local function lazy_git()
  local previous_buffer = vim.fn.bufnr()

  vim.cmd.enew()
  vim.fn.termopen("lazygit", { on_exit = function() delete_and_switch(previous_buffer) end })

  vim.keymap.set("t", "<esc>", "<esc>", { buffer = true })
  vim.cmd("startinsert")
end

return {
  new_terminal = new_terminal,
  toggle_terminal = toggle_terminal,
  lazy_git = lazy_git
}

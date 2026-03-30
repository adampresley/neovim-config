vim.api.nvim_create_autocmd("BufReadPost", {
   group = augroup,
   desc = "Restore last cursor position",
   callback = function()
      if vim.o.diff then -- except in diff mode
         return
      end

      local last_pos = vim.api.nvim_buf_get_mark(0, '"')
      local last_line = vim.api.nvim_buf_line_count(0)
      local row = last_pos[1]

      if row < 1 or row > last_line then
         return
      end

      pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
   end,
})

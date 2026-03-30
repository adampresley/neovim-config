--
-- Auto format on pre-write
--
vim.api.nvim_create_autocmd("BufWritePre", {
   callback = function()
      vim.cmd('lua vim.lsp.buf.format()')
   end
})

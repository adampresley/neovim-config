--
-- Turn on wordwrap based on file type
--
vim.api.nvim_create_autocmd("FileType", {
   group = augroup,
   pattern = { "markdown", "text", "gitcommit" },
   callback = function()
      vim.opt_local.wrap = true
      vim.opt_local.linebreak = true
      vim.opt_local.spell = true
   end,
})

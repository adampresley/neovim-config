--
-- Turn on wordwrap based on file type
--
local group = vim.api.nvim_create_augroup("WordWrap", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
   group = group,
   pattern = { "markdown", "text", "gitcommit" },
   callback = function()
      vim.opt_local.wrap = true
      vim.opt_local.linebreak = true
      vim.opt_local.spell = true
   end,
})

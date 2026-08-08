vim.opt.grepprg = "rg --vimgrep --smart-case --hidden -g '!.git/' --color=never"
vim.opt.grepformat = "%f:%l:%c:%m"

-- Create a user command for convenient searching
vim.api.nvim_create_user_command('Rg', function(opts)
   -- If arguments are provided, run grep
   if opts.args and #opts.args > 0 then
      -- Use grep! (with !) to prevent auto-jumping to the first result
      vim.cmd("silent grep! " .. vim.fn.shellescape(opts.args))
      -- Open the quickfix list to see all results
      vim.cmd("copen")
   else
      -- If no args, just open the quickfix list if it exists
      vim.cmd("copen")
   end
end, {
   nargs = '*',
   complete = 'file',
   desc = 'Search with Ripgrep'
})

-- Map a key to trigger the search prompt
vim.keymap.set('n', '<leader>g', ':Rg ', { desc = 'Fuzzy grep text' })

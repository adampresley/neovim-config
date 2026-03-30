vim.pack.add({
   { src = "https://github.com/codota/tabnine-nvim" },
})

local ok, tabnine = pcall(require, "tabnine")
if not ok then
   vim.schedule(function()
      vim.notify("tabnine-nvim: plugin not available yet; restart after install if needed", vim.log.levels.WARN)
   end)
   return
end

tabnine.setup({
   disable_auto_comment = true,
   accept_keymap = "<C-]>",
   dismiss_keymap = "<C-[>",
   debounce_ms = 800,
   exclude_filetypes = { "TelescopePrompt", "NvimTree" },
})

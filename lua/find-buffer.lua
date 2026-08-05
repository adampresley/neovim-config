local group = vim.api.nvim_create_augroup("BufferFinder", { clear = true })

vim.api.nvim_create_autocmd("CmdlineChanged", {
	group = group,
	pattern = ":",
	callback = function()
		if vim.fn.getcmdcompltype() == "buffer" then
			vim.fn.wildtrigger()
		end
	end,
})

vim.keymap.set("n", "<leader>fb", ":buffer ", { desc = "Find buffer" })

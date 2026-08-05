local function smartCloseBuffer()
	local current = vim.api.nvim_get_current_buf()

	if vim.bo[current].modified then
		vim.notify("Buffer has unsaved changes", vim.log.levels.WARN)
		return
	end

	local replacement = vim.fn.bufnr("#")

	if
	    replacement == current
	    or not vim.api.nvim_buf_is_valid(replacement)
	    or not vim.bo[replacement].buflisted
	then
		replacement = null

		for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
			if buffer ~= current and vim.bo[buffer].buflisted then
				replacement = buffer
				break
			end
		end
	end

	replacement = replacement or vim.api.nvim_create_buf(true, false)

	for _, window in ipairs(vim.fn.win_findbuf(current)) do
		if vim.api.nvim_win_is_valid(window) then
			vim.api.nvim_win_set_buf(window, replacement)
		end
	end

	vim.api.nvim_buf_delete(current, { force = false })
end

vim.keymap.set("n", "<leader>c", smartCloseBuffer, { desc = "Close buffer" })

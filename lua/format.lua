-- Auto format on pre-write
local group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
	group = group,
	callback = function(args)
		if vim.bo[args.buf].buftype ~= "" then
			return
		end

		local clients = vim.lsp.get_clients({
			bufnr = args.buf,
			method = "textDocument/formatting",
		})
		if #clients == 0 then
			return
		end

		table.sort(clients, function(a, b)
			return a.id < b.id
		end)

		vim.lsp.buf.format({
			bufnr = args.buf,
			id = clients[1].id,
		})
	end,
})

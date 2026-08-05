-- lsp
vim.lsp.enable({ 
       "bashls",
       "c3lsp",
       "clangd",
       "cssls",
       "docker_compose_language_service",
       "gopls",
       "html",
       "jsonls",
       "lua_ls",
       "ols",
       "pyright",
       "svelte",
       "ts_ls",
       "yamlls",
       "zls",
})

vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client ~= nil and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

vim.cmd("set completeopt+=noselect")

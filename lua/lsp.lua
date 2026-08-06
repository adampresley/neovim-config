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

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
   local hl = "DiagnosticSign" .. type
   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
   virtual_text = {
      prefix = "●",
   },
   severity_sort = true,
   float = {
      source = true,
   },
})

vim.api.nvim_create_autocmd("LspAttach", {
   callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      if client ~= nil and client:supports_method("textDocument/completion") then
         vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      end
   end,
})

vim.cmd("set completeopt+=noselect")

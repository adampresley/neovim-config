---@brief
---
--- https://github.com/pherrymason/c3-lsp
---
--- Language server for C3

---@type vim.lsp.Config
return {
   cmd = { 'c3lsp' },
   settings = {},
   filetypes = { 'c3', 'c3i' },
   root_markers = { '.git' },
}

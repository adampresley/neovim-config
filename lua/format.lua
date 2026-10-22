vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

vim.filetype.add({
   extension = {
      ejs = "ejs",
   },
})

require("conform").setup({
   formatters_by_ft = {
      ejs = { "prettier" },
   },
})

-- Auto format on pre-write
local group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
   group = group,
   callback = function(args)
      if vim.bo[args.buf].buftype ~= "" then
         return
      end

      if vim.bo[args.buf].filetype == "ejs" then
         require("conform").format({
            bufnr = args.buf,
            async = false,
            timeout_ms = 3000,
            lsp_format = "never",
         })

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

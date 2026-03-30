vim.lsp
    .enable({
       "bashls",
       "clangd",
       "cssls",
       "docker_compose_language_service",
       "gopls",
       "html",
       "jsonls",
       "lua_ls",
       "pyright",
       "svelte",
       "ts_ls",
       "yamlls",
    })

vim.lsp
    .config('svelte',
       {
          cmd = { "svelteserver", "--stdio" },
          filetypes = { "svelte" },
       })

vim.lsp.config('clangd', {
   cmd = { "clangd", "--background-index",
      "--clang-tidy", "--log=verbose",
      "--fallback-style=webkit" },
   filetypes = { "c", "cpp", "objc", "objcpp", "h" },
})

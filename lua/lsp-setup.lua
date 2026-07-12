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
       "ols",
       "pyright",
       "svelte",
       "ts_ls",
       "yamlls",
       "zls",
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

vim.lsp.config('ols', {
   cmd = { "ols", "--stdio" },
   filetypes = { "odin" },
   root_markers = { ".git", "ols.json" },
})

vim.lsp.config('zls', {
   cmd = { 'zls' },
   filetypes = { 'zig' },
   root_markers = { 'build.zig' },
})

vim.lsp.config('c3lsp', {
   cmd = { 'c3lsp' },
   filetypes = { "c3", "c3i" },
   root_markers = { ".git" },
})

vim.lsp.enable("c3lsp")

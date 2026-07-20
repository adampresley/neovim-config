vim.lsp
    .enable({
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

-- https://github.com/tonis2/lsp
vim.lsp.config('c3lsp', {
   cmd = {
      '/Users/adampresley/code/c3-lsp-2/build/lsp',
      '--stdlib-path',
      '/opt/homebrew/Cellar/c3c/HEAD-9516a39/lib/c3/std',
      '--compiler-path',
      '/opt/homebrew/bin/c3c',
      "--diagnostics-delay",
      "500",
   },
   filetypes = { "c3", "c3i" },
   root_markers = { "project.json" },
})

vim.lsp.enable("c3lsp")

-- vim.lsp.config('c3lsp', {
--    cmd = {
--       'c3lsp',
--       '-c3c-path',
--       '/opt/homebrew/bin/c3c',
--       '-stdlib-path',
--       '/opt/homebrew/Cellar/c3c/HEAD-9516a39/lib/c3/std',
--    },
--    filetypes = { "c3", "c3i" },
--    root_markers = { "project.json", ".git" },
-- })

-- vim.lsp.enable("c3lsp")

-- Experimental c3_ls test config.
-- To try it, comment out the c3lsp config/enable block above, then uncomment this
-- block and restart Neovim. Check :LspInfo and ~/.local/state/nvim/lsp.log.
--
-- vim.lsp.config('c3_ls', {
--    cmd = {
--       '/Users/adampresley/code/c3_ls/build/c3_ls',
--       '--compiler-path',
--       '/opt/homebrew/bin/c3c',
--       '--stdlib-path',
--       '/opt/homebrew/Cellar/c3c/HEAD-9516a39/lib/c3/std',
--       '--log-path',
--       vim.fn.stdpath('state') .. '/c3_ls.log',
--       '--log-level',
--       'DEBUG',
--    },
--    filetypes = { "c3", "c3i" },
--    root_markers = { "project.json", ".git" },
-- })
--
-- vim.lsp.enable("c3_ls")

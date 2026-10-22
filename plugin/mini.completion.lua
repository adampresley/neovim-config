vim.pack.add({
   {
      src = "https://github.com/nvim-mini/mini.completion",
      version = "stable",
   },
})

require("mini.completion").setup()

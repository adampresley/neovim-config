vim.pack.add({ "https://github.com/error311/wayfinder.nvim" })

require("wayfinder").setup({
   layout = {
      width = 0.88,
      height = 0.72,
   },
})

vim.keymap.set("n", "<leader>wf", "<Plug>(WayfinderOpen)", { desc = "Wayfinder" })

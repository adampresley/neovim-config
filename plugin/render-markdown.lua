vim.pack.add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim" })
require("render-markdown").setup({
   bullet = {
      right_pad = 1,
   },
   latex = { enabled = false },
})

vim.pack.add({ "https://github.com/Bishop-Fox/colorblocks.nvim" })
require("colorblocks").setup({
   symbol = "v󱡕",
   virt_text_pos = "eol",
   mode = "fg",
   section = { "S" },
   filetypes = { "lua", "css" },
})

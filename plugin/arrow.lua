vim.pack.add({ "https://github.com/otavioschwanck/arrow.nvim" })
require("arrow").setup({
   show_icons = true,
   leader_key = "<c-;>",
   buffer_leader_key = "M",
   mappings = {
      next_item = "l",
      prev_item = "h",
   },
})

vim.keymap.set("n", "H", require("arrow.persist").previous)
vim.keymap.set("n", "L", require("arrow.persist").next)
vim.keymap.set("n", "<c-s>", require("arrow.persist").toggle)

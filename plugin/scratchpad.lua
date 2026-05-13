vim.pack.add({ "https://github.com/athar-qadri/scratchpad.nvim" })

local scratchpad = require("scratchpad")

scratchpad.setup({
   settings = {
      sync_on_ui_close = true,
      title = "Scratchpad",
   },
   default = {
      root_patterns = { ".git", "package.json", "go.mod", "README.md" },
   },
})

vim.keymap.set(
   "n",
   "<leader>so",
   function()
      require("scratchpad").ui:new_scratchpad()
   end, { desc = "Open Scratchpad" })

vim.keymap.set(
   "v",
   "<leader>sp",
   function()
      require("scratchpad").ui:sync()
   end, { desc = "Push to Scratchpad" })

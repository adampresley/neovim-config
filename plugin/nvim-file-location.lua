vim.pack.add({ "https://github.com/diegoulloao/nvim-file-location" })
local nvim_file_location = require("nvim-file-location")

nvim_file_location.setup({
   keymap = "<leader>L",
   mode = "workdir", -- options: workdir | absolute
   add_line = false,
   add_column = false,
   default_register = "+",
})

vim.keymap.set("n", "<leader>L", function()
   vim.cmd("lua NvimFileLocation.copy_file_location('workdir', false, false)")
   vim.cmd("redraw!")
   vim.notify("File location copied!", vim.log.levels.INFO);
end, { desc = "Copy file path" })

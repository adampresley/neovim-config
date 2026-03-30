vim.pack.add({ "https://github.com/jake-stewart/multicursor.nvim" })

local mc = require("multicursor-nvim")
mc.setup()

-- use MultiCursorCursor and MultiCursorVisual to customize
-- additional cursors appearance
vim.cmd.hi("link", "MultiCursorCursor", "Cursor")
vim.cmd.hi("link", "MultiCursorVisual", "Visual")

vim.keymap.set("n", "<esc>", function()
   if mc.hasCursors() then mc.clearCursors() end
end)

-- add cursors above/below the main cursor
vim.keymap.set("n", "<up>", function() mc.addCursor "k" end)
vim.keymap.set("n", "<down>", function() mc.addCursor "j" end)

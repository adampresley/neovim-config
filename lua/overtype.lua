local M = {}

function M.setup(chars)
   for _, char in ipairs(chars) do
      vim.keymap.set("i", char, function()
         local col = vim.fn.col(".")
         local line = vim.fn.getline(".")
         if line:sub(col, col) == char then
            return "<Right>"
         else
            return char
         end
      end, { expr = true, noremap = true })
   end
end

return M

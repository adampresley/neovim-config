vim.pack.add({ "https://github.com/bluz71/vim-moonfly-colors" })
vim.cmd.colorscheme "moonfly"

local function set_transparent()
   local groups = {
      "Normal",
      "NormalNC",
      "EndOfBuffer",
      "NormalFloat",
      "FloatBorder",
      "SignColumn",
      "StatusLine",
      "StatusLineNC",
      "TabLine",
      "TabLineFill",
      "TabLineSel",
      "ColorColumn",
   }

   for _, g in ipairs(groups) do
      vim.api.nvim_set_hl(0, g, { background = "none" })
   end

   vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
end

set_transparent()

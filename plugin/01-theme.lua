vim.pack.add({ "https://github.com/scottmckendry/cyberdream.nvim" })
require("cyberdream").setup({
   variant = "default",
   transparent = false,
   saturation = 1,
   italic_comments = false,
   hide_fillchars = true,
   borderless_pickers = true,
   terminal_colors = true,
   cache = false,
})

vim.cmd("colorscheme cyberdream")

-- vim.pack.add({ "https://github.com/nyoom-engineering/oxocarbon.nvim" })
-- vim.opt.background = "dark"
-- vim.cmd("colorscheme oxocarbon")

-- vim.pack.add({ "https://github.com/bluz71/vim-moonfly-colors" })
-- vim.cmd.colorscheme "moonfly"
--
-- local function set_transparent()
--    local groups = {
--       "Normal",
--       "NormalNC",
--       "EndOfBuffer",
--       "NormalFloat",
--       "FloatBorder",
--       "SignColumn",
--       "StatusLine",
--       "StatusLineNC",
--       "TabLine",
--       "TabLineFill",
--       "TabLineSel",
--       "ColorColumn",
--    }
--
--    for _, g in ipairs(groups) do
--       vim.api.nvim_set_hl(0, g, { background = "none" })
--    end
--
--    vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
-- end
--
-- set_transparent()

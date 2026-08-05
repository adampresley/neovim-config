vim.pack.add({ "https://github.com/scottmcendry/cyberdream.nvim" })

require("cyberdream").setup({
	variant = "default",
	transparent = false,
	saturation = 1,
	italic_comments = false,
	hide_fillchars = true,
	borderless_pickers = false,
	terminal_colors = true,
	cache = false,
})

vim.cmd("colorscheme cyberdream")

vim.api.nvim_set_hl(0, "PmenuBorder", {
  link = "FloatBorder",
})

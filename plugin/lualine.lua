vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })
require("lualine").setup({
   sections = {
      lualine_a = {
         "mode",
         function()
            local arrow = require("arrow.statusline")

            if arrow.is_on_arrow_file() then
               return require("arrow.statusline").text_for_statusline_with_icons()
            end

            return ""
         end,
      },
      lualine_b = {
         {
            "filename",
            file_status = true,
            path = 2,
         },
      },
      lualine_c = { "branch", "diff", "diagnostics" },
   },
})

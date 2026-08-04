vim.pack.add({
   "https://github.com/luukvbaal/statuscol.nvim",
   "https://github.com/chentoast/marks.nvim",
})

require("marks").setup({
   signs = true,
})

local function lnum_both(args)
   return string.format("%3d %2d", args.lnum, args.relnum)
end

require("statuscol").setup({
   setopt = true,
   segments = {
      {
         sign = {
            namespace = { "gitsigns.*" },
            name = { "gitsigns.*" },
         },
      },
      {
         sign = {
            name = { "Marks_.*" },
            maxwidth = 1,
            colwidth = 1,
            auto = true,
         },
      },
      {
         sign = {
            namespace = { ".*" },
            name = { ".*" },
            auto = true,
         },
      },
      {
         text = { lnum_both, " " },
         condition = { true, true },
         click = "v:lua.ScLa",
      },
   },
})

local function ts_disable(_, bufnr)
   return vim.api.nvim_buf_line_count(bufnr) > 10000
end

vim.pack.add({
   "https://github.com/nvim-treesitter/nvim-treesitter",
})

local nts = require("nvim-treesitter")
nts.setup({
   install_dir = vim.fn.stdpath("data") .. "/site",
   highlight = {
      enable = true,
      disable = function(_, bufnr)
         return ts_disable(_, bufnr)
      end,
   },
   indent = { enable = true },
})

local parsers = {
   "bash",
   "css",
   "dockerfile",
   "gitignore",
   "go",
   "gotmpl",
   "graphql",
   "html",
   "javascript",
   "jq",
   "jsdoc",
   "json",
   "lua",
   "make",
   "php",
   "proto",
   "python",
   "regex",
   "sql",
   "ssh_config",
   "typescript",
   "vim",
   "xml",
   "yaml",
}

nts.install(parsers):wait(300000)

vim.api.nvim_create_autocmd("FileType", {
   callback = function(args)
      if pcall(vim.treesitter.start, args.buf) then
         vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
   end
})

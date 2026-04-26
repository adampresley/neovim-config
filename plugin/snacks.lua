vim.pack.add({ "https://github.com/folke/snacks.nvim" })
local Snacks = require("snacks")

Snacks.setup({
   animate = { enabled = true },
   bigfile = { enabled = true },
   dashboard = { enabled = false },
   dim = { enabled = true },
   explorer = { enabled = true, replace_netrw = true },
   image = { enabled = true },
   indent = { enabled = true },
   input = { enabled = true },
   layout = { enabled = true },
   notifier = { enabled = true },
   quickfile = { enabled = true },
   scope = { enabled = true },
   scratch = { enabled = true },
   scroll = { enabled = true },
   statuscolumn = { enabled = false },
   terminal = { enabled = true },
   toggle = { enabled = true },
   words = { enabled = false },
   zen = { enabled = true },

   picker = {
      sources = {
         files = {
            hidden = true,
            ignored = true,
            win = {
               input = {
                  keys = {
                     ["<S-h>"] = "toggle_hidden",
                     ["<S-i>"] = "toggle_ignored",
                     ["<S-f>"] = "toggle_follow",
                     ["<C-y>"] = { "yazi_copy_relative_path", mode = { "n", "i" } },
                  },
               },
            },
            exclude = {
               "**/.git/*",
               "**/node_modules/*",
               "**/.yarn/cache/*",
               "**/.yarn/install*",
               "**/.yarn/releases/*",
               "**/.pnpm-store/*",
               "**/.idea/*",
               "**/.DS_Store",
               "build/*",
               "coverage/*",
               "dist/*",
               "hodor-types/*",
               "**/target/*",
               "**/public/*",
               "**/digest*.txt",
               "**/.node-gyp/**",
            },
         },
         grep = {
            hidden = true,
            ignored = true,
            win = {
               input = {
                  keys = {
                     ["<S-h>"] = "toggle_hidden",
                     ["<S-i>"] = "toggle_ignored",
                     ["<S-f>"] = "toggle_follow",
                  },
               },
            },
            exclude = {
               "**/.git/*",
               "**/node_modules/*",
               "**/.yarn/cache/*",
               "**/.yarn/install*",
               "**/.yarn/releases/*",
               "**/.pnpm-store/*",
               "**/.venv/*",
               "**/.idea/*",
               "**/.DS_Store",
               "**/yarn.lock",
               "build*/*",
               "coverage/*",
               "dist/*",
               "certificates/*",
               "hodor-types/*",
               "**/target/*",
               "**/public/*",
               "**/digest*.txt",
               "**/.node-gyp/**",
            },
         },
         grep_buffers = {},
         explorer = {
            hidden = false,
            ignored = true,
            supports_live = true,
            auto_close = false,
            diagnostics = true,
            diagnostics_open = false,
            focus = "list",
            follow_file = true,
            git_status = true,
            git_status_open = false,
            git_untracked = true,
            jump = { close = false },
            tree = true,
            watch = true,
            exclude = {
               ".git",
               ".pnpm-store",
               ".venv",
               ".DS_Store",
               "**/.node-gyp/**",
            },
         },
      },
   },
})

local keymaps = {
   -- Explorer and pickers
   { "<leader>e",  function() Snacks.explorer() end,                                           desc = "File Explorer" },
   { "<leader>ff", function() Snacks.picker.smart() end,                                       desc = "Smart Find Files" },
   { "<leader>fb", function() Snacks.picker.buffers() end,                                     desc = "Buffers" },
   { "<leader>fw", function() Snacks.picker.grep() end,                                        desc = "Grep" },
   -- git
   { "<leader>Gb", function() Snacks.picker.git_branches() end,                                desc = "Git Branches" },
   { "<leader>Gl", function() Snacks.picker.git_log() end,                                     desc = "Git Log" },
   { "<leader>Gs", function() Snacks.picker.git_status() end,                                  desc = "Git Status" },
   { "<leader>GS", function() Snacks.picker.git_stash() end,                                   desc = "Git Stash" },
   { "<leader>Gd", function() Snacks.picker.git_diff() end,                                    desc = "Git Diff (Hunks)" },
   { "<leader>Gf", function() Snacks.picker.git_log_file() end,                                desc = "Git Log File" },
   { "<leader>GB", function() Snacks.gitbrowse() end,                                          desc = "Git Browse",               mode = { "n", "v" } },
   { "<leader>dD", function() Snacks.picker.diagnostics() end,                                 desc = "Diagnostics" },
   { "<leader>dd", function() Snacks.picker.diagnostics_buffer() end,                          desc = "Buffer Diagnostics" },
   -- LSP
   { "gd",         function() Snacks.picker.lsp_definitions() end,                             desc = "Goto Definition" },
   { "gD",         function() Snacks.picker.lsp_declarations() end,                            desc = "Goto Declaration" },
   { "gr",         function() Snacks.picker.lsp_references() end,                              desc = "References" },
   { "gi",         function() Snacks.picker.lsp_implementations() end,                         desc = "Goto Implementation" },
   { "gy",         function() Snacks.picker.lsp_type_definitions() end,                        desc = "Goto T[y]pe Definition" },
   { "<leader>fs", function() Snacks.picker.lsp_symbols() end,                                 desc = "LSP Symbols" },
   { "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end,                       desc = "LSP Workspace Symbols" },
   -- Other
   { "<leader>z",  function() Snacks.zen.zoom() end,                                           desc = "Toggle Zoom" },
   { "<leader>n",  function() Snacks.notifier.show_history() end,                              desc = "Notification History" },
   { "<leader>c",  function() Snacks.bufdelete() end,                                          desc = "Delete Buffer" },
   { "<leader>R",  function() Snacks.rename.rename_file() end,                                 desc = "Rename File" },
   { "<leader>lg", function() Snacks.lazygit() end,                                            desc = "Lazygit" },
   { "<leader>un", function() Snacks.notifier.hide() end,                                      desc = "Dismiss All Notifications" },
   -- Terminal
   { "<leader>tb", function() Snacks.terminal.open() end,                                      desc = "New bottom terminal" },
   { "<leader>tr", function() Snacks.terminal.open(nil, { win = { position = "right" } }) end, desc = "New right terminal" },
   { "<leader>tf", function() Snacks.terminal.open(nil, { win = { position = "float" } }) end, desc = "New floating terminal" },
}

for _, map in ipairs(keymaps) do
   local opts = { desc = map.desc }
   if map.silent ~= nil then
      opts.silent = map.silent
   end
   if map.noremap ~= nil then
      opts.noremap = map.noremap
   else
      opts.noremap = true
   end
   if map.expr ~= nil then
      opts.expr = map.expr
   end

   local mode = map.mode or "n"
   vim.keymap.set(mode, map[1], map[2], opts)
end

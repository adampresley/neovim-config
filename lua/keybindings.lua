--
-- Windows
--
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move left one window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move down one window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move up one window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move right one window" })
vim.keymap.set("n", "<leader>q", "<C-w>c", { desc = "Close window" })
vim.keymap.set("n", "|", "<C-w>v", { desc = "Split vertical" })
vim.keymap.set("n", '\\', "<C-w>s", { desc = "Split horizontal" })
vim.keymap.set("n", "<leader>bC", function()
   vim.cmd(":bd!")
   vim.cmd(":redraw!")
   vim.notify("All buffers closed", vim.log.levels.INFO)
end, { desc = "Close all buffers" })

--
-- Clos

--
-- vmap to maintain visual mode after shifting < and >
--
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

--
-- Move lines up and down in visual mode
--
vim.keymap.set("v", "J", ":m'>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m-2<cr>gv=gv")

--
-- Line number toggling
--
vim.keymap.set("n", "<c-n><c-n>", ":set relativenumber!<cr>", { desc = "Toggle relative line numbers" })

--
-- Lsp keybindings
--
vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "LSP actions" })
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename symbol" })
-- vim.keymap.set("n", "<leader>dj", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<leader>dj", "<cmd>lua vim.diagnostic.jump({ count = 1 })<cr>", { desc = "Go to next diagnostic" })
-- vim.keymap.set("n", "<leader>dk", "<cmd>lua vim.diagnostic.goto_prev()<cr>",
vim.keymap.set("n", "<leader>dk", "<cmd>lua vim.diagnostic.jump({ count = -1 })<cr>",
   { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })

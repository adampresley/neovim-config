--
-- Before beginning, unsure you have the following installed:
-- brew install curl, zip, unzip
-- npm i -g bash-language-server vscode-langservers-extracted @microsoft/compose-language-service typescript typescript-language-server yaml-language-server

--
-- Adam's 2026 Neovim set up
--
require("core-settings")

--
-- Filetypes
--
vim.filetype.add({
   filename = {
      ["docker-compose.yml"] = "yaml.docker-compose",
      ["docker-compose.yaml"] = "yaml.docker-compose",
      ["compose.yml"] = "yaml.docker-compose",
      ["compose.yaml"] = "yaml.docker-compose",
      ["ejs"] = "html",
   },
})

vim.o.winborder = 'rounded'

require("restore-last-position")
require("lsp-setup")
require("keybindings")
require("auto-format")
require("wordwrap")
require("overtype").setup({ ")", "]", "}", ">", "'", '"', "`" })

local files_cache = nil

local function load_files()
	if files_cache ~= nil then
		return files_cache
	end

	if vim.fn.executable("rg") == 0 then
		files_cache = {}
		vim.schedule(function()
			vim.notify("File finder requires ripgrep (rg)", vim.log.levels.ERROR)
		end)
		return files_cache
	end

	files_cache = vim.fn.systemlist({ "rg", "--files", "--hidden", "-g", "!.git/", "--color=never" })
	if vim.v.shell_error ~= 0 then
		files_cache = {}
		vim.schedule(function()
			vim.notify("Unable to build the file finder index", vim.log.levels.ERROR)
		end)
	end

	return files_cache
end

_G.RgFindFiles = function(cmdarg, _cmdcomplete)
	local fnames = load_files()
	if #cmdarg > 0 then
		return vim.fn.matchfuzzy(fnames, cmdarg)
	end
	return fnames
end

vim.o.findfunc = "v:lua.RgFindFiles"

local group = vim.api.nvim_create_augroup("FileFinder", { clear = true })

vim.api.nvim_create_autocmd("CmdlineEnter", {
	group = group,
	pattern = ":",
	callback = function()
		files_cache = nil
	end,
})

vim.api.nvim_create_autocmd("CmdlineChanged", {
	group = group,
	pattern = ":",
	callback = function()
		local command = vim.fn.getcmdline():match("^%s*(%S+)")
		if command and vim.fn.fullcommand(command) == "find" then
			vim.fn.wildtrigger()
		end
	end,
})

vim.api.nvim_create_autocmd("DirChanged", {
	group = group,
	callback = function()
		files_cache = nil
	end,
})

vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Fuzzy find file" })

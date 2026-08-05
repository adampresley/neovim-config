local pms = vim.api.nvim_get_hl(0, { name = "PmenuSel", link = false })
local dir = vim.api.nvim_get_hl(0, { name = "Directory", link = false })
local vis = vim.api.nvim_get_hl(0, { name = "Visual", link = false })
vim.api.nvim_set_hl(0, "StlMode", { fg = pms.fg, bg = vis.bg })
vim.api.nvim_set_hl(0, "StlGit", { fg = dir.fg, bg = pms.bg })

local git_branches = {}
local git_requests = {}
local group = vim.api.nvim_create_augroup("Statusline", { clear = true })

local function escape_statusline(value)
	return value:gsub("%%", "%%%%")
end

local modes = {
	n = "NORMAL",
	i = "INSERT",
	v = "VISUAL",
	V = "V-LINE",
	["\22"] = "V-BLOCK",
	c = "COMMAND",
	t = "TERMINAL",
	R = "REPLACE",
	s = "SELECT",
	S = "S-LINE",
	["\19"] = "S-BLOCK",
}

function _G._statusline()
	local mode = modes[vim.fn.mode()] or vim.fn.mode():upper()
	local branch = vim.b.git_branch
	local branch_section = branch and "%#StlGit# " .. escape_statusline(branch) .. " %*" or ""
	local path = vim.b.rel_path and escape_statusline(vim.b.rel_path) or "%f"

	local diag = ""
	local counts = vim.diagnostic.count(0) or {}
	local labels = { " ", " ", " ", " " }
	local hls = { "DiagnosticError", "DiagnosticWarn", "DiagnosticInfo", "DiagnosticHint" }
	for i = 1, 4 do
		if counts[i] and counts[i] > 0 then
			diag = diag .. "%#" .. hls[i] .. "#" .. labels[i] .. counts[i] .. "%* "
		end
	end

	return "%#StlMode# " .. mode .. " %*" .. branch_section .. " " .. path .. "%=" .. diag .. vim.bo.filetype .. " %l:%c"
end

local function apply_git_branch(root)
	local branch = git_branches[root]
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_valid(bufnr) and vim.b[bufnr].git_root == root then
			vim.b[bufnr].git_branch = branch or nil
		end
	end
	vim.cmd("redrawstatus!")
end

local function load_git_branch(root)
	if git_branches[root] ~= nil then
		apply_git_branch(root)
		return
	end
	if git_requests[root] then
		return
	end

	git_requests[root] = true
	vim.system({ "git", "-C", root, "branch", "--show-current" }, { text = true }, function(result)
		local branch = result.code == 0 and vim.trim(result.stdout or "") or ""
		git_branches[root] = branch ~= "" and branch or false
		git_requests[root] = nil
		vim.schedule(function()
			apply_git_branch(root)
		end)
	end)
end

local function update_buffer_context(bufnr)
	local path = vim.api.nvim_buf_get_name(bufnr)
	if path == "" then
		vim.b[bufnr].git_root = nil
		vim.b[bufnr].git_branch = nil
		vim.b[bufnr].rel_path = nil
		return
	end

	local root = vim.fs.root(path, ".git")
	if root and (path == root or vim.startswith(path, root .. "/")) then
		vim.b[bufnr].git_root = root
		vim.b[bufnr].rel_path = path == root and vim.fn.fnamemodify(path, ":t") or path:sub(#root + 2)
		load_git_branch(root)
	else
		vim.b[bufnr].git_root = nil
		vim.b[bufnr].git_branch = nil
		vim.b[bufnr].rel_path = vim.fn.fnamemodify(path, ":~")
	end
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufFilePost", "DirChanged" }, {
	group = group,
	callback = function()
		update_buffer_context(vim.api.nvim_get_current_buf())
	end,
})

vim.api.nvim_create_autocmd("FocusGained", {
	group = group,
	callback = function()
		local root = vim.b.git_root
		if root then
			git_branches[root] = nil
			load_git_branch(root)
		end
	end,
})

vim.api.nvim_create_autocmd("DiagnosticChanged", {
	group = group,
	callback = function()
		vim.cmd("redrawstatus!")
	end,
})

vim.o.statusline = "%!v:lua._statusline()"

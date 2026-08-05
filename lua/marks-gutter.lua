-- lua/marks-gutter.lua
local namespace = vim.api.nvim_create_namespace("MarksGutter")

local function place_mark(bufnr, name, line)
	if line < 1 then
		return
	end

	vim.api.nvim_buf_set_extmark(bufnr, namespace, line - 1, 0, {
		sign_text = name,
		sign_hl_group = "DiagnosticHint",
		priority = 5,
	})
end

local function same_file(bufnr, mark)
	if mark.pos[1] == bufnr then
		return true
	end

	if mark.file == "" then
		return false
	end

	local buffer_path = vim.fs.normalize(vim.api.nvim_buf_get_name(bufnr))
	local mark_path = vim.fs.normalize(vim.fn.fnamemodify(mark.file, ":p"))

	return buffer_path == mark_path
end

local function refresh(bufnr)
	if not vim.api.nvim_buf_is_loaded(bufnr) then
		return
	end

	vim.api.nvim_buf_clear_namespace(bufnr, namespace, 0, -1)

	-- Local marks: a-z
	for _, mark in ipairs(vim.fn.getmarklist(bufnr)) do
		local name = mark.mark:sub(2)
		if name:match("^[a-z]$") then
			place_mark(bufnr, name, mark.pos[2])
		end
	end

	-- Global marks: A-Z
	for _, mark in ipairs(vim.fn.getmarklist()) do
		local name = mark.mark:sub(2)
		if name:match("^[A-Z]$") and same_file(bufnr, mark) then
			place_mark(bufnr, name, mark.pos[2])
		end
	end
end

local function refresh_all()
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		refresh(bufnr)
	end
end

local group = vim.api.nvim_create_augroup("MarksGutter", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost" }, {
	group = group,
	callback = function(args)
		refresh(args.buf)
	end,
})

vim.api.nvim_create_autocmd("MarkSet", {
	group = group,
	pattern = "[a-zA-Z]",
	callback = refresh_all,
})

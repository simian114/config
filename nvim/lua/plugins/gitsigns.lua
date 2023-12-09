local installed, GitSigns = pcall(require, "gitsigns")
if not installed then
	vim.notify("Plugin 'nvim-cmp' is not installed")
	return
end

local opts = {
	current_line_blame = true,
	signs = {
		add = { text = "▌", show_count = true },
		change = { text = "▌", show_count = true },
		delete = { text = "▐", show_count = true },
		topdelete = { text = "▛", show_count = true },
		changedelete = { text = "▚", show_count = true },
	},
	sign_priority = 10,
	count_chars = {
		[1] = "",
		[2] = "₂",
		[3] = "₃",
		[4] = "₄",
		[5] = "₅",
		[6] = "₆",
		[7] = "₇",
		[8] = "₈",
		[9] = "₉",
		["+"] = "₊",
	},
	preview_config = {
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = { enable = false },
}

GitSigns.setup(opts)

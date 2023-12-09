-- requring plugin
local installed, LspSaga = pcall(require, "lspsaga")
if not installed then
	vim.notify("Plugin 'lspsaga' not installed")
	return
end

-- Setting up lspsaga
LspSaga.setup({
	debug = false,
	use_saga_diagnostic_sign = true,
	-- diagnostic sign
	error_sign = "",
	warn_sign = "",
	hint_sign = "",
	infor_sign = "",
	diagnostic_header_icon = "   ",
	-- code action title icon
	code_action_icon = " ",
	code_action_prompt = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
	finder_definition_icon = "  ",
	finder_reference_icon = "  ",
	max_preview_lines = 10,
	finder_action_keys = {
		open = "e",
		vsplit = "s",
		split = "i",
		quit = "q",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	finder = {
		left_width = 0.4,
		layout = "normal",
	},

	definition = {
		keys = {
			edit = "e",
		},
	},
	-- light bulb
	ui = {
		enable = true,
	},
	code_action_keys = { quit = "q", exec = "<CR>" },
	rename_action_keys = { quit = "<C-c>", exec = "<CR>" },
	definition_preview_icon = "  ",
	border_style = "single",
	rename_prompt_prefix = "➤",
	server_filetype_map = {},
	diagnostic_prefix_format = "%d. ",
})
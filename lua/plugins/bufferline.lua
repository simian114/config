local installed, BufferLine = pcall(require, "bufferline")
if not installed then
	vim.notify("Plugin 'bufferline' not installed")
	return
end
local opts = {
	options = { -- {{{
		-- themable = true,
		numbers = "ordinal",
		indicator = { style = "underline" },
    -- stylua: ignore
    close_command = function(n) require("mini.bufremove").delete(n, false) end,
    -- stylua: ignore
    right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
		middle_mouse_command = nil,

		-- buffer_close_icon = "",
		buffer_close_icon = "",
		modified_icon = "󰣕 ",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		diagnostics = false,
		diagnostics_update_in_insert = false,
		sort_by = "insert_at_end",
	}, -- }}}
}

BufferLine.setup(opts)

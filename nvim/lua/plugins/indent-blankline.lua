-- Dfining Colors
vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#458588 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#fe8019 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#b16286 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#689d6a gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#d79921 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#b8bb26 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent7 guifg=#fb4934 gui=nocombine]])

-- requring Plugin
local installed, IndentBlankLine = pcall(require, "ibl")
--
if not installed then
	vim.notify("Plugin 'indent_blankline' is not installed")
	return
end

local iblInstalled, IblHooks = pcall(require, "ibl.hooks")

IblHooks.register(IblHooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

-- Setting up indent_blankline
IndentBlankLine.setup({
	exclude = {
		filetypes = {
			"help",
			"alpha",
			"dashboard",
			"neo-tree",
			"Trouble",
			"lazy",
			"lsp-installer",
			"termianl",
			"NvimTree",
			"mason",
		},
	},
	whitespace = {
		remove_blankline_trail = true,
	},
	indent = { highlight = highlight },
})

-- requring plugin
local installed, Ufo = pcall(require, "nvim-ufo")
if not installed then
	vim.notify("Plugin 'nvim-ufo' not installed")
	return
end

local builtin = require("statuscol.builtin")

Ufo.setup({
	relculright = true,
	segments = {
		{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
		{ text = { "%s" }, click = "v:lua.ScSa" },
		{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
	},
})

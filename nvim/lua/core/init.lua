require("core.lazy")
require("core.keymaps")

if vim.g.vscode then
	vim.o.clipboard = "unnamedplus"
else
	require("core.options")
end

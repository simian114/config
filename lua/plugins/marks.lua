local installed, Marks = pcall(require, "marks")
if not installed then
	vim.notify("Plugin 'marks' is not installed")
	return
end

Marks.setup({
	default_mappings = true,
	signs = true,
	mappings = {
		next = "m.",
		prev = "m,",
	},
})

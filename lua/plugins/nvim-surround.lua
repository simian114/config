local installed, NvimSurround = pcall(require, "nvim-surround")
if not installed then
	vim.notify("Plugin 'nvim-surround' is not installed")
	return
end

NvimSurround.setup()

local installed, Neoscroll = pcall(require, "neoscroll")
if not installed then
	vim.notify("Plugin 'neoscroll' is not installed")
	return
end

Neoscroll.setup()

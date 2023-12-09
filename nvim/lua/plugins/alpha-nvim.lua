local installed, alpha = pcall(require, "alpha")
if not installed then
	return
end

-- local installed, Dashboard = pcall(require, "alpha.themes.dashboard")
local installed, Startify = pcall(require, "alpha.themes.startify")
if not installed then
	return
end

local startify = Startify
startify.section.header.val = {
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                     ]],
	[[       ████ ██████           █████      ██                     ]],
	[[      ███████████             █████                             ]],
	[[      █████████ ███████████████████ ███   ███████████   ]],
	[[     █████████  ███    █████████████ █████ ██████████████   ]],
	[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
	[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
	[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
	[[                                                                       ]],
	[[                                          컴퓨터는 가끔 거짓말을 한다. ]],
	[[                                                               - sanam ]],
	[[                                                                       ]],
	[[                                                                       ]],
}

startify.section.top_buttons.val = {
	startify.button("SPC f f", "  Find file"),
	startify.button("SPC f o", "  Recently opened files"),
	startify.button("SPC f w", "  Find word"),
	startify.button("SPC f b", "  Open buffers"),
}

startify.section.bottom_buttons.val = {
	startify.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
}

startify.section.header.opts.position = "center"

alpha.setup(startify.config)

vim.g.mapleader = " "

local neoscroll = require("neoscroll")

local map = vim.api.nvim_set_keymap

if vim.g.vscode then
-- //
else
	map("n", "<Tab>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true })
	map("n", "<S-Tab>", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true })

	map("n", "<Leader>1", "<CMD>BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
	map("n", "<Leader>2", "<CMD>BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
	map("n", "<Leader>3", "<CMD>BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
	map("n", "<Leader>4", "<CMD>BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
	map("n", "<Leader>5", "<CMD>BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
	map("n", "<Leader>6", "<CMD>BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
	map("n", "<Leader>7", "<CMD>BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
	map("n", "<Leader>8", "<CMD>BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
	map("n", "<Leader>9", "<CMD>BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })
	map("n", "<Leader>0", "<CMD>Telescope buffers<CR>", { noremap = true, silent = true })
	map("n", "<Leader>w", "<C-w>", { noremap = true, silent = true })
	map("i", "¡", "<C-\\> <CR>", { noremap = true, silent = false })
	-- saga
	map("n", "gd", "<cmd>mark A <CR> <cmd> Lspsaga goto_definition <CR>", { noremap = true, silent = false })
	map("n", "gD", "<cmd>mark A <cmd> Lspsaga goto_type_definition <CR>", { noremap = true, silent = false })
	map("n", "gp", "<cmd> Lspsaga peek_definition <CR>", { noremap = true, silent = false })
	map("n", "gf", "<cmd> Lspsaga finder <CR>", { noremap = true, silent = false })
	map("n", "g.", "<cmd> Lspsaga diagnostic_jump_next <CR>", { noremap = true, silent = false })
	map("n", "gm", "<cmd> Lspsaga diagnostic_jump_prev <CR>", { noremap = true, silent = false })
	map("n", "K", "<cmd> Lspsaga hover_doc <CR>", { noremap = true, silent = false })
	-- Copy-Pasting
	map("v", "<C-c>", '"+y', { noremap = true, silent = false })
	map("n", "<C-s>", '"+P', { noremap = true, silent = false })
	local terminal = require("nvterm.terminal")

	-- terminal
	local toggle_modes = { "n", "t" }

	local mappings = {
		{
			toggle_modes,
			"∆",
			function()
				terminal.toggle("horizontal")
			end,
		},
	}
	local opts = { noremap = true, silent = true }

	for _, mapping in ipairs(mappings) do
		vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
	end

	-- signature help
	local lsp_signature = require("lsp_signature")

	vim.keymap.set({ "i" }, "<C-k>", function()
		lsp_signature.toggle_float_win()
	end, { silent = true, noremap = true, desc = "toggle signature" })

	vim.keymap.set({ "n", "i" }, "˚", function()
		lsp_signature.toggle_float_win()
	end, { silent = true, noremap = true, desc = "toggle signature" })

	local ft_cmds = {
		go = "go run ./cmd/api" .. vim.fn.expand("%"),
	}

	vim.keymap.set({ "n" }, "<leader>tt", function()
		require("nvterm.terminal").send(ft_cmds[vim.bo.filetype])
	end, { silent = true, noremap = true, desc = "toggle signature" })

	-- buffer move when input mode
	map("i", "®", "<cmd>BufferLineCycleNext<cr>", { noremap = true, silent = true })
	map("i", "œ", "<cmd>BufferLineCyclePrev<cr>", { noremap = true, silent = true })
	map("n", "®", "<cmd>BufferLineCycleNext<cr>", { noremap = true, silent = true })
	map("n", "œ", "<cmd>BufferLineCyclePrev<cr>", { noremap = true, silent = true })

	map("i", "∂", "<End>", { noremap = true, silent = true })
	map("i", "å", "<Home>", { noremap = true, silent = true })
	map("n", "∂", "<End>", { noremap = true, silent = true })
	map("n", "å", "<Home>", { noremap = true, silent = true })

	-- dap
	vim.keymap.set("n", "<F5>", require("dap").continue)
	vim.keymap.set("n", "<F10>", require("dap").step_over)
	vim.keymap.set("n", "<F11>", require("dap").step_into)
	vim.keymap.set("n", "<F12>", require("dap").step_out)

	-- quic
	map("n", "sq", "<cmd>q<cr>", { noremap = true, silent = false })

	-- Go to prev
	map("n", "gG", "<C-o> <CR>", { noremap = true, silent = false })

	-- split pane
	map("n", "sv", "<cmd>vsplit<CR>", { noremap = true, silent = false })
	map("n", "sb", "<cmd>split<cr>", { noremap = true, silent = true })

	-- Toggle between tabs
	map("n", "sh", "<C-w>h", { noremap = true, silent = false })
	map("n", "sj", "<C-w>j", { noremap = true, silent = false })
	map("n", "sk", "<C-w>k", { noremap = true, silent = false })
	map("n", "sl", "<C-w>l", { noremap = true, silent = false })
end

-- Indenting
map("v", "<", "<gv", { noremap = true, silent = false })
map("v", ">", ">gv", { noremap = true, silent = false })

-- no highlight
map("n", "sn", "<cmd>noh<cr>", { noremap = true, silent = false })

-- move
vim.keymap.set({ "n", "v" }, "su", function()
	neoscroll.scroll(-vim.wo.scroll, true, 150)
end)

vim.keymap.set({ "n", "v" }, "sd", function()
	neoscroll.scroll(vim.wo.scroll, true, 150)
end)

vim.keymap.set({ "n", "v" }, "sf", function()
	neoscroll.scroll(vim.wo.scroll, true, 150)
end)
-- Terminate Terminal mode
-- map("t", "<C-d>", [[<C-\><C-n>]], { noremap = true })

-- 10 line move
-- map("n", "<M-j>", "10j <CR>", { noremap = true, silent = false })
-- map("n", "<M-k>", "10k <CR>", { noremap = true, silent = false })

-- folds
map("n", "zo", "zfi{", { noremap = true, silent = false })
map("n", "zO", "zfa{", { noremap = true, silent = false })

-- requring plugin
local installed, WhichKey = pcall(require, "which-key")
if not installed then
	vim.notify("Plugin 'which-key' is not installed")
	return
end

-- ##################################################################################################

local wk = WhichKey

local toggle_horizontal = function()
	require("nvterm.terminal").toggle("horizontal")
end

local toggle_vertical = function()
	require("nvterm.terminal").toggle("vertical")
end

local toggle_float = function()
	require("nvterm.terminal").toggle("float")
end

local toggle_focus_nvimtree = function()
	if vim.bo.filetype == "NvimTree" then
		vim.cmd.wincmd("p")
	else
		require("nvim-tree").focus("<CR>")
	end
end

-- local toggle_term = function()
-- 	require("nvterm.terminal").toggle("horizontal")
-- end
--
-- local toggle_term_vertical = function()
-- 	require("nvterm.terminal").toggle("vertical")
-- end
--
-- local toggle_term_hover = function()
-- 	require("nvterm.terminal").toggle("float")
-- end

-- ##################################################################################################
-- Keymaps
local mappings = {
	-- Return to StartPage
	DD = { ":Alpha<cr>", "StartPage" },

	-- Basic Operations
	-- q = { ":q<cr>", "Quit File" },
	-- Q = { ":q!<cr>", "Force Quit File" },
	w = { ":w<cr>", "Save File" },
	W = { ":w!<cr>", "Force Save File" },

	-- Buffers
	x = { ":bdelete<cr>", "Close Buffer" },

	Ec = { ":e ~/.config/nvim<cr>", "Edit Configs" },

	-- NvimTree
	--[[ e = {
		name = "NvimTree",
		e = { ":NvimTreeToggle<cr>", "NvimTreeToggle" },
		f = { ":NvimTreeFocus<cr>", "NvimTreeFocus" },
		h = { ":e ~/<cr>", "NvimTreeHome" },
	}, ]]
	b = { ":NvimTreeToggle<cr>", "NvimTreeToggle" },
	e = { toggle_focus_nvimtree, "Fucus on / off" },
	-- Telescope
	f = {
		name = "Telescope",
		-- f = { ":Telescope find_files theme=ivy<cr>", "Telescope find_files" },
		f = { ":Telescope find_files theme=ivy<cr>", "Telescope find_files" },
		d = { ":Telescope current_buffer_fuzzy_find theme=ivy<cr>", "Fuzzy Find in File" },
		o = { ":Telescope oldfiles theme=ivy<cr>", "Telescope oldfiles" },
		w = { ":Telescope live_grep theme=ivy<cr>", "Telescope live_grep" },
		r = { ":Telescope resume theme=ivy<cr>", "Telescope resume" },
		b = { ":Telescope buffers theme=ivy<cr>", "Telescope buffers" },
	},
	-- Split
	v = { ":vsplit<cr>", "Split Vertically" },
	h = { ":split<cr>", "Split Horizontally" },

	-- Terminal
	t = {
		t = { toggle_horizontal, "Split Below" },
		h = { toggle_vertical, "Hide term" },
		i = { toggle_float, "Hide term" },
		-- f = { toggle_float, "Floating Terminal" },
		-- l = { toggle_lazygit, "LazyGit" },
	},
	["/"] = {
		function()
			require("Comment.api").toggle.linewise.current()
		end,
		"comment",
	},

	-- Lsp Stuffs
	s = {
		name = "LSP",
		s = { ":w<cr>", "Save File" },
		f = { "<cmd> Lspsaga finder <CR>", "floating finder" },
		i = { ":LspInfo<cr>", "Connected Language Servers" },
		k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
		K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
		w = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
		W = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder" },
		l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List Workspace Folders" },
		-- t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
		d = { "<cmd> Lspsaga goto_definition <CR>", "Goto definition" },
		D = { "<cmd> Lspsaga goto_type_definition <CR>", "Goto definition" },
		r = { "<cmd> Lspsaga finder <CR>", "fnextind reference" },
		R = { "<cmd>Lspsaga rename<cr>", "Rename" },
		a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
		e = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
		n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Go To Next Diagnostic" },
		N = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Go To Previous Diagnostic" },
	},
	g = {
		g = { ":LazyGit<CR>", "Open LazyGit" },
	},
	-- Tagbar for function list
	T = {
		f = { ":TagbarToggle<cr>", "Functions List Tagbar" },
	},
}
local opts = { prefix = "<leader>" }
wk.register(mappings, opts)

local visualMappings = {
	["/"] = {
		"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
		"Toggle comment",
	},
}

local visualOpts = { prefix = "<leader>", mode = "v" }
wk.register(visualMappings, visualOpts)

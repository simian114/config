local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	--Dash Board
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Vim Notification Popup
	{ "rcarriga/nvim-notify" },

	-- Auto Formatting
	{ "jose-elias-alvarez/null-ls.nvim" },

	-- Commnets Plugins
	{ "numToStr/Comment.nvim" },

	-- Colorscheme
	{ "gruvbox-community/gruvbox" },
	{ "sainnhe/gruvbox-material" },

	-- For Transparency
	{ "xiyaowong/transparent.nvim" },

	-- Rainbos CSV
	{ "mechatroner/rainbow_csv" },

	-- Colorizer.lua
	{ "norcalli/nvim-colorizer.lua" },

	-- Terminal
	-- { "akinsho/toggleterm.nvim" },
	{
		"NvChad/nvterm",
		config = function()
			require("nvterm").setup()
		end,
	},
	-- Indent Line
	{ "lukas-reineke/indent-blankline.nvim" },

	-- GitSign Plugins
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local opts = {
				current_line_blame = true,
				signs = {
					add = { text = "▌", show_count = true },
					change = { text = "▌", show_count = true },
					delete = { text = "▐", show_count = true },
					topdelete = { text = "▛", show_count = true },
					changedelete = { text = "▚", show_count = true },
				},
				sign_priority = 10,
				count_chars = {
					[1] = "",
					[2] = "₂",
					[3] = "₃",
					[4] = "₄",
					[5] = "₅",
					[6] = "₆",
					[7] = "₇",
					[8] = "₈",
					[9] = "₉",
					["+"] = "₊",
				},
				preview_config = {
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				yadm = { enable = false },
			}
			require("gitsigns").setup(opts)
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "bufWinEnter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},

	-- nvim-ts-autotag
	{ "windwp/nvim-ts-autotag" },

	-- Nvim treesitter rainbow brackets
	{ "hiphish/rainbow-delimiters.nvim" },

	-- nvim autopairs
	{ "windwp/nvim-autopairs" },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "kdheepak/lazygit.nvim" },
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	},

	-- NeoVIMTree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Buffer Line
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- Lua Line
	{ "nvim-lualine/lualine.nvim" },

	-- WhichKey
	{ "folke/which-key.nvim" },

	-- Auto Completion
	{ "hrsh7th/nvim-cmp" }, -- cmp Completion plugin
	{ "hrsh7th/cmp-buffer" }, -- buffer completion
	{ "hrsh7th/cmp-path" }, -- path completion
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-cmdline" }, -- command line Completion

	{ "saadparwaiz1/cmp_luasnip" },
	-- Snipit Engine
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},

	-- Lsp Saga
	{ "glepnir/lspsaga.nvim" },

	-- lspkind for icons with snipits
	{ "onsails/lspkind.nvim" },

	-- Managing Mason
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ "jay-babu/mason-null-ls.nvim" },
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "mfussenegger/nvim-dap" },
	},

	-- emmet
	{ "mattn/emmet-vim" },

	-- lorem ipsum
	{ "derektata/lorem.nvim" },

	-- Neovim Tagbar
	{ "preservim/tagbar" },

	-- nvim surround
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	-- vim-visual-multi
	{
		"mg979/vim-visual-multi",
		event = "BufRead", -- 이벤트를 설정해줍니다.
		config = function()
			vim.g.multi_cursor_use_default_mapping = 0
			vim.g.multi_cursor_next_key = "<C-n>"
			vim.g.multi_cursor_prev_key = "<C-p>"
			vim.g.multi_cursor_skip_key = "<C-x>"
			vim.g.multi_cursor_quit_key = "<Esc>"
		end,
		-- lazy 설정을 false로 변경합니다.
		-- 이렇게 하면 neovim이 시작될 때 플러그인이 즉시 로드됩니다.
		-- 만약 이 설정을 주석처리하거나 삭제하면, 이벤트가 발생하기 전까지 플러그인이 로드되지 않습니다.
		lazy = false,
	},
	-- git diff
	{ "sindrets/diffview.nvim" },
	{
		"RRethy/vim-illuminate", -- {{{
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			delay = 200,
			under_cursor = true,
			large_file_cutoff = 2000,
			large_file_overrides = { providers = { "lsp" } },
		},
		config = function(_, opts)
			require("illuminate").configure(opts)

			local function map(key, dir, buffer)
				vim.keymap.set("n", key, function()
					require("illuminate")["goto_" .. dir .. "_reference"](false)
				end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
			end

			map("]]", "next")
			map("[[", "prev")

			-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					map("]]", "next", buffer)
					map("[[", "prev", buffer)
				end,
			})
		end,
		keys = {
			{ "]]", desc = "Next Reference" },
			{ "[[", desc = "Prev Reference" },
		},
		{
			"rainbowhxch/accelerated-jk.nvim", -- {{{
			keys = {
				{ "j", "<Plug>(accelerated_jk_gj)", mode = { "n" }, desc = "Accelerated gj movement" },
				{ "k", "<Plug>(accelerated_jk_gk)", mode = { "n" }, desc = "Accelerated gk movement" },
			},
			opts = {
				mode = "time_driven",
				enable_deceleration = false,
				acceleration_motions = {},
				acceleration_limit = 150,
				acceleration_table = { 7, 12, 17, 21, 24, 26, 28, 30 },
				deceleration_table = { { 150, 9999 } },
			},
			-- }}}
		},
		{
			"chentoast/marks.nvim",
			config = function()
				require("marks").setup({
					default_mappings = true,
					signs = true,
					mappings = {
						next = "m.",
						prev = "m,",
					},
				})
			end,
		},
		{ "famiu/bufdelete.nvim" },
		{
			"karb94/neoscroll.nvim",
			config = function()
				require("neoscroll").setup()
			end,
		},
		{
			"ggandor/leap.nvim",
			config = function()
				require("leap").add_default_mappings()
			end,
		},
	},
	-- ==============================================================
	--
} -- end of plugin line

local opts = {}
require("lazy").setup(plugins, opts)

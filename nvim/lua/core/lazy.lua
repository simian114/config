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

if vim.g.vscode then
	local plugins = {
		-- nvim surround
		{
			"kylechui/nvim-surround",
			version = "*", -- Use for stability; omit to use `main` branch for the latest features
			event = "VeryLazy",
		},
		{
			"rainbowhxch/accelerated-jk.nvim",
			keys = {
				{ "j", "<Plug>(accelerated_jk_gj)", mode = { "n" }, desc = "Accelerated gj movement" },
				{ "k", "<Plug>(accelerated_jk_gk)", mode = { "n" }, desc = "Accelerated gk movement" },
			},
		},
		{ "karb94/neoscroll.nvim" },
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			event = { "BufReadPre", "BufNewFile" },
			-- event = "bufWinEnter",
			dependencies = {
				"JoosepAlviste/nvim-ts-context-commentstring",
			},
		},
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			after = "nvim-treesitter",
			requires = "nvim-treesitter/nvim-treesitter",
		},
	}

	local opts = {}
	require("lazy").setup(plugins, opts)
else
	print("zzz")
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

		{
			"NvChad/nvterm",
			config = function()
				require("nvterm").setup()
			end,
		},
		-- Indent Line
		{ "lukas-reineke/indent-blankline.nvim" },

		-- GitSign Plugins
		{ "lewis6991/gitsigns.nvim" },

		-- Treesitter
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			event = { "BufReadPre", "BufNewFile" },
			-- event = "bufWinEnter",
			dependencies = {
				"JoosepAlviste/nvim-ts-context-commentstring",
			},
		},
		{ "nvim-treesitter/playground" },

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
				{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
		},

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
		-- dap
		{ "mfussenegger/nvim-dap" },
		{
			"leoluz/nvim-dap-go",
			ft = "go",
			dependencies = "mfussenegger/nvim-dap",
			config = function(_, opts)
				require("dap-go").setup(opts)
			end,
		},
		{ "rcarriga/nvim-dap-ui" },
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
		},
		-- vim-visual-multi
		{
			"mg979/vim-visual-multi",
			event = "BufRead", -- 이벤트를 설정해줍니다.
			lazy = false,
		},
		-- git diff
		{ "sindrets/diffview.nvim" },
		{
			"rainbowhxch/accelerated-jk.nvim",
			keys = {
				{ "j", "<Plug>(accelerated_jk_gj)", mode = { "n" }, desc = "Accelerated gj movement" },
				{ "k", "<Plug>(accelerated_jk_gk)", mode = { "n" }, desc = "Accelerated gk movement" },
			},
		},
		{ "chentoast/marks.nvim" },
		{ "famiu/bufdelete.nvim" },
		{ "karb94/neoscroll.nvim" },
		-- { "ggandor/leap.nvim" },
		-- {
		-- 	"Exafunction/codeium.vim",
		-- 	event = "BufEnter",
		-- },
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			after = "nvim-treesitter",
			requires = "nvim-treesitter/nvim-treesitter",
		},
		{ "anuvyklack/keymap-amend.nvim" },
		{
			"diepm/vim-rest-console",
		},
		{
			"tpope/vim-dadbod",
		},
		{
			"kristijanhusak/vim-dadbod-ui",
			dependencies = {
				{ "tpope/vim-dadbod", lazy = true },
				{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
			},
			cmd = {
				"DBUI",
				"DBUIToggle",
				"DBUIAddConnection",
				"DBUIFindBuffer",
			},
			init = function()
				-- Your DBUI configuration
				vim.g.db_ui_use_nerd_fonts = 1
			end,
		},

		{
			"simrat39/symbols-outline.nvim",
			config = function()
				require("symbols-outline").setup()
			end,
		},
		{ "RRethy/vim-illuminate" },
		{
			"kevinhwang91/nvim-ufo",
			event = "BufRead",
			dependencies = {
				{ "kevinhwang91/promise-async" },
				{
					"luukvbaal/statuscol.nvim",
				},
			},
			config = function()
				-- Fold options
				vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
				vim.o.foldcolumn = "1" -- '0' is not bad
				vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
				vim.o.foldlevelstart = 99
				vim.o.foldenable = true

				require("ufo").setup()
			end,
		},
		{
			"ray-x/lsp_signature.nvim",
			event = "VeryLazy",
			opts = {},
			config = function(_, opts)
				require("lsp_signature").setup(opts)
			end,
		},
		{
			"ray-x/go.nvim",
			dependencies = { -- optional packages
				"ray-x/guihua.lua",
				"neovim/nvim-lspconfig",
				"nvim-treesitter/nvim-treesitter",
			},
			config = function()
				require("go").setup()
			end,
			event = { "CmdlineEnter" },
			ft = { "go", "gomod" },
			build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
		},
		{
			"VonHeikemen/fine-cmdline.nvim",
			dependencies = {
				"MunifTanjim/nui.nvim",
			},
		},
	} -- end of plugin line
	local opts = {}
	require("lazy").setup(plugins, opts)
end

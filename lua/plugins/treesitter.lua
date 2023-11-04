-- requring plugin
local installed, TreeSitter = pcall(require, "nvim-treesitter.configs")

if not installed then
	vim.notify("Plugin 'treesitter' is not installed")
	return
end

-- Setting up Treesitter
TreeSitter.setup({
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"vimdoc",
		"html",
		"css",
		"python",
		"markdown",
		"markdown_inline",
		"go",
		"json",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = false,
		additional_vim_regex_highlighting = false,
	},

	autotag = {
		enable = true,
	},

	autopairs = {
		enable = true,
	},

	rainbow = {
		enable = true,
	},

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	textobjects = {
		-- swap = {
		-- 	enable = true,
		-- 	swap_next = {
		-- 		["<leader>a"] = "@parameter.inner",
		-- 	},
		-- 	swap_previous = {
		-- 		["<leader>A"] = "@parameter.inner",
		-- 	},
		-- },
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]]"] = { query = "@function.outer", desc = "Next function start" },
				--
				-- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
				-- ["]o"] = "@loop.*",
				-- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
				--
				-- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
				-- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
				["]s"] = { query = "@scope", query_group = "locals", desc = "next scope" },
				["]z"] = { query = "@fold", query_group = "folds", desc = "next fold" },
				["]d"] = { query = "@conditional.outer", desc = "Next conditional" },
			},
			-- goto_next_end = {
			-- 	["]M"] = "@function.outer",
			-- 	["]["] = "@class.outer",
			-- },
			goto_previous_start = {
				["[["] = { query = "@function.outer", desc = "Previous function start" },
				["[s"] = { query = "@scope", query_group = "locals", desc = "Previous scope" },
				["[z"] = { query = "@fold", query_group = "folds", desc = "Previous fold" },
				["[d"] = { query = "@conditional.outer", desc = "Previous conditional" },
			},
			-- goto_previous_end = {
			-- 	["[M"] = "@function.outer",
			-- 	["[]"] = "@class.outer",
			-- },
			-- Below will go to either the start or the end, whichever is closer.
			-- Use if you want more granular movements
			-- Make it even more gradual by adding multiple queries and regex.
			goto_next = {},
			goto_previous = {},
		},
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter" },
				["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter" },
				["af"] = { query = "@function.outer", desc = "Select outer function" },
				["if"] = { query = "@function.inner", desc = "Select inner function" },
				["ac"] = { query = "@conditional.outer", desc = "Select outer conditional" },
				["ic"] = { query = "@conditional.inner", desc = "Select inner conditional" },
				["al"] = { query = "@loop.outer", desc = "Select outer loop" },
				["il"] = { query = "@loop.inner", desc = "Select inner loop" },
				["at"] = { query = "@comment.outer", desc = "Select outer comment" },
				["it"] = { query = "@comment.outer", desc = "Select inner comment" },
				-- ["ac"] = "@class.outer",
				-- You can optionally set descriptions to the mappings (used in the desc parameter of
				-- nvim_buf_set_keymap) which plugins like which-key display
				-- ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				-- You can also use captures from other query groups like `locals.scm`
				["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
			},
			-- You can choose the select mode (default is charwise 'v')
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * method: eg 'v' or 'o'
			-- and should return the mode ('v', 'V', or '<c-v>') or a table
			-- mapping query_strings to modes.
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
			-- If you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding or succeeding whitespace. Succeeding
			-- whitespace has priority in order to act similarly to eg the built-in
			-- `ap`.
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * selection_mode: eg 'v'
			-- and should return true of false
			include_surrounding_whitespace = true,
		},
	},
})

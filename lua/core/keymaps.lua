vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
local comment = function()
	require("Comment.api").toggle.linewise.current()
end
-- Toggle between tabs
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = false })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = false })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = false })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = false })

-- Go to prev
map("n", "gG", "<C-o> <CR>", { noremap = true, silent = false })

-- BufferLine
map("n", "<A-n>", ":BufferLineCycleNext<cr>", { noremap = true, silent = true })
map("n", "<A-p>", ":BufferLineCyclePrev<cr>", { noremap = true, silent = true })

-- Indenting
map("v", "<", "<gv", { noremap = true, silent = false })
map("v", ">", ">gv", { noremap = true, silent = false })

-- Copy-Pasting
map("v", "<C-c>", '"+y', { noremap = true, silent = false })
map("n", "<C-s>", '"+P', { noremap = true, silent = false })

-- Remapping Escape key
map("i", "kj", "<Esc>", { noremap = true, silent = false })
map("n", "kj", "<Esc>", { noremap = true, silent = false })
map("v", "kj", "<Esc>", { noremap = true, silent = false })

map("i", "¡", "<C-\\> <CR>", { noremap = true, silent = false })

-- Buffer move

map("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = false })
map("n", "<S-Tab>", ":bprev<CR>", { noremap = true, silent = false })

-- saga

map("n", "gd", "<cmd> Lspsaga goto_definition <CR>", { noremap = true, silent = false })
map("n", "gD", "<cmd> Lspsaga goto_type_definition <CR>", { noremap = true, silent = false })
map("n", "gp", "<cmd> Lspsaga peek_definition <CR>", { noremap = true, silent = false })
map("n", "gr", "<cmd> Lspsaga finder <CR>", { noremap = true, silent = false })
map("t", "<ESC>", [[<C-\><C-n>]], { noremap = true })

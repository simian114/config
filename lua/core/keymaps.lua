vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
-- Toggle between tabs
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = false })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = false })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = false })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = false })

-- BufferLine
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

-- Buffer window
map("n", "<Leader>w", "<C-w>", { noremap = true, silent = true })

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

-- saga

map("n", "gd", "<cmd>mark A <CR> <cmd> Lspsaga goto_definition <CR>", { noremap = true, silent = false })
map("n", "gD", "<cmd>mark A <cmd> Lspsaga goto_type_definition <CR>", { noremap = true, silent = false })
map("n", "gp", "<cmd> Lspsaga peek_definition <CR>", { noremap = true, silent = false })
map("n", "gf", "<cmd> Lspsaga finder <CR>", { noremap = true, silent = false })
map("n", "g.", "<cmd> Lspsaga diagnostic_jump_next <CR>", { noremap = true, silent = false })
map("n", "gm", "<cmd> Lspsaga diagnostic_jump_prev <CR>", { noremap = true, silent = false })
map("n", "K", "<cmd> Lspsaga hover_doc <CR>", { noremap = true, silent = false })

-- Go to prev
map("n", "gG", "<C-o> <CR>", { noremap = true, silent = false })

-- Terminate Terminal mode
map("t", "<C-d>", [[<C-\><C-n>]], { noremap = true })

-- 10 line move
map("n", "<M-j>", "10j <CR>", { noremap = true, silent = false })
map("n", "<M-k>", "10k <CR>", { noremap = true, silent = false })

-- folds
map("n", "zo", "zfi{", { noremap = true, silent = false })
map("n", "zO", "zfa{", { noremap = true, silent = false })

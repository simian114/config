-- local status, saga = pcall(require, 'lspsaga')
local  saga = require("lspsaga")

saga.setup {
  server_filetype_map = {},
  rename = {
    auto_save = true
  },
  lightbulb = {
    sign = false,
    virtual_text = true
  },
  symbols_in_winbar = {
    enable = true
  },
}

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
-- vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
-- vim.keymap.set('n', 'gd', '<Cmd>Lspsaga finder<cr>', opts)
-- vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<cr>', opts)
-- code action :Lspsaga code_action
--

vim.keymap.set('n', 'gz', '<Cmd>Lspsaga peek_definition<cr>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga finder imp<cr>', opts)


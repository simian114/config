-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })


-- vim.wo.relativenumber = true


vim.keymap.set('n', '<S-Up>', "10k z.", { silent = true })
vim.keymap.set('n', '<S-Down>', "10j z.", { silent = true })


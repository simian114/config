---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>h"] = {
      "<cmd> sb <CR>",
      "Horizontal Split",
    },
    ["<leader>v"] = {
      "<cmd> vert sb <CR>",
      "Vertical Split",
    },
  },
}

-- more keybinds!

M.nvimtree = {
  n = {
    ["<leader>e"] = {
      function()
        print(vim.bo.filetype)
        if vim.bo.filetype == "NvimTree" then
          vim.cmd.wincmd "p"
        else
          require("nvim-tree").focus "<CR>"
        end
      end,
      desc = "toggle haha",
    },
  },
}
M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<leader>ti"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<leader>tt"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<leader>ti"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<leader>tt"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- pick a hidden term
    ["<leader>tp"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },
  },
}

return M

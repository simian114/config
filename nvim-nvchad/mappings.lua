---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>h"] = {
      "<cmd> sb <CR>",
      "Horizontal Split",
    },
    ["<leader>v"] = {
      "<cmd> vert sb <CR>",
      "Vertical Split",
    },
    -- saga finder
    ["<leader>ss"] = { "<cmd> w <CR>", "Save file" },
    ["<leader>sf"] = { "<cmd> Lspsaga finder <CR>", "floating finder" },
    ["<leader>sa"] = { "<cmd> Lspsaga code_action <CR>", "code action" },
    ["<leader>gg"] = { "<cmd> LazyGit <CR>", "Open LazyGit" },
    ["<leader>ra"] = { "<cmd> Lspsaga rename<CR>", "Open LazyGit" },
    ["gd"] = { "<cmd> Lspsaga goto_definition <CR>", "Goto definition" },
    ["gD"] = { "<cmd> Lspsaga goto_type_definition <CR>", "Goto definition" },
    ["gp"] = { "<cmd> Lspsaga peek_definition <CR>", "peek definition" },
    ["gr"] = { "<cmd> Lspsaga finder <CR>", "fnextind reference" },
    ["g."] = { "<cmd> Lspsaga diagnostic_jump_next <CR>", "find reference" },
    ["g,"] = { "<cmd> Lspsaga diagnostic_jump_prev <CR>", "find reference" },
  },
}

-- more keybinds!

M.nvimtree = {
  n = {
    ["<leader>b"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
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

M.lspconfig = {
  plugin = true,

  n = {
    ["gG"] = { "<C-o> <CR>", "Go to prev cursor position" },
    ["gh"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>ca"] = { "<cmd> Lspsaga code_action <CR>", "code action" },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<leader>."] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<leader>,"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
  },
}

return M
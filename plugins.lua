local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "MunifTanjim/prettier.nvim",
    cmd = { "Prettier" },
    -- dependencies = {
    --   {
    --     "neovim/nvim-lspconfig",
    --   },
    --   {
    --     "jose-elias-alvarez/null-ls.nvim",
    --     config = function()
    --       require "custom.configs.null-ls"
    --     end,
    --   },
    -- },
    config = function()
      require "custom.configs.prettier"
    end,
    lazy = true,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    plugins,
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup {}
    end,
    lazy = true,
    event = "VeryLazy",
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = {
  --     -- format & linting
  --     {
  --       "jose-elias-alvarez/null-ls.nvim",
  --       config = function()
  --         require "custom.configs.null-ls"
  --       end,
  --     },
  --   },
  --   config = function()
  --     require "plugins.configs.lspconfig"
  --     require "custom.configs.lspconfig"
  --   end, -- Override to setup mason-lspconfig
  -- },
  {
    "nvimdev/lspsaga.nvim",
    cmd = { "Lspsaga" },
    config = function()
      require "custom.configs.lspsaga"
    end,
    lazy = true,
  },
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
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    cmd = { "LazyGit" , "LazyGitCurrentFile", "LazyGitConfig" },
    config = function()
      require "custom.configs.lazygit"
    end,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins

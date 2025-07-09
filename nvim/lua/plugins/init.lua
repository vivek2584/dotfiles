return {
  {
    "stevearc/conform.nvim",
     event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
   config = function()
      require "configs.lspconfig"
    end,
  },

  {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      -- 🛑 Disable everything else
      code_action = { enable = false },
      lightbulb = { enable = false },
      rename = { enable = false },
      outline = { enable = false },
      finder = { enable = false },
      definition = { enable = false },
      symbol_in_winbar = { enable = false},
      diagnostic = { enable = false },
      callhierarchy = { enable = false },
      implement = { enable = false },
      beacon = { enable = false },

      -- ✅ Only hover enabled
      hover = {
        max_width = 0.9,
        max_height = 0.8,
        open_link = "gx",
        open_cmd = "!wslview",
      },
      ui = {
        border = "rounded",
        winblend = 10,
        title = true,
      },
    })

    vim.api.nvim_set_hl(0, "HoverBorder", { fg = "#e5e5e5" })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- for markdown rendering
    "nvim-tree/nvim-web-devicons",     -- optional
  },
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },

  {
    'rust-lang/rust.vim',
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },

  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function()
      require("crates").setup {
        completion = {

          cmp = {
            enabled = true
          },
        },

      }
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
    end
  },

  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    cmd = "Leet",

    dependencies = {
        -- include a picker of your choice, see picker section for more details
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    opts = {
        -- configuration goes here
        lang = "rust",
        standalone = true,
        plugins = {
          non_standalone = true,
        },
        storage = {
        home = "~/.config/leetcode-rust",
        cache = "~/.cache/leetcode/",
        },
    },
}
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}

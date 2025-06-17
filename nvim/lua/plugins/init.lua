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
  'nvimdev/lspsaga.nvim',
  event = "LspAttach",
  config = function()
    require('lspsaga').setup({
      lightbulb = {
        enable = false, -- 🚫 disable lightbulb
      },
      hover = {
        max_width = 0.9,

        max_height = 0.8,
        open_link = 'gx',
        open_cmd = '!wslview', -- or 'xdg-open' on Linux

      },
      ui = {
        border = 'rounded',
        winblend = 10,
        title = true,
      },
    })
   vim.api.nvim_set_hl(0, "HoverBorder", { fg = "#e5e5e5" })  -- light gray
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- required for markdown
    'nvim-tree/nvim-web-devicons',     -- optional
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

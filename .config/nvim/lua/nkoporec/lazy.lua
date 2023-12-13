require("lazy").setup({
  "nvim-lualine/lualine.nvim",
  "numToStr/Comment.nvim",
  "junegunn/fzf",
  "junegunn/fzf.vim",
  "tpope/vim-fugitive",
  "mbbill/undotree",
  "tjdevries/gruvbuddy.nvim",
  "tjdevries/colorbuddy.nvim",
  "norcalli/nvim-colorizer.lua",
  "kyazdani42/nvim-web-devicons",
  "nvim-treesitter/playground",
  "w0ng/vim-hybrid",
  "rust-lang/rust.vim",
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text"
})

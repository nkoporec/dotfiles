return require("packer").startup(function()
    -- Defaults
    use("wbthomason/packer.nvim")

    -- UI
    use("tjdevries/cyclist.vim")
    use("kyazdani42/nvim-web-devicons")
    use("tjdevries/colorbuddy.nvim")
    use("norcalli/nvim-colorizer.lua")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use({ "simrat39/rust-tools.nvim" })
    
    -- Language tooling
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")
    use("neomake/neomake")

    -- File managment
    use("nvim-telescope/telescope.nvim")
    use("tpope/vim-fugitive")

    -- Colorschemes
    use("gruvbox-community/gruvbox")
    use("tjdevries/gruvbuddy.nvim")

    -- Other things
    use("sbdchd/neoformat")
    use("mbbill/undotree")

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use("nvim-treesitter/playground")
    use("numToStr/Comment.nvim")
    use("klen/nvim-config-local")


    -- Helpers
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
end)

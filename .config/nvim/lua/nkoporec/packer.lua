return require("packer").startup(function()
    -- Defaults
    use("wbthomason/packer.nvim")

    -- UI
    -- use("tjdevries/cyclist.vim")
    use("kyazdani42/nvim-web-devicons")
    use("tjdevries/gruvbuddy.nvim")
    use("tjdevries/colorbuddy.nvim")
    use("chriskempson/base16-vim")
    use("norcalli/nvim-colorizer.lua")
    use("w0ng/vim-hybrid")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use({ "simrat39/rust-tools.nvim" })
    use({ "lvimuser/lsp-inlayhints.nvim" })
    use({ "rust-lang/rust.vim" })
    use {
        "williamboman/mason.nvim",
    }

    
    -- Language tooling
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")
    use("neomake/neomake")

    -- File managment
    use("nvim-telescope/telescope.nvim")
    use("tpope/vim-fugitive")
    -- use("junegunn/fzf.vim")

    -- Colorschemes
    use("gruvbox-community/gruvbox")

    -- Other things
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

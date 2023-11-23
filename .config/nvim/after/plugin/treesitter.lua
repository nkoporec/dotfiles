local _ = require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "go",
    "php",
    "html",
    "javascript",
    "json",
    "markdown",
    "python",
    "query",
    "rust",
    "toml",
    "tsx",
    "typescript",
  },

  highlight = {
    enable = true,
    use_languagetree = false,
    disable = { "json", "lua"},
  },
  indent = {
      enable = true,
      -- disable = {"php"}
  }
}

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
    "racket",
    "rust",
    "toml",
    "tsx",
    "typescript",
  },

  highlight = {
    enable = true,
    use_languagetree = false,
    disable = { "json"},
  },
  indent = {
      enable = true,
      disable = {"php"}
  }
}

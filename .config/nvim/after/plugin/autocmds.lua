local Job = require "plenary.job"
local Remap = require("nkoporec.keymap")
local nnoremap = Remap.nnoremap


-- Rust
local rust_group = vim.api.nvim_create_augroup("CustomRustCmds", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--     group = rust_group,
--     command = "!cargo check",
--     pattern = "*.rs"
-- })

vim.api.nvim_create_autocmd("BufWritePost", {
    group = rust_group,
    command = "silent! !rustfmt %",
    pattern = "*.rs"
})

vim.api.nvim_create_autocmd("BufEnter", {
    group = rust_group,
    callback = function()
        nnoremap("<leader>d", ":!cargo check<CR>")
    end,
    pattern = "*.rs"
})

-- PHP
local php_group = vim.api.nvim_create_augroup("CustomPhpCmds", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    group = php_group,
    callback = function()
        nnoremap("<leader>d", ":!./vendor/bin/phpstan analyze %<CR>")
    end,
    pattern = "*.php,*.module,*.install,*.profile"
})

vim.api.nvim_create_autocmd("BufWritePost", {
    group = php_group,
    command = "Neomake",
    pattern = "*.php,*.module,*.install,*.profile"
})

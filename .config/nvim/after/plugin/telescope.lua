-- Remaps
local Remap = require("nkoporec.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<C-p>", ":Telescope")
nnoremap("<leader>s", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)
nnoremap("<Leader>f", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<leader>sw", function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
nnoremap("<leader>b", function()
    require('telescope.builtin').buffers()
end)

nnoremap("<leader>gc", function()
    require('telescope.builtin').git_branches()
end)

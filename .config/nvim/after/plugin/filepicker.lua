-- Remaps
local Remap = require("nkoporec.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<Leader>f", function()
    vim.cmd('Files')
end)

nnoremap("<Leader>gf", function()
    vim.cmd('GitFiles')
end)

nnoremap("<Leader>b", function()
    vim.cmd('Buffers')
end)

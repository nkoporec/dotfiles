-- Keymaps related to nvim
local Remap = require("nkoporec.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local tnoremap = Remap.tnoremap
local nmap = Remap.nmap
local vmap = Remap.vmap

-- UndotreeShow
nnoremap("<leader>u", ":UndotreeShow<CR>")

-- Move selected lines up/down
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- Better copying and pasting
xnoremap("<leader>p", "\"_dP")
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

-- Beter split movements
nnoremap("<leader>h", "<C-w>h");
nnoremap("<leader>j", "<C-w>j");
nnoremap("<leader>k", "<C-w>k");
nnoremap("<leader>l", "<C-w>l");

-- Indent/Unindent with TAB
vmap("<S-Tab>", "mm<`m:<C-U>exec 'normal '.&shiftwidth.'h'<CR>mmgv`m");
vmap("<Tab>", "mm>`m:<C-U>exec 'normal '.&shiftwidth.'l'<CR>mmgv`m");

-- Remaps
local Remap = require("nkoporec.keymap")
local nnoremap = Remap.nnoremap

require('telescope').setup{
  pickers = {
    find_files = {
      theme = "ivy",
      disable_devicons = true
    },
    grep_string = {
      theme = "ivy",
      disable_devicons = true
    },
    live_grep = {
      theme = "ivy",
      disable_devicons = true
    },
    buffers = {
      theme = "ivy",
      disable_devicons = true
    },
    git_branches = {
      theme = "ivy",
      disable_devicons = true
    }
  },
}

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

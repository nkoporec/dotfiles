-- Leader key -> " "
--
-- In general, it's a good idea to set this early in your config, because otherwise
-- if you have any mappings you set BEFORE doing this, they will be set to the OLD
-- leader.
vim.g.mapleader = " "

-- I set some global variables to use as configuration throughout my config.
-- These don't have any special meaning.
vim.g.snippets = "luasnip"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("nkoporec.lazy")
require("nkoporec.disable_builtin")
require("nkoporec.keymap")
require("nkoporec.set")

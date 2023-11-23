vim.opt.termguicolors = true

require("colorbuddy").colorscheme "hybrid"
require("colorizer").setup()

local Color, colors, Group, groups, styles = require('colorbuddy').setup()

Color.new('white', '#b1b8b8');

-- Custom colors 
Color.new('white', '#b1b8b8');
Color.new("purple", '#b294bb');
Color.new("gold", '#f0c674');
Color.new("aqua", '#8abeb7');
Color.new("blue", '#73a6ba');
Color.new("green", '#749590');

--
--
Group.new("@variable", colors.white);
Group.new("@punctuation.bracket", colors.white);
Group.new("@constructor", colors.purple);
Group.new("@keyword", colors.gold);
Group.new("@function", colors.aqua);
Group.new("@field", colors.white);
Group.new("@function.macro", colors.blue);
Group.new("@namespace", colors.blue);

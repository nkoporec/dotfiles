local Remap = require("nkoporec.keymap")
local nnoremap = Remap.nnoremap

local dap = require('dap')
local dapui = require('dapui')

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { '/Users/nkoporec/Downloads/vscode-php-debug/out/phpDebug.js' }
}

-- Defaults to DDEV config.
dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9003,
    log = true,
    stopOnEntry = true,
    serverSourceRoot = '/var/www/html',
    localSourceRoot = '${workspaceFolder}',
    xdebugSettings = {
      max_children = 512,
      max_data = 1024,
      max_depth = 4,
      extended_properties = 1,
    },
  }
}

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7") == 1,
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        "breakpoints",
        "stacks",
        "scopes"
      },
      size = 60, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "↻",
      terminate = "□",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})

-- UI stuff
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

-- Keybindings
nnoremap("<F5>", ":lua require'dap'.continue()<CR>:lua require'dapui'.open()<CR>")
nnoremap("<F6>", ":lua require'dap'.terminate()<CR>:lua require'dapui'.close()<CR>")
nnoremap("<leader>@", ":lua require'dap'.toggle_breakpoint()<CR>")
nnoremap("<leader>n", ":lua require'dap'.step_over()<CR>")
nnoremap("<leader>^", ":lua require'dap'.clear_breakpoints()<CR>")
nnoremap("<leader>dr", ":lua require'dap'.repl.open()<CR>")

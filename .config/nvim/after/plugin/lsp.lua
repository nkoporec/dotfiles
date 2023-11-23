local Remap = require("nkoporec.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	path = "[Path]",
}

cmp.setup({
	snippet = {
		expand = function(args)
			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Enter>"] = cmp.mapping.complete(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true })
	}),

	sources = {
		{ name = "nvim_lsp" },

		-- For luasnip user.
		{ name = "luasnip" },

		-- For ultisnips user.
		-- { name = 'ultisnips' },

		{ name = "buffer" },
	},
    completion = {completeopt = 'menu,menuone,noinsert'},
})

-- @todo Make it pretty
require("lspconfig").intelephense.setup{autostart = true, filetypes = {"php", "module", "theme", "inc"}, settings = { intelephense = { files = { associations = { "*.module","*.inc","*.theme","*.php"}}}}}

require("lspconfig").tsserver.setup({
    autostart = true,
})

require("lspconfig").svelte.setup({
    autostart = true,
})

require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

require("lspconfig").cssls.setup({
    autostart = true,
})

require("lspconfig").rust_analyzer.setup({
    autostart = true,
})

-- Keymaps
nnoremap("gd", function() vim.lsp.buf.definition() end)
nnoremap("gh", function() vim.lsp.buf.hover() end)
nnoremap("gf", function() vim.lsp.buf.format() end)
nnoremap("ga", function() vim.lsp.buf.code_action() end)
nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
nnoremap("[d", function() vim.diagnostic.goto_next() end)
nnoremap("]d", function() vim.diagnostic.goto_prev() end)
nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)

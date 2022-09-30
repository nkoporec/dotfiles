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
local lspkind = require("lspkind")
 
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

	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			vim_item.menu = menu
			return vim_item
		end,
	},

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

require("lspconfig").cssls.setup({
    autostart = true,
})

require("lspconfig").gopls.setup({
    autostart = true,
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

require("lspconfig").rust_analyzer.setup({})

-- Keymaps
nnoremap("gd", function() vim.lsp.buf.definition() end)
nnoremap("gh", function() vim.lsp.buf.hover() end)
nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
nnoremap("[d", function() vim.diagnostic.goto_next() end)
nnoremap("]d", function() vim.diagnostic.goto_prev() end)
nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)

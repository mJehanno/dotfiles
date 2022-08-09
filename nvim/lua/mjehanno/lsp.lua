require('lspconfig').gopls.setup{
	cmd = {'gopls'},
  	settings = {
    		gopls = {
      			analyses = {
        			nilness = true,
        			unusedparams = true,
        			unusedwrite = true,
        			useany = true,
      			},
      			experimentalPostfixCompletions = true,
      			gofumpt = true,
      			staticcheck = true,
      			usePlaceholders = true,
    		},
  	},
	on_attach = function() 
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, {buffer=0})
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set("n", "<leader>c", vim.lsp.buf.code_action, {buffer=0})
    --vim.keymap.set("n", "<leader>c", vim.diagnosis.go_next, {buffer=0})
    --vim.keymap.set("n", "<leader>c", vim.diagnosis.go_prev, {buffer=0})
  end,
}
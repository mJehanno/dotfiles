require("mjehanno")
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Autocmd for gitlens like
--vim.cmd([[autocmd BufEnter * EnableBlameLine]]) -- disabled cause it takes too much memory

-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "packer")
if not status_ok then
  return
end

-- lsp config  TODO: find a way to move this part in another file (lua module ???)
on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, {buffer=0})
    vim.keymap.set("n", "gR", vim.lsp.buf.implementation, {buffer=0})
    vim.keymap.set("n", "gIc", vim.lsp.buf.incoming_calls, {buffer=0})
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set("n", "<leader>c", vim.lsp.buf.code_action, {buffer=0})
    vim.keymap.set("n", "<space>gn", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "<space>gp", vim.diagnostic.goto_prev, {buffer=0})
    	if client.server_capabilities.document_formatting then
		vim.cmd([[
			augroup formatting
				autocmd! * <buffer>
				autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
				autocmd BufWritePre <buffer> lua OrganizeImports(1000)
			augroup END
		]])
	end

	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.document_highlight then
		vim.cmd([[
			augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]])
	end
end,


-- Lua LSP
require('lspconfig').sumneko_lua.setup{
	cmd = {'lua-language-server'},
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  },
	on_attach=on_attach
}

local util = require "lspconfig/util"

-- Golang LSP
require('lspconfig').gopls.setup{
  filetypes = {"go", "gomod"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
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
           completeUnimported = true,
   		},
  },
  on_attach = on_attach
}

require'lspconfig'.golangci_lint_ls.setup{
  cmd = { "golangci-lint-langserver" },
  filetypes = { "go", "gomod" },
  init_options= {
    command = { "golangci-lint", "run", "--out-format", "json" }
  },
  root_dir = util.root_pattern("go.mod", ".git")
}


-- Rust LSP
require('lspconfig').rls.setup{
  cmd = {'rls'},
  on_attach = on_attach
}

-- Flutter LSP
require("flutter-tools").setup{} -- use defaults

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true
  },
}



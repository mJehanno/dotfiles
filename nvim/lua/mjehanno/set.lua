vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

require("catppuccin").setup()
-- vim personnal flavor
vim.cmd [[
  set termguicolors
  colorscheme catppucin
  set background=dark
  ]]

vim.cmd [[
  set number relativenumber
  set nu rnu
  ]]
vim.cmd [[set laststatus=2]]
vim.cmd [[set clipboard+=unnamedplus]]

-- golang highlight
vim.cmd [[let g:go_highlight_functions = 1]]
vim.cmd [[let g:go_highlight_function_parameters = 1]]
vim.cmd [[let g:go_highlight_function_calls = 1]]
vim.cmd [[let g:go_highlight_types = 1]]
vim.cmd [[let g:go_highlight_fields = 1]]
vim.cmd [[let g:go_highlight_variable_declarations = 1]]
vim.cmd [[let g:go_highlight_variable_assignments = 1]]
vim.cmd [[let g:go_highlight_extra_types = 1]]
vim.opt.updatetime = 750
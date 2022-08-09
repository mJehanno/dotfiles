require("mjehanno.set")
require("mjehanno.cmp")
require("mjehanno.lsp")
require("mjehanno.packer")
require("mjehanno.mason")
require("mjehanno.keymap")
require("mjehanno.lualine")
require("mjehanno.telescope")

local augroup = vim.api.nvim_create_augroup
mjehannoGroup = augroup('mjehanno', {})

vim.keymap.set("n","<C-n>t", "<cmd>NERDTreeToggle<cr>", {buffer=0, remap=true}) 
vim.keymap.set("n","<space>ff", "<cmd>Telescope find_files<cr>", {buffer=0})
vim.keymap.set("n","<space>lg", "<cmd>Telescope live_grep<cr>", {buffer=0})
vim.keymap.set("n","<space>gs", "<cmd>Telescope grep_string<cr>", {buffer=0})
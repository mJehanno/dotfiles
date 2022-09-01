require("mjehanno.set")
require("mjehanno.cmp")
require("mjehanno.packer")
require("mjehanno.mason")
require("mjehanno.keymap")
require("mjehanno.lualine")
require("mjehanno.telescope")
require("mjehanno.sessions")

local augroup = vim.api.nvim_create_augroup
mjehannoGroup = augroup('mjehanno', {})
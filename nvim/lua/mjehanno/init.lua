require("mjehanno.cmp")
require("mjehanno.packer")
require("mjehanno.mason")
require("mjehanno.lualine")
require("mjehanno.telescope")
require("mjehanno.keymap")
require("mjehanno.set")
require("mjehanno.barbar")
--require("mjehanno.sessions")
require("mjehanno.neogit")
--require("mjehanno.shade")
require("mjehanno.lua-dev")

local augroup = vim.api.nvim_create_augroup
mjehannoGroup = augroup('mjehanno', {})



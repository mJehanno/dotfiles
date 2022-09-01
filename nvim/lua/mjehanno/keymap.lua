function greppy()
  vim.ui.input({prompt="search pattern to grep on ? \n"}, function (input)
    return require("telescope.builtin").grep_string({ search = input})
  end)
end



vim.keymap.set("n","<C-n>t", "<cmd>NERDTreeToggle<cr>")
vim.keymap.set("n","<space>ff","<cmd>Telescope find_files<cr>")
vim.keymap.set("n","<space>lg","<cmd>Telescope live_grep<cr>")
vim.keymap.set("n","<space>gss", greppy, {desc='telescope grep_string method with user input'})
vim.keymap.set({"n","i"},"<Down>", "<Nop>")
vim.keymap.set({"n","i"},"<Up>", "<Nop>")
vim.keymap.set({"n","i"},"<Left>", "<Nop>")
vim.keymap.set({"n","i"},"<Right>", "<Nop>")


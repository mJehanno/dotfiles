local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nnoremap= bind("Down")
M.nnoremap= bind("Left")
M.nnoremap= bind("Right")
M.nnoremap= bind("Up")

--M.nnoremap = bind("F7", :call vimterm#toggle())

return M
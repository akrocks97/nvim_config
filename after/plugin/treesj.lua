local tsj = require('treesj')

-- For use default preset and it work with dot
vim.keymap.set('n', '<leader>m', tsj.toggle)
-- For extending default preset with `recursive = true`, but this doesn't work with dot
vim.keymap.set('n', '<leader>M', function()
    tsj.toggle({ split = { recursive = true } })
end)

tsj.setup()

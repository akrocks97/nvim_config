local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", '<leader>ts', builtin.treesitter, {})
vim.keymap.set("n", '<leader>lg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', 'tl', builtin.buffers, {})

function search_word_and_populate_quickfix()
    local word_under_cursor = vim.fn.expand("<cword>")
    print("Word under cursor is", word_under_cursor)
    if word_under_cursor ~= "" then
        vim.cmd("vimgrep " .. word_under_cursor .. " % | copen")
    end
end

vim.keymap.set("n", "<leader>gw", ":lua search_word_and_populate_quickfix()<CR>", { noremap = true, silent = true })

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  },
  defaults = {
    layout_config = {
      vertical = { width = 0.7 }
    },
    layout_strategy = 'vertical'
  }
}
  -- To get fzf loaded and working with telescope, you need to call
  -- load_extension, somewhere after setup function:
  require('telescope').load_extension('fzf')


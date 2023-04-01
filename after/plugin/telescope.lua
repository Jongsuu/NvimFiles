local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

local opts = { noremap = true, silent = true, expr = false }

vim.keymap.set('n', '<leader>pvs', ':vs | Telescope find_files<CR>', opts)

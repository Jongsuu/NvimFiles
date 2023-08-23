require("pau.remap")
require("pau.set")
require("pau.packer")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local PauGroup = augroup('Pau', {})

local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- Autocommand to remove all trailing whitespaces at the end of the line when writting the file
autocmd({ "BufWritePre" }, {
    group = PauGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Autocommand to format file based on lsp
autocmd({ "BufWritePre" }, {
    callback = function()
        vim.lsp.buf.format()
    end
})

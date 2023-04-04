require("pau.remap")
require("pau.set")
require("pau.packer")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local PauGroup = augroup('Pau', {})

-- Autocommand to remove all trailing whitespaces at the end of the line when writting the file
autocmd({"BufWritePre"}, {
    group = PauGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

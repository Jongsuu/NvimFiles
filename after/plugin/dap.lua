function GetCommand(plugin, command, parameters)
    return ":lua require'" .. plugin .. "'." .. command .. "(" .. parameters .. ")<CR>"
end

local opts = { noremap = true, silent = true, expr = false }

-- Debugging
vim.keymap.set("n", "<F5>", GetCommand("dap", "continue", ""), opts) -- Launch debug session or continue
vim.keymap.set("n", "<F10>", GetCommand("dap", "step_over", ""), opts) -- Step over
vim.keymap.set("n", "<F11>", GetCommand("dap", "step_into", ""), opts) -- Step into
vim.keymap.set("n", "<F12>", GetCommand("dap", "step_out", ""), opts) -- Step out
vim.keymap.set("n", "<leader>b", GetCommand("dap", "toggle_breakpoint", ""), opts)
vim.keymap.set("n", "<leader>B", GetCommand("dap", "set_breakpoint", "vim.fn.input('Breakpoint condition: ')"), opts)
vim.keymap.set("n", "<leader>lp", GetCommand("dap", "set_breakpoint", "nil, nil, vim.fn.input('Log point message: ')"), opts)
vim.keymap.set("n", "<leader>dr", GetCommand("dap", "repl.open", ""), opts)

require('dapui').setup()
require('nvim-dap-virtual-text').setup()

local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui-config"] = function()
    dapui.open()
end
dap.listeners.before.event_exited["dapui-config"] = function()
    dapui.close()
end

-- C# debugger
dap.adapters.coreclr = {
  type = 'executable',
  command = '/bin/netcoredbg',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}

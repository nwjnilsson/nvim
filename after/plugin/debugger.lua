local dap = require('dap')
dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "--interpreted=dap", "--eval-command", "set print pretty on" }
}

dap.configurations.c = {
        {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                args = {}, -- provide arguments if needed
                cwd = "${workspaceFolder}",
                stopAtBeginningOfMainSubprogram = false,
        },
        {
                name = "Select and attach to process",
                type = "gdb",
                request = "attach",
                program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                pid = function()
                        local name = vim.fn.input('Executable name (filter): ')
                        return require("dap.utils").pick_process({ filter = name })
                end,
                cwd = '${workspaceFolder}'
        },
        {
                name = 'Attach to gdbserver :1234',
                type = 'gdb',
                request = 'attach',
                target = 'localhost:1234',
                program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}'
        }
}

dap.configurations.cpp = dap.configurations.c

function DapREPL()
        dap.repl.open()
end

require('nvim-dap-virtual-text').setup {
        enabled = true,                     -- enable this plugin (the default)
        enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
        highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
        highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
        show_stop_reason = true,            -- show stop reason when stopped for exceptions
        commented = false,                  -- prefix virtual text with comment string
        only_first_definition = true,       -- only show virtual text at first definition (if there are multiple)
        all_references = false,             -- show virtual text on all all references of the variable (not only definitions)
        clear_on_continue = false,          -- clear virtual text on "continue" (might cause flickering when stepping)
}

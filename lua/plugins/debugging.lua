return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")

        local dapui = require("dapui")

        local dap_python = require("dap-python")

        dapui.setup()

        dap_python.setup()

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "<leader>dc", dap.continue, {})
    end,
    dependencies = {
        { "rcarriga/nvim-dap-ui",        dependencies = { "nvim-neotest/nvim-nio" } },
        { "mfussenegger/nvim-dap-python" },
    },
}

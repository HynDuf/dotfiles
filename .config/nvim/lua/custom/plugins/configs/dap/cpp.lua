local dap = require "dap"

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    -- 💀 Adjust the path to your executable
    command = "/home/hynduf/.local/app/vscode-codelldb/extension/adapter/codelldb",
    args = { "--port", "${port}" },

    -- On windows you may have to uncomment this:
    -- detached = false,
  },
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = true,
  },
}

dap.configurations.c = dap.configurations.cpp

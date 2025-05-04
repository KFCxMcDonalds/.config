return {
  -- how to use?
  -- 1. DIInstall <language debugger>
  -- 2. dap configuration
  -- 3. in conda: conda install debugpy
  -- dap
  {
    "mfussenegger/nvim-dap",
    init = function()
      local dap = require("dap")
      -- breakpoint symbols
      vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "©️", texthl = "", linehl = "", numhl = "" })
      --vim.fn.sign_define('DapStopped', {text = '🔸', texthl = '', linehl = '', numhl = ''})
      vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })

      ------------
      -- python --
      ------------
      -- conda: ML
      dap.adapters.ML = {
        type = "executable",
        command = "/Users/liwenwu/opt/miniconda3/envs/ML/bin/python",
        args = { "-m", "debugpy.adapter" },
      }
      dap.configurations.python = dap.configurations.python or {}
      table.insert(dap.configurations.python, {
        type = "ML",
        request = "launch",
        name = "Launch file (ML)",
        program = "${file}",
        pythonPath = function()
          return "/Users/liwenwu/opt/miniconda3/envs/ML/bin/python"
        end,
      })

    end,
  },

  -- dap ui
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    init = function()
      -- combine dap ui with events
      local dap, dapui, virtualText = require("dap"), require("dapui"), require("nvim-dap-virtual-text")
      virtualText.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
        vim.api.nvim_command("DapVirtualTextEnable")
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        vim.api.nvim_command("DapVirtualTextDisable")
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        vim.api.nvim_command("DapVirtualTextDisable")
        dapui.close()
      end
      dap.listeners.before.disconnect["dapui_config"] = function()
        vim.api.nvim_command("DapVirtualTextDisable")
        dapui.close()
      end
      -- default terminal layout location
      -- dap.defaults.fallback.terminal_win_cmd = 'vsplit new'
    end,
  },

  -- help us install several debuggers
  { "ravenxrz/DAPInstall.nvim" },

  -- vitual text
  { "theHamsta/nvim-dap-virtual-text" },

  -- telescope-dap
  { "nvim-telescope/telescope-dap.nvim" },
}

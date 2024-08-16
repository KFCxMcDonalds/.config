-- change LSP keymaps
return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      clangd = function(_, opts)
        opts.capabilities.offsetEncoding = {"utf-16"}
      end,
      }
  },
  init = function()
    vim.g.autoformat = false
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- disable a keymap
    keys[#keys + 1] = { "K", false }
    -- change a keymap
    keys[#keys + 1] = { "<leader>k", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "hover", { buffer = 0 } }

    -- python interpreter
    local lspconfig = require("lspconfig")
    local util = require("lspconfig.util")
    lspconfig.pyright.setup({
      venv = util.env_loader,
      settings = {
        python = {
          pythonPath = '/Users/liwenwu/opt/miniconda3/envs/diffusion/bin/python'
        }
      }
    })
  end,
}

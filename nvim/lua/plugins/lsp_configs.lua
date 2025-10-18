-- change LSP keymaps
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Required.
      "mason-lspconfig.nvim",
    },
    init = function()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")

      vim.g.autoformat = false

      -- keymaps
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "<leader>ca", false, mode = "n" }
      keys[#keys + 1] = { "<leader>ca", false, mode = "v" }
      keys[#keys + 1] = { "[d", false, mode = "n" }
      keys[#keys + 1] = { "<leader>ca", false, mode = "v" }
      keys[#keys + 1] = { "[d", false }
      keys[#keys + 1] = { "]d", false }
      -- change a keymap
      --      keys[#keys + 1] = { "<leader>k", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "lsp: hover", { buffer = 0 } }

      -- python interpreter
      lspconfig.pyright.setup({
        venv = util.env_loader,
        settings = {
          python = {
            pythonPath = "/Users/liwenwu/opt/miniconda3/envs/diffusion/bin/python",
          },
        },
      })
    end,
    opts = {
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          local filetype = vim.bo[bufnr].filetype
          -- indent
          local indent_size = ({
            lua = 2,
            yaml = 2,
            json = 2,
            html = 2,
            tmpl = 2,
            go = 4,
            python = 4,
          })[filetype] or 4

          vim.bo[bufnr].tabstop = indent_size
          vim.bo[bufnr].shiftwidth = indent_size
          vim.bo[bufnr].softtabstop = indent_size
        end
      end,
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
      },
      servers = {
        -- lua_ls
        lua_ls = {
          settings = {
            Lua = {
              format = {
                enable = true,
                defaultConfig = {
                  intent_style = "space",
                  intent_size = "2",
                },
              },
            },
          },
        },
        -- gopls
        gopls = {
          settings = {
            gopls = {
              formatting = {
                gofumpt = true,
                organize = true,
              },
              imports = {
                autoimport = true,
                gofumpt = true,
              },
            },
          },
        },
      },
    },
  },

  -- conform: formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd" },
        gotmpl = { "prettierd" },
        -- go = { "goimports", "gofumpt" },
        markdown = { "prettier" },
      },
      formatters = {
        gofumpt = {
          prepend_args = { "-extra" },
        },
      },
    },
  },

  -- typescript-tools
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        complete_function_calls = true,
        include_completions_with_insert_text = true,
        preferences = {
          importModulesSpecifierPreference = "non-relative",
        },
      },
    },
  },

  -- nvim-lint: linter
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        go = { "golangcilint" },
      },
      linters = {
        golangcilint = {
          args = {
            "run",
            "--out-format=json",
            "--disable-all",
            "--enable=errcheck",
            "--enable=staticcheck",
            "--enable=stylecheck",
            "--enable=revive",
            "--disable=typecheck",
          },
        },
      },
    },
  },
}

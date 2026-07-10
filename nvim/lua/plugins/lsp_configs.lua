-- change LSP keymaps
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-lspconfig.nvim",
    },
    event = { "BufReadPre", "BufNewFile" }, -- 添加延迟加载
    init = function()
      vim.g.autoformat = false
    end,
    opts = {
      -- 禁用和修改按键的新方式
      servers = {
        -- 全局按键配置
        ['*'] = {
          keys = {
            -- 禁用默认按键
            { "K", false },
            { "<leader>ca", false, mode = { "n", "v" } },
            { "[d", false },
            { "]d", false },
            -- 如果要添加新按键，在这里添加
            -- { "<leader>k", vim.lsp.buf.hover, desc = "LSP: Hover" },
          },
        },
        
        -- Python - 只在打开 Python 文件时加载
        pyright = {
          filetypes = { "python" }, -- 关键！只在 Python 文件时启动
          settings = {
            python = {
              pythonPath = "/Users/liwenwu/opt/miniconda3/envs/diffusion/bin/python",
            },
          },
        },
        
        -- Lua
        lua_ls = {
          settings = {
            Lua = {
              format = {
                enable = true,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                },
              },
            },
          },
        },
        
        -- Go
        gopls = {
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          settings = {
            gopls = {
              env = {
                TMPDIR = "/tmp",
                GOCACHE = "/tmp/go-cache",
              },
              formatting = {
                gofumpt = true,
              },
              ["ui.inlayhint.hints"] = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        },
      },
      
      -- 通用 on_attach
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          local filetype = vim.bo[bufnr].filetype
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
    },
  },
  
  -- Mason 按需加载
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
  },
  
  -- conform: formatter
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- 只在保存前加载
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd" },
        gotmpl = { "prettierd" },
        markdown = { "prettier" },
      },
      formatters = {
        gofumpt = {
          prepend_args = { "-extra" },
        },
      },
    },
  },
  
  -- typescript-tools - 只在 TS/JS 文件时加载
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" }, -- 关键！
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
  
  -- nvim-lint: linter - 只在保存后运行
  {
    "mfussenegger/nvim-lint",
    event = "BufWritePost", -- 关键！只在保存后检查
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
}-- change LSP keymaps

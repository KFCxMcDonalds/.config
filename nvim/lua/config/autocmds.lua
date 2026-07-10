-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.spell = false
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "lua",
        "yaml",
        "json",
        "yaml",
    },
    callback = function()
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
        vim.bo.softtabstop = 2
    end,
})

-- filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.tmpl",
  callback = function()
    vim.bo.filetype = "html"
  end,
})

-- go doc
vim.api.nvim_create_user_command('GoDoc', function(opts)
  -- 执行命令并捕获输出
  local output = vim.fn.system('go doc ' .. opts.args)
  
  -- 创建新的分割窗口
  vim.cmd('20new') -- 或用 'new' 水平分割
  
  -- 设置缓冲区选项
  vim.bo.buftype = 'nofile'
  vim.bo.bufhidden = 'wipe'
  vim.bo.swapfile = false
  vim.bo.filetype = 'godoc'
  
  -- 插入输出内容
  local lines = vim.split(output, '\n')
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  
  -- 设置为只读
  vim.bo.modifiable = false
  vim.bo.readonly = true
end, { nargs = 1, complete = 'file', desc = 'Show go doc in buffer' })


-- neorg
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "norg", "neorg" },
  callback = function()
    if pcall(vim.treesitter.start) then
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- formatconfig
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

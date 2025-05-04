return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require('lspsaga').setup({
      lightbulb = {
        enable = false,
      }
    })
  end,
}

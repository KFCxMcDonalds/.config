return {
  -- -- lucario
  -- { "raphamorim/lucario" };
  --

  -- One Dark
  {
    "navarasu/onedark.nvim",
    lazy = false,
    config = function()
      require("onedark").setup({
        style = "warm",
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },

}

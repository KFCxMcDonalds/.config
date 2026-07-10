return {
  "lervag/vimtex",
  lazy = true,     -- we don't want to lazy load VimTeX
  ft = "tex",  -- load VimTeX for .tex files
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "zathura"
  end
}

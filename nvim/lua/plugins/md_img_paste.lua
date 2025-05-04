return {
  "img-paste-devs/img-paste.vim",
  lazy = true,
  ft = {
    "markdown",
    "tex",
  },
  keys = { { "<leader>p", "<cmd>call mdip#MarkdownClipboardImage()<CR>", desc = "markdown paste images form clipboard", ft = {"markdown", "tex"}} },
  init = function()
    vim.g.mdip_imgdir = "attachments"
  end,
}

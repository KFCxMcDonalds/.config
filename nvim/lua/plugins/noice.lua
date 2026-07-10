return {
  "folke/noice.nvim",
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline",
    },
    views = {
      notify = {
        backend = "notify",
        fallback = "mini",
        format = "notify",
        replace = true,
        merge = false,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = false,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true,
    },
  },
}

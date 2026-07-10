return {
  "allaman/emoji.nvim",
  optional = true,
  version = "1.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ibhagwan/fzf-lua",
  },
  opts = {
    enable_cmp_integration = true,
  },
  config = function(_, opts)
    require("emoji").setup(opts)
    require("fzf-lua").register_ui_select()
  end,
}

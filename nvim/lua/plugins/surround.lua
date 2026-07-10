return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  opts = {
    keymaps = {
      -- normal mode
      insert          = "<C-g>s",  -- insert mode: add surround
      insert_line     = "<C-g>S",  -- insert mode: add surround on new lines
      normal          = "ys",      -- ys{motion}{char}  e.g. ysiw" ysa{(
      normal_cur      = "yss",     -- yss{char}         surround entire line
      normal_line     = "yS",      -- yS{motion}{char}  surround on new lines
      normal_cur_line = "ySS",     -- ySS{char}         surround line on new lines
      visual          = "S",       -- visual: S{char}
      visual_line     = "gS",      -- visual line: gS{char}
      delete          = "ds",      -- ds{char}          delete surround
      change          = "cs",      -- cs{old}{new}      change surround
      change_line     = "cS",      -- cS{old}{new}      change surround to new lines
    },
  },
}

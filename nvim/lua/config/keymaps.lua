-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = {
  noremap = true,
  silent = true,
}
local mode_niv = { "n", "i", "v" }
local mode_ni = { "n", "i" }
local mode_iv = {"i", "v"}
local mode_i = { "i" }
local mode_n = { "n" }
local mode_v = { "v" }

-- unbinds --
keymap.del(mode_niv, "<A-j>")
keymap.del(mode_niv, "<A-k>")

-- keymaps --
-- move
keymap.set(mode_n, "<S-j>", "<cmd>m +1<cr>", { desc = "move down", remap = true })
keymap.set(mode_n, "<S-k>", "<cmd>m -2<cr>", { desc = "move up", remap = true })

-- input method change
keymap.set(mode_ni, "<Esc>", "<Esc>:silent !im-select com.apple.keylayout.ABC<cr>", { remap = true, silent = true})

-- markdown
keymap.set(mode_n, "<leader>mp", ":silent !osascript /Users/liwenwu/.config/nvim/scripts/mkdp_windowSplit.applescript<cr>:MarkdownPreview<cr>", { desc = "markdown preview", remap = true, silent = true})

-- obsidian
keymap.set(mode_n, "<leader>oo", "<cmd>ObsidianOpen<cr>", {desc = "ob: open current buffer", remap = true, silent = true})
keymap.set(mode_n, "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", {desc = "ob: quick switch", remap = true, silent = true})
keymap.set(mode_n, "<leader>oS", "<cmd>ObsidianSearch<cr>", {desc = "ob: search", remap = true, silent = true})
keymap.set(mode_n, "<leader>ot", "<cmd>ObsidianToday<cr>", {desc = "ob: today", remap = true, silent = true})

keymap.set(mode_n, "<leader>of", "<cmd>e ~/Files/Notes/<cr>", {desc = "ob: open folder", remap = true, silent = true})

-- snips: see plugins/luaSnips_config.lua
keymap.set(mode_iv, "<C-u>", "<cmd>lua require('luasnip.extras.select_choice')()<cr>", { desc = "toggle selections of current snip", remap = true, silent = true})

-- dap-debug
keymap.set(mode_n, "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", {desc = "debug: add breakpoint", remap = true, silent = true})
keymap.set(mode_n, "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", {desc = "debug: add condition breakpoint", remap = true, silent = true})
keymap.set(mode_n, "<F4>", "<cmd>lua require'dap'.terminate()<cr>", {desc = "debug: terminate debug", remap = true, silent = true})
keymap.set(mode_n, "<F5>", "<cmd>lua require'dap'.continue()<cr>", {desc = "debug: start/continue", remap = true, silent = true})
keymap.set(mode_n, "<F6>", "<cmd>lua require'dap'.step_over()<cr>", {desc = "debug: step over", remap = true, silent = true})
keymap.set(mode_n, "<F7>", "<cmd>lua require'dap'.step_into()<cr>", {desc = "debug: step into", remap = true, silent = true})
keymap.set(mode_n, "<F8>", "<cmd>lua require'dap'.step_out()<cr>", {desc = "debug: step out", remap = true, silent = true})
keymap.set(mode_n, "<F9>", "<cmd>lua require'dap'.run_to_cursor()<cr>", {desc = "debug: run to cursor", remap = true, silent = true})
keymap.set(mode_n, "<F10>", "<cmd>lua require'dap'.run_last()<cr>", {desc = "debug: run with last configs", remap = true, silent = true})

-- smoji
keymap.set(mode_n, "<Leader><Leader>te", "<CMD>Telescope emoji<CR>", {desc = "Telescope emoji"})
keymap.set(mode_n, "<Leader><Leader>e", "<CMD>InsertEmoji<CR>", {desc = "insert emoji"})

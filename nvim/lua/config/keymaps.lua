-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = {
  noremap = true,
  silent = true,
}
local mode_niv = { "n", "i", "v" }
local mode_nv = { "n", "v" }
local mode_ni = { "n", "i" }
local mode_iv = {"i", "v"}
local mode_i = { "i" }
local mode_n = { "n" }
local mode_v = { "v" }

-- unbinds --
keymap.del(mode_niv, "<A-j>")
keymap.del(mode_niv, "<A-k>")

-- keymaps --
-- vim-builtin
keymap.set(mode_iv, ";;", "<Esc>", { desc = 'esc', remap = false})
keymap.set(mode_n, "zz", "za", { desc = 'Toggle fold under cursor', remap = false})
keymap.set(mode_n, "za", "zz", { desc = 'Center this line', remap = false})
-- buffer
keymap.set(mode_n, "<leader>b>", "<cmd>BufferLineMoveNext<cr>", {desc = "move buffer to the right"})
keymap.set(mode_n, "<leader>b<", "<cmd>BufferLineMovePrev<cr>", {desc = "move buffer to the left"})
keymap.set(mode_n, "<leader>sx", ':let @/=""<cr>', {desc = "clear search pattern"})

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

-- emoji
keymap.set(mode_n, "<Leader><Leader>e", "<CMD>InsertEmoji<CR>", {desc = "insert emoji"})

-- lspsaga
keymap.set(mode_n, "<leader>si", "<cmd>Lspsaga incoming_calls ++normal<cr>", {desc = "lspsaga: incoming calls ++normal [callhierarchy]"})
keymap.set(mode_n, "<leader>sif", "<cmd>Lspsaga incoming_calls<cr>", {desc = "lspsaga: incoming calls ++float [callhierarchy]"})
keymap.set(mode_nv, "<leader>ca", "<cmd>Lspsaga code_action<cr>", {desc = "lspsaga: code action"}) -- code action of lspconfig is disabled instead. see: plugins/lspconfig.lua
keymap.set(mode_n, "<leader>pd", "<cmd>Lspsaga peek_definition<cr>", {desc = "lspsaga: peek definition"})
keymap.set(mode_n, "<leader>pt", "<cmd>Lspsaga peek_type_definition<cr>", {desc = "lspsaga: peek type definition"})
keymap.set(mode_n, "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {desc = "lspsaga: prev diagnostic"})
keymap.set(mode_n, "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", {desc = "lspsaga: next diagnostic"})
keymap.set(mode_n, "<leader>k", "<cmd>Lspsaga hover_doc ++keep<cr>", {desc = "lspsaga: doc ++keep"})
keymap.set(mode_n, "<leader>h", "<cmd>Lspsaga hover_doc<cr>", {desc = "lspsaga: hover doc"})



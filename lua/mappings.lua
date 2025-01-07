require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "kj", "<ESC>")
map("n", "<Leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
map("n", "<Leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

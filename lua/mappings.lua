require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Additional Telescope
map("n", "<leader>fl","<cmd>Telescope flutter commands<CR>", { desc = "telescope flutter commands" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua
local nomap = vim.keymap.del
--nomap("n", "<leader>n")
--nomap("n", "<leader>rn")

--nomap("i", "<C-b>")
--nomap("i", "<C-e>")
--nomap("i", "<C-h>")
--nomap("i", "<C-l>")
--nomap("i", "<C-j>")
--nomap("i", "<C-k>")

--omap("n", "<leader>wk")
--nomap("n", "<leader>wK")

--nomap("n", "<leader>v")
--nomap("n", "<leader>h")
--nomap({ "n", "t" }, "<A-i>")
--nomap({ "n", "t" }, "<A-h>")
--nomap({ "n", "t" }, "<A-v>")

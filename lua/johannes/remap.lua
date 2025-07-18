vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.update)
-- Move marked text up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Find next/previous pattern and center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move to beginning/end of line
vim.keymap.set({ "n", "v" }, "H", "_")
vim.keymap.set({ "n", "v" }, "L", "$")

-- Switch window
vim.keymap.set("n", "<A-L>", "<C-w>l")
vim.keymap.set("n", "<A-K>", "<C-w>k")
vim.keymap.set("n", "<A-J>", "<C-w>j")
vim.keymap.set("n", "<A-H>", "<C-w>h")

-- Open terminal
vim.keymap.set("n", "<A-t>", "<cmd>terminal<CR>i")
-- Leave terminal
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })

-- Jump back to previous buffer
vim.keymap.set("n", "<leader>ep", "<cmd>e#<CR>")

-- Cycle tabs
vim.keymap.set("n", "<PageDown>", "gt")
vim.keymap.set("n", "<PageUp>", "gT")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- I might do this on regular keyboards
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Navigation between quickfix items and location list items
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- add a line as padding below/above line without moving cursor
vim.keymap.set("n", "<leader>oj", ":call append('.', '')<CR>")
vim.keymap.set("n", "<leader>ok", ":call append(line('.')-1, '')<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

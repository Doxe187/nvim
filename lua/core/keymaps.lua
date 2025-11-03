-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- Allgemeine Keymaps
keymap.set("i", "jk", "<ESC>", { desc = "Escape mit jk" })
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Speichern" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Schließen" })

-- Fenster-Navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Fenster links" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Fenster unten" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Fenster oben" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Fenster rechts" })

-- Fenster-Größe
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Höhe erhöhen" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Höhe verringern" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Breite verringern" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Breite erhöhen" })

-- Buffer-Navigation
keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Nächster Buffer" })
keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Vorheriger Buffer" })

-- Besseres Einfügen
keymap.set("v", "p", '"_dP', { desc = "Paste ohne zu überschreiben" })

-- Nvim-Tree
keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Telescope
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Grep text" })
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help tags" })

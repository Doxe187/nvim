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
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Buffer schließen" })
keymap.set("n", "<leader>bD", ":bdelete!<CR>", { desc = "Buffer erzwungen schließen" })

-- Besseres Einfügen
keymap.set("v", "p", '"_dP', { desc = "Paste ohne zu überschreiben" })

-- Text verschieben (Visual Mode)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Zeilen nach unten verschieben" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Zeilen nach oben verschieben" })

-- Besseres Indenting
keymap.set("v", "<", "<gv", { desc = "Einrücken nach links" })
keymap.set("v", ">", ">gv", { desc = "Einrücken nach rechts" })

-- Zentrierte Navigation
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Halbe Seite runter (zentriert)" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Halbe Seite hoch (zentriert)" })
keymap.set("n", "n", "nzzzv", { desc = "Nächste Suche (zentriert)" })
keymap.set("n", "N", "Nzzzv", { desc = "Vorherige Suche (zentriert)" })

-- Neo-tree
keymap.set("n", "<leader>n", ":Neotree toggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>e", ":Neotree focus<CR>", { desc = "Focus file explorer" })

-- Telescope
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Grep text" })
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Find help" })
keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Recent files" })
keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>", { desc = "Find string under cursor" })

# Neue Plugins - Übersicht

Diese Datei dokumentiert alle neu hinzugefügten Plugins und ihre Keybindings.

## 🔧 LSP & Autocompletion

### mason.nvim + mason-lspconfig.nvim
Automatische Installation von Language Servern.
- **Installierte Server**: lua_ls, pyright, ts_server, html, cssls, jsonls
- **Command**: `:Mason` - Öffnet Mason UI

### nvim-lspconfig
LSP-Konfiguration mit zahlreichen Keybindings:
- `gR` - LSP-Referenzen anzeigen
- `gD` - Zu Deklaration springen
- `gd` - Zu Definition springen
- `gi` - Implementierungen anzeigen
- `gt` - Type-Definitionen anzeigen
- `<leader>ca` - Code Actions anzeigen
- `<leader>rn` - Smart Rename
- `<leader>D` - Buffer Diagnostics
- `<leader>d` - Line Diagnostics
- `[d` / `]d` - Vorheriger/Nächster Diagnostic
- `K` - Dokumentation anzeigen
- `<leader>rs` - LSP neustarten

### nvim-cmp
Auto-Completion mit mehreren Quellen:
- `<C-k>` / `<C-j>` - Vorschlag navigation
- `<C-Space>` - Completion-Menü öffnen
- `<CR>` - Auswahl bestätigen
- `<Tab>` / `<S-Tab>` - Snippet navigation

## 📦 Git Integration

### gitsigns.nvim
Git-Änderungen in der Signcolumn:
- `]h` / `[h` - Nächster/Vorheriger Hunk
- `<leader>hs` - Stage Hunk
- `<leader>hr` - Reset Hunk
- `<leader>hS` - Stage Buffer
- `<leader>hu` - Undo Stage Hunk
- `<leader>hR` - Reset Buffer
- `<leader>hp` - Preview Hunk
- `<leader>hb` - Blame Line
- `<leader>hd` - Diff This

### lazygit.nvim
LazyGit-Integration:
- `<leader>gg` - LazyGit öffnen

## ✏️ Code Navigation & Editing

### nvim-autopairs
Automatisches Schließen von Klammern, Quotes, etc.
- Funktioniert automatisch beim Tippen

### Comment.nvim
Kommentieren mit Treesitter-Integration:
- `gcc` - Zeile kommentieren (Normal Mode)
- `gc` - Selection kommentieren (Visual Mode)
- `gbc` - Block-Kommentar (Normal Mode)
- `gb` - Block-Kommentar (Visual Mode)

### nvim-surround
Schnelles Bearbeiten von umschließenden Zeichen:
- `ys{motion}{char}` - Hinzufügen (z.B. `ysiw"` umschließt Wort mit ")
- `ds{char}` - Löschen (z.B. `ds"` entfernt ")
- `cs{target}{replacement}` - Ändern (z.B. `cs"'` ändert " zu ')

### trouble.nvim
Bessere Diagnostics-Liste:
- `<leader>xx` - Diagnostics (Trouble)
- `<leader>xX` - Buffer Diagnostics (Trouble)
- `<leader>cs` - Symbols (Trouble)
- `<leader>cl` - LSP Definitions/References (Trouble)
- `<leader>xL` - Location List (Trouble)
- `<leader>xQ` - Quickfix List (Trouble)

## 📑 Buffer & Tab Management

### bufferline.nvim
Visuelle Buffer-Tabs am oberen Rand:
- `<Tab>` - Nächster Buffer
- `<S-Tab>` - Vorheriger Buffer
- `<leader>bd` - Buffer schließen
- `<leader>bD` - Buffer erzwungen schließen

### which-key.nvim
Zeigt verfügbare Keybindings automatisch nach kurzer Verzögerung an:
- Drücke `<leader>` und warte 500ms
- Funktioniert mit allen Prefixen (g, z, [, ], etc.)

## 🔍 Search & Replace

### telescope-fzf-native.nvim
Schnellere Fuzzy-Suche für Telescope (automatisch integriert).

### spectre.nvim
Project-wide Search & Replace:
- `<leader>sr` - Replace in files öffnen
- `<leader>sw` - Aktuelles Wort suchen
- `<leader>sp` - In aktueller Datei suchen

## 🎨 Quality of Life

### indent-blankline.nvim
Indentation-Guides:
- Zeigt automatisch Einrückungslinien an
- Hebt aktuellen Scope hervor

### nvim-colorizer.lua
Farbvorschau für Hex-Codes:
- Zeigt automatisch Farben inline an (#FF0000, rgb(), etc.)

### todo-comments.nvim
Highlighting für TODO/FIXME/etc.:
- `]t` / `[t` - Nächster/Vorheriger TODO
- `<leader>ft` - Alle TODOs finden
- **Keywords**: TODO, FIXME, BUG, HACK, WARN, PERF, NOTE, TEST

## 📝 Zusätzliche Keybindings

### Erweiterte Telescope-Keybindings
- `<leader>fb` - Buffers durchsuchen
- `<leader>fh` - Help tags durchsuchen
- `<leader>fr` - Recent files
- `<leader>fc` - String unter Cursor finden

### Text-Manipulation
- `J` / `K` (Visual Mode) - Zeilen verschieben
- `<` / `>` (Visual Mode) - Besseres Indenting (bleibt in Visual Mode)

### Zentrierte Navigation
- `<C-d>` / `<C-u>` - Halbe Seite hoch/runter (zentriert)
- `n` / `N` - Suche navigation (zentriert)

### Nvim-Tree
- `<leader>e` - File Explorer fokussieren

## 🚀 Nächste Schritte

1. Neovim neu starten
2. Lazy.nvim installiert automatisch alle Plugins
3. Nach dem ersten Start: `:Mason` ausführen und warten bis alle LSPs installiert sind
4. Für LazyGit: `lazygit` muss separat installiert sein (optional)
5. Für telescope-fzf-native: `make` muss installiert sein

## 📚 Nützliche Commands

- `:Lazy` - Plugin-Manager öffnen
- `:Mason` - LSP-Manager öffnen
- `:LspInfo` - LSP-Status anzeigen
- `:checkhealth` - Konfiguration überprüfen
- `:TodoTelescope` - Alle TODOs anzeigen

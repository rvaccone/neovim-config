# Neovim Configuration

My personal Neovim configuration that focuses on intentionality and thoughtful design that reflects my current workflow values.

## Installation

### macOS

1. Install [Homebrew](https://brew.sh/)
2. Install Neovim and its dependencies

```bash
brew install neovim lua luarocks stylua ripgrep fd trash lazygit
```

3. Save your current Neovim configuration (optional)

```bash
mv ~/.config/nvim ~/.config/old-nvim
```

4. Clone the repository

```bash
git clone https://github.com/rvaccone/neovim-config.git ~/.config/nvim
```

## Configuration-specific features

- Language Server Protocol (LSP) support out of the box
- Automatically formats code on save
- Git integration without leaving Neovim
- Window management with easy access to all windows
- Beautiful Gruvbox theme and visual enhancements
- Thoughtful design and plugins

## Configuration-specific keymaps

Special Keys:

- `<leader>` = Spacebar
- `<cr>` = Enter/Return
- `<c-n>` = Control + n
- `<s-cr>` = Shift + Enter

Modes:

- Normal: Default mode (press `Esc` to enter)
- Insert: Text editing mode (press `i` to enter)
- Visual: Selection mode (press `v` to enter)
- Command: Command mode (press `:` to enter)

### Essential Navigation

| Keymap       | Action                 | Mode   | Category  |
| ------------ | ---------------------- | ------ | --------- |
| `<cr>`       | Quick jump anywhere    | Normal | Jump      |
| `<leader>sf` | Find files             | Normal | Search    |
| `<leader>sg` | Search in project      | Normal | Search    |
| `<leader>ss` | Search in current file | Normal | Search    |
| `<leader>sw` | Search current word    | Normal | Search    |
| `<leader>bo` | Browse open buffers    | Normal | Buffers   |
| `m1-9`       | Toggle bookmark        | Normal | Bookmarks |
| `dm1-9`      | Delete bookmark        | Normal | Bookmarks |
| `]1-9`       | Next bookmark          | Normal | Bookmarks |
| `[1-9`       | Previous bookmark      | Normal | Bookmarks |

### Window Management

| Keymap         | Action                      | Mode   | Category  |
| -------------- | --------------------------- | ------ | --------- |
| `<leader>0`    | Focus file tree             | Normal | File Tree |
| `<leader>nt`   | Toggle file tree            | Normal | File Tree |
| `<leader>1-9`  | Focus/create window         | Normal | Windows   |
| `<leader>q1-9` | Close window without saving | Normal | Windows   |
| `<leader>z1-9` | Close window with saving    | Normal | Windows   |
| `QQ`           | Quit session                | Normal | System    |

### Language Server Protocol (LSP)

| Keymap       | Action                | Mode   | Category |
| ------------ | --------------------- | ------ | -------- |
| `gd`         | Go to definition      | Normal | LSP      |
| `gD`         | Go to declaration     | Normal | LSP      |
| `gi`         | Go to implementation  | Normal | LSP      |
| `go`         | Go to type definition | Normal | LSP      |
| `gr`         | Show references       | Normal | LSP      |
| `K`          | Show documentation    | Normal | LSP      |
| `gs`         | Show signature help   | Normal | LSP      |
| `<leader>a`  | Code action           | Normal | LSP      |
| `<leader>rn` | Rename symbol         | Normal | LSP      |
| `<leader>lr` | Restart LSP           | Normal | LSP      |

### Text Manipulation

| Keymap       | Action                   | Mode           | Example                              |
| ------------ | ------------------------ | -------------- | ------------------------------------ |
| `gcc`        | Comment line             | Normal         | `gcc` - Comment current line         |
| `gc`         | Comment selection        | Normal, Visual | `gcip` - Comment paragraph           |
| `<leader>ya` | Copy buffer to clipboard | Normal         | `<leader>ya` - Copy entire file      |
| `ys`         | Add surround             | Normal         | `ysiw"` - Surround word with quotes  |
| `yss`        | Surround line            | Normal         | `yss)` - Surround line with ()       |
| `ySS`        | Surround line indent     | Normal         | `ySS{` - Surround with {} and indent |
| `cs`         | Change surround          | Normal         | `cs'"` - Change ' to "               |
| `ds`         | Delete surround          | Normal         | `ds"` - Delete surrounding quotes    |

**Surround Operators:**

- `(`, `)`, `b` - Parentheses
- `{`, `}`, `B` - Curly braces
- `[`, `]` - Square brackets
- `<`, `>` - Angle brackets
- `t` - HTML/JSX/TSX tags (e.g., `ysiwt<div>`)

### Code Assistance

| Keymap       | Action                    | Mode   | Category    |
| ------------ | ------------------------- | ------ | ----------- |
| `<c-n>`      | Next completion item      | Insert | Completion  |
| `<c-p>`      | Previous completion item  | Insert | Completion  |
| `<cr>`       | Accept completion         | Insert | Completion  |
| `<s-cr>`     | Abort completion          | Insert | Completion  |
| `<tab>`      | Accept in-line prediction | Insert | Completion  |
| `<leader>df` | Show & copy diagnostic    | Normal | Diagnostics |
| `<leader>dp` | Previous diagnostic       | Normal | Diagnostics |
| `<leader>dn` | Next diagnostic           | Normal | Diagnostics |

### Language Tools

| Keymap       | Action                  | Mode   | Category          |
| ------------ | ----------------------- | ------ | ----------------- |
| `<leader>im` | Add missing imports     | Normal | TypeScript        |
| `<leader>it` | Organize imports/Format | Normal | TypeScript/Python |

### Development Tools

| Keymap       | Action                 | Mode   | Category |
| ------------ | ---------------------- | ------ | -------- |
| `<leader>co` | Open quickfix          | Normal | Quickfix |
| `<leader>cq` | Close quickfix         | Normal | Quickfix |
| `<leader>cn` | Next quickfix item     | Normal | Quickfix |
| `<leader>cp` | Previous quickfix item | Normal | Quickfix |

### System Tools

| Keymap       | Action               | Mode   | Category |
| ------------ | -------------------- | ------ | -------- |
| `<leader>lg` | Open LazyGit         | Normal | Git      |
| `<leader>ln` | Open package manager | Normal | System   |
| `<leader>ho` | Search help docs     | Normal | Help     |

## Configuration Structure Overview

```lua
📁 ~/.config/nvim
├── 📁 lua/
│   ├── 📁 aggregators/        # Combines configuration files to ensure modularity
│   │   ├── 📄 keymaps.lua     # Loads all keymap configurations
│   │   └── 📄 plugins.lua     # Loads all plugin configurations
│   ├── 📁 keymaps/            # Organized keybinding configurations
│   ├── 📁 plugins/            # Organized plugin configurations
│   ├── 📄 lsp.lua             # Language server configurations
│   └── 📄 vim_settings.lua    # Core Neovim settings
├── 📁 spell/                  # Spell checking configuration
├── 📄 .gitignore              # Git ignore rules
├── 📄 lazy-lock.json          # Plugin version lockfile
├── 📄 stylua.toml             # Lua formatter configuration
└── 📄 init.lua                # Main configuration file
```

### Plugin Configuration Structure

Plugin configurations follow the format: `[GitHub username]#[repository].lua`
Example: `nvim-tree#nvim-tree.lua` for the nvim-tree plugin from nvim-tree organization

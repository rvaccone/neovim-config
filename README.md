# Neovim Configuration

My personal Neovim configuration that focuses on intentionality and thoughtful design that reflects my current workflow values.

## Installation

### macOS

1. Install [Homebrew](https://brew.sh/)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install Neovim and its dependencies

```bash
brew install neovim lua luarocks stylua ripgrep fd trash lazygit make
```

3. Install a better terminal emulator (optional)

I use both Ghostty ([download](https://ghostty.org/download)) and Warp ([download](https://app.warp.dev/get_warp?package=dmg)) terminal emulators for Neovim.

4. Install a Nerd Font (optional, but required for icons)

You can find a list of Nerd Fonts [here](https://www.nerdfonts.com/font-downloads). I use [JetBrains Mono](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip). You should set the font in your terminal after.

5. Save your current Neovim configuration (optional)

```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

6. Clone the repository

```bash
git clone https://github.com/rvaccone/neovim-config.git ~/.config/nvim
```

7. Remove the Supermaven plugin (optional)

```bash
rm ~/.config/nvim/lua/plugins/supermaven-inc#supermaven-nvim.lua
```

While I use [Supermaven](https://supermaven.com/)'s paid version, its free tier is excellent. Remove the plugin to avoid activation prompts until you're ready to try it out.

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

Quick links:

- [Help](#help-and-documentation)
- [Navigation](#navigation)
- [Mark Management](#mark-management)
- [Window Management](#window-management)
- [Language Server Protocol (LSP)](#language-server-protocol-lsp)
- [Text Manipulation](#text-manipulation)
- [Code Assistance](#code-assistance)
- [Language Tools](#language-tools)
- [Quickfix](#quickfix)
- [System Tools](#system-tools)

### Help

| Keymap       | Action                    | Mode   |
| ------------ | ------------------------- | ------ |
| `<leader>?`  | Show buffer-local keymaps | Normal |
| `<leader>ho` | Search help docs          | Normal |

### Navigation

| Keymap       | Action              | Mode   |
| ------------ | ------------------- | ------ |
| `<cr>`       | Quick jump anywhere | Normal |
| `<leader>ff` | Find files          | Normal |
| `<leader>fg` | Find with grep      | Normal |
| `<leader>fs` | Find in file        | Normal |
| `<leader>fw` | Find word           | Normal |
| `<leader>fb` | Find buffer         | Normal |

### Mark Management

| Keymap         | Action            | Mode   |
| -------------- | ----------------- | ------ |
| `m:`           | Preview mark      | Normal |
| `'` or `` ` `` | Show all marks    | Normal |
| `m1-9`         | Toggle bookmark   | Normal |
| `dm1-9`        | Delete bookmark   | Normal |
| `]1-9`         | Next bookmark     | Normal |
| `[1-9`         | Previous bookmark | Normal |

### Window Management

| Keymap         | Action                       | Mode   |
| -------------- | ---------------------------- | ------ |
| `<leader>0`    | Focus file tree              | Normal |
| `<leader>nt`   | Toggle file tree             | Normal |
| `-`            | Open file explorer           | Normal |
| `<leader>1-9`  | Focus/create window          | Normal |
| `<leader>v1-9` | Focus/create vertical window | Normal |
| `<leader>q1-9` | Close window without saving  | Normal |
| `<leader>z1-9` | Close window with saving     | Normal |
| `QQ`           | Quit session                 | Normal |

You can also use the `q` key to close the floating parent directory.

### Language Server Protocol (LSP)

| Keymap       | Action                | Mode   |
| ------------ | --------------------- | ------ |
| `gd`         | Go to definition      | Normal |
| `gD`         | Go to declaration     | Normal |
| `gi`         | Go to implementation  | Normal |
| `go`         | Go to type definition | Normal |
| `gr`         | Show references       | Normal |
| `K`          | Show documentation    | Normal |
| `gs`         | Show signature help   | Normal |
| `<leader>a`  | Code action           | Normal |
| `<leader>rn` | Rename symbol         | Normal |
| `<leader>lr` | Restart LSP           | Normal |

### Text Manipulation

| Keymap       | Action                    | Mode           | Example                                      |
| ------------ | ------------------------- | -------------- | -------------------------------------------- |
| `gcc`        | Comment line              | Normal         | `gcc` - Comment current line                 |
| `gc`         | Comment selection         | Normal, Visual | `gcip` - Comment paragraph                   |
| `<leader>ya` | Copy buffer to clipboard  | Normal         | `<leader>ya` - Copy entire file              |
| `ys`         | Add surround              | Normal         | `ysiw"` - Surround word with quotes          |
| `yss`        | Surround line             | Normal         | `yss)` - Surround line with ()               |
| `ySS`        | Surround line indent      | Normal         | `ySS{` - Surround with {} and indent         |
| `cs`         | Change surround           | Normal         | `cs'"` - Change ' to "                       |
| `ds`         | Delete surround           | Normal         | `dst` - remove HTML tags                     |
| `<leader>=`  | Evaluate and replace text | Normal         | Given `2+2`, `<leader>=iw` - Replace with`4` |
| `<leader>==` | Evaluate and replace line | Normal         | Given `2-2`, `<leader>==` - Replace with `0` |

**Surround Operators:**

- `(`, `)`, `b` - Parentheses
- `{`, `}`, `B` - Curly braces
- `[`, `]` - Square brackets
- `<`, `>` - Angle brackets
- `$` - Interpolation
- `c` - Console.log
- `d` - Div
- `j` - JSX template literal
- `m` - JSX multiline comment
- `p` - Promise
- `y` - Try/catch
- `t` - HTML/JSX/TSX tags (e.g., `ysiwt<div>`)

### Code Assistance

| Keymap       | Action                    | Mode   |
| ------------ | ------------------------- | ------ |
| `<c-n>`      | Next completion item      | Insert |
| `<c-p>`      | Previous completion item  | Insert |
| `<cr>`       | Accept completion         | Insert |
| `<s-cr>`     | Abort completion          | Insert |
| `<tab>`      | Accept in-line prediction | Insert |
| `<leader>df` | Show & copy diagnostic    | Normal |
| `<leader>dp` | Previous diagnostic       | Normal |
| `<leader>dn` | Next diagnostic           | Normal |

### Language Tools

| Keymap       | Action                  | Mode   | Languages         |
| ------------ | ----------------------- | ------ | ----------------- |
| `<leader>im` | Add missing imports     | Normal | TypeScript        |
| `<leader>it` | Organize imports/Format | Normal | TypeScript/Python |

### Quickfix

| Keymap       | Action                 | Mode   |
| ------------ | ---------------------- | ------ |
| `<leader>co` | Open quickfix          | Normal |
| `<leader>cq` | Close quickfix         | Normal |
| `<leader>cn` | Next quickfix item     | Normal |
| `<leader>cp` | Previous quickfix item | Normal |

### System Tools

| Keymap       | Action               | Mode   |
| ------------ | -------------------- | ------ |
| `<leader>lg` | Open LazyGit         | Normal |
| `<leader>ln` | Open package manager | Normal |

## Text Objects

| Text Object | Description                                |
| ----------- | ------------------------------------------ |
| Function    | Select a function's contents or boundaries |
| Block       | Select a block's contents or boundaries    |
| Scope       | Select a scope's contents or boundaries    |

Each text object can be used with `i` (inner) or `a` (around), combined with operators or visual mode.

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

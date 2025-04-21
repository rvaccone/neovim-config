# Neovim Configuration

A Neovim configuration that focuses on intentionality and thoughtful design for an unparalleled experience.

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

3. Install your favorite terminal emulator _(optional)_

I use both Ghostty ([download](https://ghostty.org/download)) and Warp ([download](https://app.warp.dev/get_warp?package=dmg)) terminal emulators for Neovim.

4. Install a Nerd Font _(optional, but required for icons)_

You can find a list of Nerd Fonts [here](https://www.nerdfonts.com/font-downloads). I use [JetBrains Mono](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip). You should set the font in your terminal after.

5. Save your current Neovim configuration _(optional)_

```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

6. Clone the repository

```bash
git clone https://github.com/rvaccone/neovim-config.git ~/.config/nvim
```

7. Remove the Supermaven plugin _(optional)_

```bash
rm ~/.config/nvim/lua/plugins/supermaven-inc#supermaven-nvim.lua
```

While I use [Supermaven](https://supermaven.com/)'s paid version, its free tier is excellent. You can remove the plugin to avoid activation prompts until you're ready to try it out for in-line prediction.

## Configuration-specific features

- **Batteries Included Language Support**

  - Language Server Protocol (LSP) support out of the box
  - In-line predictions and suggestions built-in
  - Common formatters, linters, and language parsers included

- **Simply Beautiful Aesthetic**

  - Features a nostalgic Gruvbox theme
  - Polished icons, borders, and colors that are easy on the eyes
  - Clean visual design that employs functional minimalism

- **Intuitive Window Management**

  - Keymaps for quick window navigation and creation
  - Support for managing help and quickfix windows
  - Robust mark support and reference

- **Thoughtful Modular Configuration**

  - Isolated plugin and keymap specifications
  - Dedicated files for LSP setup and vim settings
  - Aggregators that allow you to adjust to your needs

- **Cohesive User Experience**

  - Git integration without leaving Neovim
  - Intuitive, semantic keymaps
  - Curated plugin collection

## Configuration-specific keymaps

Special Keys:

- `<leader>` → Spacebar
- `<cr>` → Enter/Return
- `<c-n>` → Control + n
- `<s-cr>` → Shift + Enter

Modes:

- Normal: Default mode (press `Esc` to enter)
- Insert: Text editing mode (press `i` or `a` to enter)
- Visual: Selection mode (press `v` to enter)
- Command: Command mode (press `:` to enter)

Quick links:

- [Help](#help-and-documentation)
- [Navigation](#navigation)
- [Mark Management](#mark-management)
- [Window Management](#window-management)
- [Language Server Protocol (LSP)](#language-server-protocol-lsp)
- [Text Manipulation](#text-manipulation)
- [Search and Replace](#search-and-replace)
- [Code Assistance](#code-assistance)
- [Language Tools](#language-tools)
- [Quickfix](#quickfix)
- [System Tools](#system-tools)

### Help

| Keymap       | Action                                | Mode   | Source                   |
| ------------ | ------------------------------------- | ------ | ------------------------ |
| `<leader>?`  | Show buffer-local keymaps             | Normal | folke#which-key.nvim.lua |
| `<leader>ho` | Focus help window or open help search | Normal | keymaps/help.lua         |
| `<leader>hq` | Close help window                     | Normal | keymaps/help.lua         |

### Navigation

| Keymap       | Action              | Mode   | Source                            |
| ------------ | ------------------- | ------ | --------------------------------- |
| `<cr>`       | Quick jump anywhere | Normal | echasnovski#mini.jump2d.lua       |
| `<leader>ff` | Find files          | Normal | nvim-telescope#telescope.nvim.lua |
| `<leader>fg` | Find with grep      | Normal | nvim-telescope#telescope.nvim.lua |
| `<leader>fs` | Find in file        | Normal | nvim-telescope#telescope.nvim.lua |
| `<leader>fw` | Find word           | Normal | nvim-telescope#telescope.nvim.lua |
| `<leader>fb` | Find buffer         | Normal | nvim-telescope#telescope.nvim.lua |

### Mark Management

| Keymap         | Action            | Mode   | Source                   |
| -------------- | ----------------- | ------ | ------------------------ |
| `m:`           | Preview mark      | Normal | chentoast#marks.nvim.lua |
| `'` or `` ` `` | Show all marks    | Normal | folke#which-key.nvim.lua |
| `m1-9`         | Toggle bookmark   | Normal | chentoast#marks.nvim.lua |
| `dm1-9`        | Delete bookmark   | Normal | chentoast#marks.nvim.lua |
| `]1-9`         | Next bookmark     | Normal | chentoast#marks.nvim.lua |
| `[1-9`         | Previous bookmark | Normal | chentoast#marks.nvim.lua |

### Window Management

| Keymap         | Action                       | Mode   | Source                      |
| -------------- | ---------------------------- | ------ | --------------------------- |
| `<leader>0`    | Focus file tree              | Normal | nvim-tree#nvim-tree.lua.lua |
| `<leader>nt`   | Toggle file tree             | Normal | nvim-tree#nvim-tree.lua.lua |
| `-`            | Open file explorer           | Normal | stevearc#oil.nvim.lua       |
| `<leader>1-9`  | Focus/create window          | Normal | keymaps/windows.lua         |
| `<leader>v1-9` | Focus/create vertical window | Normal | keymaps/windows.lua         |
| `<leader>q1-9` | Close window without saving  | Normal | keymaps/windows.lua         |
| `<leader>z1-9` | Close window with saving     | Normal | keymaps/windows.lua         |
| `QQ`           | Quit session                 | Normal | keymaps/session.lua         |

You can also use the `q` key to close the floating parent directory.

### Language Server Protocol (LSP)

| Keymap       | Action                | Mode   | Source          |
| ------------ | --------------------- | ------ | --------------- |
| `gd`         | Go to definition      | Normal | keymaps/lsp.lua |
| `gD`         | Go to declaration     | Normal | keymaps/lsp.lua |
| `gi`         | Go to implementation  | Normal | keymaps/lsp.lua |
| `go`         | Go to type definition | Normal | keymaps/lsp.lua |
| `gr`         | Show references       | Normal | keymaps/lsp.lua |
| `K`          | Show documentation    | Normal | keymaps/lsp.lua |
| `gs`         | Show signature help   | Normal | keymaps/lsp.lua |
| `<leader>a`  | Code action           | Normal | keymaps/lsp.lua |
| `<leader>rn` | Rename symbol         | Normal | keymaps/lsp.lua |
| `<leader>lr` | Restart LSP           | Normal | keymaps/lsp.lua |

### Text Manipulation

| Keymap       | Action                            | Mode           | Example                                      | Source                         |
| ------------ | --------------------------------- | -------------- | -------------------------------------------- | ------------------------------ |
| `gcc`        | Comment line                      | Normal         | `gcc` - Comment current line                 | numToStr#Comment.nvim.lua      |
| `gc`         | Comment selection                 | Normal, Visual | `gcip` - Comment paragraph                   | numToStr#Comment.nvim.lua      |
| `<leader>ya` | Copy buffer and path to clipboard | Normal         | `<leader>ya` - Copy entire file              | keymaps/clipboard.lua          |
| `<leader>yn` | Copy filename to clipboard        | Normal         | `<leader>yn` - Copy current filename         | keymaps/clipboard.lua          |
| `ys`         | Add surround                      | Normal         | `ysiw"` - Surround word with quotes          | kylechui#nvim-surround.lua     |
| `yss`        | Surround line                     | Normal         | `yss)` - Surround line with ()               | kylechui#nvim-surround.lua     |
| `ySS`        | Surround line indent              | Normal         | `ySS{` - Surround with {} and indent         | kylechui#nvim-surround.lua     |
| `cs`         | Change surround                   | Normal         | `cs'"` - Change ' to "                       | kylechui#nvim-surround.lua     |
| `ds`         | Delete surround                   | Normal         | `dst` - remove HTML tags                     | kylechui#nvim-surround.lua     |
| `<leader>=`  | Evaluate and replace text         | Normal         | Given `2+2`, `<leader>=iw` - Replace with`4` | echasnovski#mini.operators.lua |
| `<leader>==` | Evaluate and replace line         | Normal         | Given `2-2`, `<leader>==` - Replace with `0` | echasnovski#mini.operators.lua |

**Surround Operators:**

- `(`, `)`, `b` - Parentheses
- `{`, `}`, `B` - Curly braces
- `[`, `]` - Square brackets
- `<`, `>` - Angle brackets
- `$` - Interpolation
  - JavaScript/TypeScript: `${...}`
  - Lua: `$(...)`
  - Python: `{...}`
  - Shell: `${...}`
- `c` - Comment
  - JavaScript/TypeScript: `/*...*/`
  - JavaScriptReact/TypeScriptReact: `{/*...*/}`
  - lua: `--[[...]]`
  - python: `"""..."""`
- `d` - Div
  - JavaScriptReact/TypeScriptReact: `<div className="">...</div>`
  - html: `<div>...</div>`
- `D` - View
  - JavaScriptReact/TypeScriptReact: `<View className="">...</View>`
- `j` - JSX template literal
- `l` - Log
  - JavaScript/TypeScript: `console.log(...)`
  - Lua/Python: `print(...)`
- `p` - Promise
  - JavaScript/TypeScript: `Promise<...>`
  - Python: `Awaitable[...]`
- `y` - Try
  - JavaScript: `try { ... } catch (error) { console.error(error); }`
  - TypeScript: `try { ... } catch (error: unknown) { console.error(error); }`
  - Lua: `pcall(function() ... end)`
- `t` - HTML/JSX/TSX tags (e.g., `ysiwt<div>`)

### Search and Replace

| Keymap       | Action                    | Mode           | Source             |
| ------------ | ------------------------- | -------------- | ------------------ |
| `<leader>sr` | Start search and replace  | Normal, Visual | keymaps/search.lua |
| `<leader>sw` | Replace word under cursor | Normal         | keymaps/search.lua |
| `<leader>sn` | Clear search highlighting | Normal         | keymaps/search.lua |

### Code Assistance

| Keymap       | Action                    | Mode   | Source                             |
| ------------ | ------------------------- | ------ | ---------------------------------- |
| `<c-n>`      | Next completion item      | Insert | keymaps/lsp.lua                    |
| `<c-p>`      | Previous completion item  | Insert | keymaps/lsp.lua                    |
| `<cr>`       | Accept completion         | Insert | keymaps/lsp.lua                    |
| `<s-cr>`     | Abort completion          | Insert | keymaps/lsp.lua                    |
| `<tab>`      | Accept in-line prediction | Insert | supermaven-inc#supermaven-nvim.lua |
| `<leader>df` | Show & copy diagnostic    | Normal | keymaps/lsp.lua                    |
| `<leader>dp` | Previous diagnostic       | Normal | keymaps/lsp.lua                    |
| `<leader>dn` | Next diagnostic           | Normal | keymaps/lsp.lua                    |

### Language Tools

| Keymap       | Action                  | Mode   | Languages         | Source                                                      |
| ------------ | ----------------------- | ------ | ----------------- | ----------------------------------------------------------- |
| `<leader>im` | Add missing imports     | Normal | TypeScript        | stevearc#conform.nvim.lua, pmizio#typescript-tools.nvim.lua |
| `<leader>io` | Organize imports/Format | Normal | TypeScript/Python | stevearc#conform.nvim.lua, pmizio#typescript-tools.nvim.lua |

### Quickfix

| Keymap       | Action                 | Mode   | Source               |
| ------------ | ---------------------- | ------ | -------------------- |
| `<leader>co` | Open quickfix          | Normal | keymaps/quickfix.lua |
| `<leader>cq` | Close quickfix         | Normal | keymaps/quickfix.lua |
| `<leader>cn` | Next quickfix item     | Normal | keymaps/quickfix.lua |
| `<leader>cp` | Previous quickfix item | Normal | keymaps/quickfix.lua |

### System Tools

| Keymap       | Action                            | Mode   | Source                      |
| ------------ | --------------------------------- | ------ | --------------------------- |
| `<leader>ln` | Open plugin package manager       | Normal | aggregators/plugins.lua     |
| `<leader>lg` | Open git UI                       | Normal | kdheepak#lazygit.nvim.lua   |
| `<leader>lm` | Open LSP and tool package manager | Normal | williamboman#mason.nvim.lua |

## Text Objects

| Shorthand | Text Object | Description                                | Source                              |
| --------- | ----------- | ------------------------------------------ | ----------------------------------- |
| `f`       | Function    | Select a function's contents or boundaries | nvim-treesitter#nvim-treesitter.lua |
| `b`       | Block       | Select a block's contents or boundaries    | nvim-treesitter#nvim-treesitter.lua |
| `s`       | Scope       | Select a scope's contents or boundaries    | nvim-treesitter#nvim-treesitter.lua |

Each text object can be used with `i` (inner) or `a` (around), combined with operators or visual mode. For example:

- `if` - Selects the contents of a function without the function name
- `ab` - Selects the contents of a block, including the delimiters

## Configuration Structure Overview

```lua
📁 ~/.config/nvim
├── 📁 lua/
│   ├── 📁 aggregators/        # Loaders for modularity
│   │   ├── 📄 keymaps.lua     # Loads all keymap configurations
│   │   └── 📄 plugins.lua     # Loads all plugin configurations
│   ├── 📁 keymaps/            # Specific keybinding configurations
│   ├── 📁 plugins/            # Specific plugin configurations
│   ├── 📄 lsp.lua             # Language Server Protocol (LSP) setup
│   └── 📄 vim_settings.lua    # Core Neovim settings
├── 📁 spell/                  # Spell checking files
├── 📄 .gitignore              # Git ignore rules
├── 📄 lazy-lock.json          # Plugin version lockfile
├── 📄 stylua.toml             # Lua formatter configuration file
└── 📄 init.lua                # Configuration entry point
```

### Plugin Configuration Structure

Plugin configuration files under `lua/plugins` follow the format: `[GitHub username]#[repository].lua`
Example: `nvim-telescope#telescope.nvim.lua` for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

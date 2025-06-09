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
brew install neovim lua luarocks stylua ripgrep fd trash lazygit make yazi ffmpeg sevenzip jq poppler fzf zoxide resvg imagemagick font-symbols-only-nerd-font gnu-sed
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
  - In-line predictions and completion suggestions built-in
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

  - Isolated plugin and keymap specifications with aggregators
  - Dedicated files for vim settings and utility functions
  - Consistent plugin file naming convention and sources in the README

- **Cohesive User Experience**

  - Git integration without leaving Neovim
  - Intuitive, semantic keymaps with intentionality in mind
  - Modern curated plugin collection

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
- [Clipboard Operations](#clipboard-operations)
- [Text Manipulation](#text-manipulation)
- [Surround Operations](#surround-operations)
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

I prioritize intentionality significantly in my workflow. As a result, `<cr>` will allow you to jump to visible locations, replacing the default behavior.

| Keymap       | Action           | Mode   | Source                            |
| ------------ | ---------------- | ------ | --------------------------------- |
| `<cr>`       | Quick jump       | Normal | echasnovski#mini.jump2d.lua       |
| `<leader>ff` | Find files       | Normal | nvim-telescope#telescope.nvim.lua |
| `<leader>fg` | Find with grep   | Normal | nvim-telescope#telescope.nvim.lua |
| `<leader>fs` | Find in file     | Normal | nvim-telescope#telescope.nvim.lua |
| `<leader>fw` | Find word        | Normal | nvim-telescope#telescope.nvim.lua |
| `<leader>fb` | Find buffer      | Normal | nvim-telescope#telescope.nvim.lua |
| `<leader>fd` | Find diagnostics | Normal | nvim-telescope#telescope.nvim.lua |
| `<leader>fm` | Find marks       | Normal | nvim-telescope#telescope.nvim.lua |
| `<leader>fr` | Resume last find | Normal | nvim-telescope#telescope.nvim.lua |

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

| Keymap         | Action                       | Mode           | Source                          |
| -------------- | ---------------------------- | -------------- | ------------------------------- |
| `<leader>0`    | Focus file tree              | Normal         | nvim-neo-tree#neo-tree.nvim.lua |
| `<leader>nt`   | Toggle file tree             | Normal         | nvim-neo-tree#neo-tree.nvim.lua |
| `<leader>-`    | Open file manager            | Normal, Visual | mikavilpas#yazi.nvim.lua        |
| `<leader>1-9`  | Focus/create window          | Normal         | keymaps/windows.lua             |
| `<leader>v1-9` | Focus/create vertical window | Normal         | keymaps/windows.lua             |
| `<leader>q1-9` | Close window without saving  | Normal         | keymaps/windows.lua             |
| `<leader>z1-9` | Close window with saving     | Normal         | keymaps/windows.lua             |
| `QQ`           | Quit session                 | Normal         | keymaps/session.lua             |

You can also use the `q` key to close the floating parent directory.

### Language Server Protocol (LSP)

| Keymap        | Action                                         | Mode           | Source          |
| ------------- | ---------------------------------------------- | -------------- | --------------- |
| `gd`          | Go to definition                               | Normal         | keymaps/lsp.lua |
| `<leader>gd`  | Go to definition in a new window               | Normal         | keymaps/lsp.lua |
| `<leader>vgd` | Go to definition in a new vertical window      | Normal         | keymaps/lsp.lua |
| `gD`          | Go to declaration                              | Normal         | keymaps/lsp.lua |
| `<leader>gD`  | Go to declaration in a new window              | Normal         | keymaps/lsp.lua |
| `<leader>vgD` | Go to declaration in a new vertical window     | Normal         | keymaps/lsp.lua |
| `gi`          | Go to implementation                           | Normal         | keymaps/lsp.lua |
| `gt`          | Go to type definition                          | Normal         | keymaps/lsp.lua |
| `<leader>gt`  | Go to type definition in a new window          | Normal         | keymaps/lsp.lua |
| `<leader>vgt` | Go to type definition in a new vertical window | Normal         | keymaps/lsp.lua |
| `gr`          | Show references                                | Normal         | keymaps/lsp.lua |
| `K`           | Show documentation                             | Normal         | keymaps/lsp.lua |
| `gs`          | Show signature help                            | Normal         | keymaps/lsp.lua |
| `<leader>a`   | Code action                                    | Normal, Visual | keymaps/lsp.lua |
| `<leader>rn`  | Rename symbol                                  | Normal         | keymaps/lsp.lua |
| `<leader>lr`  | Restart LSP                                    | Normal         | keymaps/lsp.lua |

### Clipboard Operations

| Keymap       | Action                            | Mode   | Source                |
| ------------ | --------------------------------- | ------ | --------------------- |
| `<leader>ya` | Copy buffer and path to clipboard | Normal | keymaps/clipboard.lua |
| `<leader>yn` | Copy filename to clipboard        | Normal | keymaps/clipboard.lua |

### Text Manipulation

| Keymap       | Action                    | Mode           | Example                                      | Source                         |
| ------------ | ------------------------- | -------------- | -------------------------------------------- | ------------------------------ |
| `gcc`        | Comment line              | Normal         | `gcc` - Comment current line                 | numToStr#Comment.nvim.lua      |
| `gc`         | Comment selection         | Normal, Visual | `gcip` - Comment paragraph                   | numToStr#Comment.nvim.lua      |
| `<leader>=`  | Evaluate and replace text | Normal         | Given `2+2`, `<leader>=iw` - Replace with`4` | echasnovski#mini.operators.lua |
| `<leader>==` | Evaluate and replace line | Normal         | Given `2-2`, `<leader>==` - Replace with `0` | echasnovski#mini.operators.lua |

### Surround Operations

| Keymap | Action                | Mode           | Example                             | Source                        |
| ------ | --------------------- | -------------- | ----------------------------------- | ----------------------------- |
| `sa`   | Add surround          | Normal, Visual | `saiw"` - Surround word with quotes | echasnovski#mini.surround.lua |
| `sd`   | Delete surround       | Normal         | `sd"` - Remove quotes               | echasnovski#mini.surround.lua |
| `sr`   | Replace surround      | Normal         | `sr'"` - Change ' to "              | echasnovski#mini.surround.lua |
| `sf`   | Find surround (right) | Normal         | `sf"` - Jump to next "              | echasnovski#mini.surround.lua |
| `sF`   | Find surround (left)  | Normal         | `sF"` - Jump to previous "          | echasnovski#mini.surround.lua |
| `sh`   | Highlight surround    | Normal         | `sh"` - Highlight quotes            | echasnovski#mini.surround.lua |
| `sn`   | Update n_lines        | Normal         | `sn` - Update search lines          | echasnovski#mini.surround.lua |

**Non-Language-Aware Surroundings:**

- `b` - Parentheses
- `f` - Function
- `q` - Quotes
- `t` - HTML/JSX/TSX tags
- `?` - User prompt

**Language-Aware Surroundings:**

| Key | Name                      | Languages                                                                     | Example Output                                                    |
| --- | ------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| `$` | Interpolation             | JS/TS: `${...}`, Lua: `$(...)`, Python: `{...}`, Shell: `${...}`              | `sa$` → `${`_selection_`}`                                        |
| `c` | Comment                   | JS/TS: `/*...*/`, JSX/TSX: `{/*...*/}`, Lua: `--[[...]]`, Python: `"""..."""` | `sac` → `/* `_selection_` */`                                     |
| `d` | Div                       | JSX/TSX: `<div className="">...</div>`, HTML: `<div>...</div>`                | `sad` → `<div className="">`_selection_`</div>`                   |
| `D` | View                      | JSX/TSX: `<View className="">...</View>`                                      | `saD` → `<View className="">`_selection_`</View>`                 |
| `l` | Log                       | JS/TS: `console.log(...)`, Lua/Python: `print(...)`                           | `sal` → `console.log(`_selection_`)`                              |
| `p` | Promise                   | JS/TS: `Promise<...>`, Python: `Awaitable[...]`                               | `sap` → `Promise<`_selection_`>`                                  |
| `t` | Custom Tag                | JSX/TSX/HTML                                                                  | `sat` → prompts for tag name → `<tag>`_selection_`</tag>`         |
| `T` | Custom Tag with className | JSX/TSX                                                                       | `saT` → prompts for tag → `<tag className="">`_selection_`</tag>` |
| `y` | Try-Catch                 | JS: `try {...} catch (error) {...}`, TS: typed catch, Lua: `pcall(...)`       | `say` → `try { `_selection_` } catch (error) {...}`               |

### Search and Replace

| Keymap       | Action                      | Mode           | Source                     |
| ------------ | --------------------------- | -------------- | -------------------------- |
| `<leader>sr` | Start search and replace    | Normal, Visual | keymaps/search.lua         |
| `<leader>sw` | Replace word under cursor   | Normal         | keymaps/search.lua         |
| `<leader>sn` | Clear search highlighting   | Normal         | keymaps/search.lua         |
| `<leader>sb` | Search document symbols     | Normal         | keymaps/lsp.lua            |
| `<leader>sB` | Search workspace symbols    | Normal         | keymaps/lsp.lua            |
| `<leader>sp` | Advanced search and replace | Normal         | nvim-pack#nvim-spectre.lua |

### Code Assistance

| Keymap       | Action                       | Mode   | Source                             |
| ------------ | ---------------------------- | ------ | ---------------------------------- |
| `<c-n>`      | Next completion item         | Insert | keymaps/lsp.lua                    |
| `<c-p>`      | Previous completion item     | Insert | keymaps/lsp.lua                    |
| `<cr>`       | Accept completion            | Insert | keymaps/lsp.lua                    |
| `<s-cr>`     | Abort completion             | Insert | keymaps/lsp.lua                    |
| `<tab>`      | Accept in-line prediction    | Insert | supermaven-inc#supermaven-nvim.lua |
| `<leader>dy` | Yank diagnostic              | Normal | keymaps/diagnostics.lua            |
| `<leader>dh` | Show & yank diagnostic hover | Normal | keymaps/diagnostics.lua            |
| `<leader>dp` | Previous diagnostic          | Normal | keymaps/diagnostics.lua            |
| `<leader>dn` | Next diagnostic              | Normal | keymaps/diagnostics.lua            |

### Language Tools

| Keymap       | Action              | Mode   | Languages         | Source                                                      |
| ------------ | ------------------- | ------ | ----------------- | ----------------------------------------------------------- |
| `<leader>im` | Add missing imports | Normal | TypeScript        | stevearc#conform.nvim.lua, pmizio#typescript-tools.nvim.lua |
| `<leader>io` | Organize imports    | Normal | TypeScript/Python | stevearc#conform.nvim.lua, pmizio#typescript-tools.nvim.lua |

### Quickfix

| Keymap       | Action                 | Mode   | Source               |
| ------------ | ---------------------- | ------ | -------------------- |
| `<leader>co` | Open quickfix          | Normal | keymaps/quickfix.lua |
| `<leader>cq` | Close quickfix         | Normal | keymaps/quickfix.lua |
| `<leader>cn` | Next quickfix item     | Normal | keymaps/quickfix.lua |
| `<leader>cp` | Previous quickfix item | Normal | keymaps/quickfix.lua |

### System Tools

| Keymap       | Action                            | Mode   | Source                    |
| ------------ | --------------------------------- | ------ | ------------------------- |
| `<leader>ln` | Open plugin package manager       | Normal | aggregators/plugins.lua   |
| `<leader>lg` | Open git UI                       | Normal | kdheepak#lazygit.nvim.lua |
| `<leader>lm` | Open LSP and tool package manager | Normal | mason-org#mason.nvim.lua  |

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
│   ├── 📄 ui.lua              # Overarching UI setup
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

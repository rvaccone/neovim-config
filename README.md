<!-- Header -->
<div align="center">
    <h1>Neovim Configuration</h1>
    <p>
        Focuses on intentionality and thoughtful design for an unparalleled experience
        <br />
        <a href="#features">Features</a>
        ·
        <a href="#installation">Installation</a>
        ·
        <a href="#keymaps">Keymaps</a>
    </p>
</div>

## About

This configuration embraces the philosophy that your editor should evolve with you. Every keymap and design choice prioritizes **intentionality** over convenience. The goal is to make navigation instinctive and editing flow naturally.

## Features

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

## Installation

### macOS

1. Install [Homebrew](https://brew.sh/)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

> [!IMPORTANT]
> Make sure to add Homebrew to your PATH when prompted by the installer.

2. Install Neovim and its dependencies

```bash
brew install neovim lua luarocks stylua ripgrep fd trash lazygit make gnu-sed
```

3. Install your favorite terminal emulator _(optional)_

I use Ghostty ([download](https://ghostty.org/download)) and Warp ([download](https://app.warp.dev/get_warp?package=dmg)) terminal emulators for Neovim.

> [!TIP]
> For the best experience, use a terminal that supports true color and ligatures.

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

8. First launch

```
nvim
```

> [!NOTE]
> The first launch will automatically install all plugins, language servers, and formatters. This may take several minutes depending on your internet connection.

## Keymaps

Special Keys:

- `<leader>` → Spacebar
- `<cr>` → Enter/Return
- `<c-n>` → Control + n
- `<s-cr>` → Shift + Enter

> [!TIP]
> This configuration modifies some default Vim behaviors for better usability. See individual sections for details.

Modes:

- Normal: Default mode (press `Esc` to enter)
- Insert: Text editing mode (press `i` or `a` to enter)
- Visual: Selection mode (press `v` to enter)
- Command: Command mode (press `:` to enter)

Quick links:

- [Help](#help)
- [Navigation](#navigation)
- [Mark Management](#mark-management)
- [Window Management](#window-management)
- [Language Server Protocol (LSP)](#language-server-protocol-lsp)
- [Clipboard Operations](#clipboard-operations)
- [Text Manipulation](#text-manipulation)
- [Search and Replace](#search-and-replace)
- [Completion](#completion)
- [Language Tools](#language-tools)
- [Quickfix](#quickfix)
- [System Tools](#system-tools)

> [!TIP]
> Keymaps marked with 🔸 are recommended for new users to learn first.

### Help

| Keymap         | Action                                | Mode   | Source                   |
| -------------- | ------------------------------------- | ------ | ------------------------ |
| `<leader>ho`   | Focus help window or open help search | Normal | keymaps/help.lua         |
| `<leader>hq`   | Close help window                     | Normal | keymaps/help.lua         |
| `<leader>?` 🔸 | Show buffer keymaps                   | Normal | folke#which-key.nvim.lua |

### Navigation

| Keymap          | Action                   | Mode   | Source                            |
| --------------- | ------------------------ | ------ | --------------------------------- |
| `j`             | Move down by visual line | Normal | keymaps/navigation.lua            |
| `k`             | Move up by visual line   | Normal | keymaps/navigation.lua            |
| `<cr>`          | Quick jump               | Normal | nvim-mini#mini.jump2d.lua         |
| `<leader>ff` 🔸 | Find files               | Normal | nvim-telescope#telescope.nvim.lua |
| `<leader>fg` 🔸 | Find with grep           | Normal | nvim-telescope#telescope.nvim.lua |
| `<leader>fs`    | Find in file             | Normal | nvim-telescope#telescope.nvim.lua |
| `<leader>fw`    | Find word                | Normal | nvim-telescope#telescope.nvim.lua |
| `<leader>fb`    | Find buffer              | Normal | nvim-telescope#telescope.nvim.lua |
| `<leader>fd`    | Find diagnostics         | Normal | nvim-telescope#telescope.nvim.lua |
| `<leader>fm`    | Find marks               | Normal | nvim-telescope#telescope.nvim.lua |
| `<leader>fr`    | Resume last find         | Normal | nvim-telescope#telescope.nvim.lua |

> [!NOTE]
> To ensure more intentional navigation, `<cr>` will allow you to jump to visible locations, replacing the default behavior. Similarly, `j` and `k` have been remapped to move by visual lines rather than file lines, making navigation more intuitive with wrapped text.

### Mark Management

| Keymap         | Action            | Mode   | Source                   |
| -------------- | ----------------- | ------ | ------------------------ |
| `m:`           | Preview mark      | Normal | chentoast#marks.nvim.lua |
| `'` or `` ` `` | Show all marks    | Normal | folke#which-key.nvim.lua |
| `m1`-`9`       | Toggle bookmark   | Normal | chentoast#marks.nvim.lua |
| `dm1`-`9`      | Delete bookmark   | Normal | chentoast#marks.nvim.lua |
| `]1`-`9`       | Next bookmark     | Normal | chentoast#marks.nvim.lua |
| `[1`-`9`       | Previous bookmark | Normal | chentoast#marks.nvim.lua |

### Window Management

| Keymap             | Action                       | Mode           | Source                          |
| ------------------ | ---------------------------- | -------------- | ------------------------------- |
| `<leader>0` 🔸     | Focus file tree              | Normal         | nvim-neo-tree#neo-tree.nvim.lua |
| `<leader>nt`       | Toggle file tree             | Normal         | nvim-neo-tree#neo-tree.nvim.lua |
| `<leader>-`        | Open file manager            | Normal, Visual | stevearc#oil.nvim.lua           |
| `<leader>1`-`9` 🔸 | Focus/create window          | Normal         | rvaccone/wind.nvim              |
| `<leader>v1`-`9`   | Focus/create vertical window | Normal         | rvaccone/wind.nvim              |
| `<leader>x1`-`9`   | Swap windows                 | Normal         | rvaccone/wind.nvim              |
| `<leader>q1`-`9`   | Close window without saving  | Normal         | rvaccone/wind.nvim              |
| `<leader>z1`-`9`   | Close window with saving     | Normal         | rvaccone/wind.nvim              |
| `QQ`               | Quit session                 | Normal         | keymaps/session.lua             |

> [!NOTE]
> You can also use the `q` key to close the floating parent directory.

### Language Server Protocol (LSP)

| Keymap         | Action                                         | Mode           | Source                  |
| -------------- | ---------------------------------------------- | -------------- | ----------------------- |
| `gd` 🔸        | Go to definition                               | Normal         | keymaps/lsp.lua         |
| `<leader>gd`   | Go to definition in a new window               | Normal         | keymaps/lsp.lua         |
| `<leader>vgd`  | Go to definition in a new vertical window      | Normal         | keymaps/lsp.lua         |
| `gD`           | Go to declaration                              | Normal         | keymaps/lsp.lua         |
| `<leader>gD`   | Go to declaration in a new window              | Normal         | keymaps/lsp.lua         |
| `<leader>vgD`  | Go to declaration in a new vertical window     | Normal         | keymaps/lsp.lua         |
| `gi`           | Go to implementation                           | Normal         | keymaps/lsp.lua         |
| `gt`           | Go to type definition                          | Normal         | keymaps/lsp.lua         |
| `<leader>gt`   | Go to type definition in a new window          | Normal         | keymaps/lsp.lua         |
| `<leader>vgt`  | Go to type definition in a new vertical window | Normal         | keymaps/lsp.lua         |
| `gr`           | Show references                                | Normal         | keymaps/lsp.lua         |
| `K` 🔸         | Show documentation                             | Normal         | keymaps/lsp.lua         |
| `gs`           | Show signature help                            | Normal         | keymaps/lsp.lua         |
| `<leader>a` 🔸 | Code action                                    | Normal, Visual | keymaps/lsp.lua         |
| `<leader>rn`   | Rename symbol                                  | Normal         | keymaps/lsp.lua         |
| `<leader>lr`   | Restart LSP                                    | Normal         | keymaps/lsp.lua         |
| `<leader>dy`   | Yank diagnostic                                | Normal         | keymaps/diagnostics.lua |
| `<leader>dh`   | Show & yank diagnostic hover                   | Normal         | keymaps/diagnostics.lua |
| `<leader>dp`   | Previous diagnostic                            | Normal         | keymaps/diagnostics.lua |
| `<leader>dn`   | Next diagnostic                                | Normal         | keymaps/diagnostics.lua |

### Clipboard Operations

| Keymap          | Action                                                               | Mode   | Source             |
| --------------- | -------------------------------------------------------------------- | ------ | ------------------ |
| `<leader>ya` 🔸 | Copy buffer and path to clipboard                                    | Normal | rvaccone/wind.nvim |
| `<leader>y*`    | Copy AI-friendly buffers and paths for all open windows to clipboard | Normal | rvaccone/wind.nvim |
| `<leader>yn`    | Copy filename to clipboard                                           | Normal | rvaccone/wind.nvim |

### Text Manipulation

| Keymap       | Action                    | Mode           | Example                                       | Source                       |
| ------------ | ------------------------- | -------------- | --------------------------------------------- | ---------------------------- |
| `<leader>=`  | Evaluate and replace text | Normal         | Given `2+2`, `<leader>=iw` - Replace with `4` | nvim-mini#mini.operators.lua |
| `<leader>==` | Evaluate and replace line | Normal         | Given `2-2`, `<leader>==` - Replace with `0`  | nvim-mini#mini.operators.lua |
| `sa` 🔸      | Add surround              | Normal, Visual | `saiw"` - Surround word with quotes           | nvim-mini#mini.surround.lua  |
| `sd`         | Delete surround           | Normal         | `sd"` - Remove quotes                         | nvim-mini#mini.surround.lua  |
| `sr`         | Replace surround          | Normal         | `sr'"` - Change `'` to `"`                    | nvim-mini#mini.surround.lua  |
| `sf`         | Find surround (right)     | Normal         | `sf"` - Jump to next `"`                      | nvim-mini#mini.surround.lua  |
| `sF`         | Find surround (left)      | Normal         | `sF"` - Jump to previous `"`                  | nvim-mini#mini.surround.lua  |
| `sh`         | Highlight surround        | Normal         | `sh"` - Highlight quotes                      | nvim-mini#mini.surround.lua  |
| `sn`         | Update n_lines            | Normal         | `sn` - Update search lines                    | nvim-mini#mini.surround.lua  |

<details>
<Summary>Available Surroundings</Summary>

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

</details>

### Search and Replace

| Keymap       | Action                      | Mode           | Source                     |
| ------------ | --------------------------- | -------------- | -------------------------- |
| `<leader>sr` | Start search and replace    | Normal, Visual | keymaps/search.lua         |
| `<leader>sw` | Replace word under cursor   | Normal         | keymaps/search.lua         |
| `<leader>sn` | Clear search highlighting   | Normal         | keymaps/search.lua         |
| `<leader>sb` | Search document symbols     | Normal         | keymaps/lsp.lua            |
| `<leader>sB` | Search workspace symbols    | Normal         | keymaps/lsp.lua            |
| `<leader>sp` | Advanced search and replace | Normal         | nvim-pack#nvim-spectre.lua |

### Completion

| Keymap   | Action                    | Mode   | Source                             |
| -------- | ------------------------- | ------ | ---------------------------------- |
| `<c-n>`  | Next completion item      | Insert | saghen#blink.cmp.lua               |
| `<c-p>`  | Previous completion item  | Insert | saghen#blink.cmp.lua               |
| `<cr>`   | Accept completion         | Insert | saghen#blink.cmp.lua               |
| `<s-cr>` | Abort completion          | Insert | saghen#blink.cmp.lua               |
| `<tab>`  | Accept in-line prediction | Insert | supermaven-inc#supermaven-nvim.lua |

### Language Tools

| Keymap          | Action              | Mode   | Languages         | Source                                                      |
| --------------- | ------------------- | ------ | ----------------- | ----------------------------------------------------------- |
| `<leader>im`    | Add missing imports | Normal | TypeScript        | stevearc#conform.nvim.lua, pmizio#typescript-tools.nvim.lua |
| `<leader>io` 🔸 | Organize imports    | Normal | TypeScript/Python | stevearc#conform.nvim.lua, pmizio#typescript-tools.nvim.lua |

### Quickfix

| Keymap       | Action                 | Mode   | Source               |
| ------------ | ---------------------- | ------ | -------------------- |
| `<leader>co` | Open quickfix          | Normal | keymaps/quickfix.lua |
| `<leader>cq` | Close quickfix         | Normal | keymaps/quickfix.lua |
| `<leader>cn` | Next quickfix item     | Normal | keymaps/quickfix.lua |
| `<leader>cp` | Previous quickfix item | Normal | keymaps/quickfix.lua |

### System Tools

| Keymap          | Action                            | Mode   | Source                    |
| --------------- | --------------------------------- | ------ | ------------------------- |
| `<leader>ln`    | Open plugin package manager       | Normal | aggregators/plugins.lua   |
| `<leader>lg` 🔸 | Open git UI                       | Normal | kdheepak#lazygit.nvim.lua |
| `<leader>lm`    | Open LSP and tool package manager | Normal | mason-org#mason.nvim.lua  |

## Text Objects

| Shorthand | Text Object        | Source                |
| --------- | ------------------ | --------------------- |
| `a`       | Argument/parameter | nvim-mini#mini.ai.lua |
| `b`       | Bracket            | nvim-mini#mini.ai.lua |
| `f`       | Function           | nvim-mini#mini.ai.lua |
| `q`       | Scope              | nvim-mini#mini.ai.lua |
| `t`       | Tag                | nvim-mini#mini.ai.lua |
| `?`       | User prompt        | nvim-mini#mini.ai.lua |

Each text object can be used with `i` (inner) or `a` (around), combined with operators or visual mode. For example:

- `if` - Selects the contents of a function without the function name
- `ab` - Selects a pair of brackets and their content

You can also select the last and next instance with `l` and `n` respectively. For example:

- `ilf` - Selects the contents of the last function without the function name
- `anb` - Selects the next pair of brackets and their content

## Structure

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

### Plugin Naming Convention

Plugin configuration files under `lua/plugins` follow the format: `[GitHub username]#[repository].lua`
Example: `nvim-telescope#telescope.nvim.lua` for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

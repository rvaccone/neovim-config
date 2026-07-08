# Renders the README demo without a human at the keyboard.
# Requires vhs (brew install vhs). Run from the repo root:
#   vhs demo/config.tape
#
# The config is copied to /tmp/nvim-demo first so the per-project stores
# that key on the cwd (wind's breaths, capo's roster) are never touched.

Output demo/demo.gif
Output demo/demo.mp4

Set FontFamily "Maple Mono NF"
Set FontSize 20
Set Width 1400
Set Height 800
Set Padding 16
Set Framerate 20

Hide
Type "rm -rf /tmp/nvim-demo && cp -R ~/.config/nvim /tmp/nvim-demo && cd /tmp/nvim-demo && clear"
Enter
Type "nvim lua/vim_settings.lua"
Enter
Sleep 4s
Type ":Neotree close"
Enter
Sleep 500ms
# The /tmp copy and the real config double-define every class, so the
# language server would sprinkle duplicate-field hints over the recording.
Type ":lua vim.diagnostic.enable(false)"
Enter
# Announce finished terminal jobs quickly enough for a demo take.
Type ":lua require('capo').setup({ terminals = { persist = false }, watch = { min_seconds = 3 }, shell = 'sh' })"
Enter
Type ":echo ''"
Enter
Show

Sleep 1.5s

# quickdraw: press f and every reachable character is colored by its
# cost. Land on the first r, then walk the trail.
Type "f"
Sleep 2.2s
Type "r"
Sleep 1s
Type ";"
Sleep 700ms
Type ";"
Sleep 1.2s

# wind: windows are numbered destinations. Create window 2.
Type " 2"
Sleep 1s
Type ":e lua/keymaps/clipboard.lua"
Enter
Sleep 1.2s

# Hesitate on the bare prefix, read the numbers, go.
Type " "
Sleep 800ms
Type "1"
Sleep 1.2s

# Hold this layout as a breath, drift away, hold another.
Type " bb"
Sleep 1.5s
Type " wo"
Sleep 800ms
Type ":e init.lua"
Enter
Sleep 1s
Type " bn"
Sleep 1.2s

# The breath card: hesitate, read, return. The layout snaps back.
Type " b"
Sleep 2s
Type "1"
Sleep 2s

# capo: terminals are numbered too. Call one that does not exist yet.
Type " t1"
Sleep 1.5s
Type "ls"
Enter
Sleep 1.5s

# The shell is idle, so Esc means dismiss.
Escape
Sleep 1s

# Terminal 2 gets a longer job; tuck it away while it works.
Type " t2"
Sleep 1.2s
Type "sleep 6 && echo done"
Enter
Sleep 600ms
Ctrl+\
Ctrl+n
Type " tt"
Sleep 800ms

# Keep working; capo will say when the hidden job finishes.
Type "gg"
Sleep 2s
Type "jjj"
Sleep 4s

# The terminal card reads the crew. Open 2: the job ran while we edited.
Type " t"
Sleep 2.2s
Type "2"
Sleep 2s
Escape
Sleep 1s

# Yank the buffer with its path, ready to hand to an agent.
Type " ya"
Sleep 2.5s

Hide
Type ":qa!"
Enter
Type "rm -rf /tmp/nvim-demo ~/.local/share/nvim/wind/*nvim-demo* ~/.local/share/nvim/capo/*nvim-demo*"
Enter

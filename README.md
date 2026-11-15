# builder-intellij-keymap

**IntelliJ IDEA shortcuts for [GNOME Builder](https://apps.gnome.org/Builder/).**
Builder has a Vim mode but no IntelliJ keymap. This is one: a single
`keybindings.json` that moves Builder's own shortcuts to their IntelliJ keys
and adds the ones it's missing.

```sh
git clone https://github.com/jasperblues/builder-intellij-keymap ~/projects/builder-intellij-keymap
~/projects/builder-intellij-keymap/install.sh
```

`install.sh` symlinks the keymap to `~/.config/gnome-builder/keybindings.json`
(backing up any existing file). Builder picks up changes without a restart.
To uninstall, delete that file.

Made for Builder 50 with IntelliJ's default Linux/Windows keymap.

## Shortcuts

### Navigation

| Shortcut | Action |
|---|---|
| Ctrl+Shift+N, Ctrl+N, Ctrl+E | Global search (files, symbols) |
| Ctrl+Shift+A | Global search (also finds actions) |
| Ctrl+G | Go to line |
| Ctrl+B | Go to declaration |
| Ctrl+Alt+B | Go to definition |
| Alt+F7 | Find usages |
| Ctrl+F12 | File structure (symbol tree) |
| F2 / Shift+F2 | Next / previous error |

### Search

| Shortcut | Action |
|---|---|
| Ctrl+F | Find (unchanged) |
| Ctrl+R | Replace |
| F3 / Shift+F3 | Find next / previous |
| Ctrl+Shift+F | Find in files |

### Editing

| Shortcut | Action |
|---|---|
| Ctrl+D | Duplicate line |
| Ctrl+Y | Delete line |
| Ctrl+Shift+J | Join lines |
| Ctrl+/ | Comment lines |
| Ctrl+Shift+/ | Uncomment lines |
| Ctrl+Alt+L | Reformat file |
| Shift+F6 | Rename |
| Alt+Enter | Code actions (quick fixes) |
| Alt+Insert | New file |

### Tabs and tool windows

| Shortcut | Action |
|---|---|
| Ctrl+F4 | Close tab (Ctrl+W still works too) |
| Alt+1 | Toggle the project panel |
| Alt+F12 | Toggle the bottom panel (terminal, build output) |
| Ctrl+Alt+S | Preferences |

### Build, run, debug

| Shortcut | Action |
|---|---|
| Ctrl+F9 | Build |
| Shift+F10 | Run |
| Ctrl+F2 | Stop |
| Shift+F9 | Debug |
| F8 / F7 / Shift+F8 | Step over / into / out |
| F9 | Resume |
| Ctrl+F8 | Toggle breakpoint |

## Differences from IntelliJ

- **Comment is not a toggle.** Builder has separate comment and uncomment
  actions, so they're on Ctrl+/ and Ctrl+Shift+/ (IntelliJ uses the latter for
  block comments).
- **Ctrl+Q no longer quits.** It's Quick Documentation in IntelliJ, so muscle
  memory would close Builder. Quit is moved to Ctrl+Shift+Q.
- **Ctrl+W closes the tab**, as in Builder. Builder has no Extend Selection.
- **Not mapped**, because Builder has no matching action: Shift Shift (Search
  Everywhere), Extend Selection, Move Line Up/Down, Optimize Imports,
  Generate, Recent Locations.
- Shortcuts that used to live on the moved keys (e.g. Builder's Ctrl+N for new
  file, F9 for the side panel, Alt+1 for the first tab) move with them or are
  replaced. See the table above.

## How it works

Builder reads user shortcuts from `~/.config/gnome-builder/keybindings.json`
and gives them priority over its own. An entry with `"override"` takes one
of Builder's shortcut ids and gives it a new `"trigger"`, keeping the context
it normally works in. Entries with `"action"` add new shortcuts, with a
`"when"` condition such as `inEditor()`. `"phase": "capture"` lets a shortcut
beat the editor's built-in bindings, which is needed to turn Ctrl+D from
"delete line" into "duplicate line".

To change a key, edit `keybindings.json` and save. Triggers use
[GTK accelerator syntax](https://docs.gtk.org/gtk4/func.accelerator_parse.html),
e.g. `<Control><Shift>n` or `<Alt>F7`.

## License

Apache-2.0. See [LICENSE](LICENSE).

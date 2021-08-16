### Ubuntu program setup

#### Settings

1. Region & Languages -> **Plus** on Input Source -> Find **Russian** language -> Add
2. Appearance
    1. Choose **Dark**
    2. Dock
        * Auto-hide the Dock: **true**
        * Icon size: **30**
        * Position on screen: **Bottom**
3. Application: delete extra programs yourself
4. Mouse & Touchpad -> Mouse -> Mouse Speed: **~5%**
5. Keyboard Shortcuts
    * Search: **C+space**
    * Copy a screenshot of an area to clipboard: **S+Alt+$**
    * Copy a screenshot to clipboard: **S+Alt+#**
    * Switch to next input source: **Alt+space**
    * Close window: **Alt+q**
    * Maximaze window: **Alt+f**

#### Gnome Tweaks

1. Map **Caps lock** to **Esc**
    * Keyboard -> Additional Layout Options -> Caps Lock behavior: **Make Caps Lock an additional Esc**

#### Terminator

1. Global
    * Behavior -> Window state: **Maximised**
    * Terminal Titlebar: setup your colors
    * Hide size from title: **true**
2. Profiles
    * (General) Cursor
        * Shape: **I-Beam**
        * Blink: **false**
    * (General) Show titlebar: **false**
3. Keybindings
    * close_term: **Alt+w**
    * close_window: **Alt+q**
    * new_tab: **Alt+t**
    * next_tab: **Alt+]**
    * prev_tab: **Alt+[**

#### PostgreSQL

1. Switch to user **postgres**: `sudo -i -u postgres`
2. `createuser --interactive` input name, allow **superuser**

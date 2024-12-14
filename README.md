# kickstart.nvim
## Quick Install Command (Ubuntu/WSL)
```sh
git clone -b viscount-monty_features https://github.com/viscount-monty/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```
## Additions by viscount-monty
### To Do
- [ ] Keymap for write, git add, git commit, git stash, git pull, git push, git stash apply - `<leader>gx`
  - [x] Functional keymap
  - [ ] Remove unnecessary `Press ENTER` prompts
- [ ] Better autocomplete keymaps than `Ctrl+N`/`Ctrl+Y` etc
- [ ] Cheatsheet for tab shortcuts [Documenation](https://neovim.io/doc/user/tabpage.html)
- [ ] Markdown headline colours for themes, as per `folke/tokyonight.nvim`
  - [ ] `projekt0n/github-nvim-theme`
  - [ ] `EdenEast/nightfox.nvim carbonfox`
- [ ] Resolve `WARNING vim.validate is deprecated. Feature will be removed in Nvim 1.0` in `:checkhealth`
- [ ] Document `nvim-telescope/telescope.nvim` usage
- [ ] Document `mini.surround` usage (adding `()`, `[]`, `{}`, `<>`, `''`, `""` etc to word, visual selection)
- [x] Python tools
  - [x] Linting
  - [x] Autocompletion
- [ ] Micropython tools
  - [ ] Upload scripts to Raspberry Pi Pico
  - [ ] Download scripts from Raspberry Pi Pico 
  - [ ] Access REPL of Raspberry Pi Pico
  - [ ] [jim-at-jibba/micropython.nvim](https://github.com/jim-at-jibba/micropython.nvim)
- [ ] Move `neovim` related content from `viscount-monty/cli_cheatsheet` to this README
- [ ] Confirm fix for `iamcco/markdown-preview.nvim`
  - [Issue #690](https://github.com/iamcco/markdown-preview.nvim/issues/690#issuecomment-2540959855)

### Addition Notes
- Added quick install command to `README.md`
- Added git plugin `tpope/fugitive`
- Uncommented `vim.g.have_nerd_font = true`
- Added keymaps for line numbering
  - `<leader>la` to toggle absolute line numbers
  - `<leader>lr` to toggle relative line numbers
- Added Markdown Preview plugin `iamcco/markdown-preivew.nvim`
  - Currently requires `:Lazy build markdown-preview.nvim` after first install
    - Possible solutions [here](https://github.com/iamcco/markdown-preview.nvim/issues/690#issuecomment-2425301834)
  - Mapped `:MarkdownPreviewToggle` to `<leader>m`
- Added list of additions by `viscount-monty` to `README.md`
- Mouse disabled by default
  ```lua
  -- Enable mouse mode, can be useful for resizing splits for example!
  -- vim.opt.mouse = 'a'
  vim.opt.mouse = ''
- Added Tmux navigation plugin `alexghergh/nvim-tmux-navigation`
  - `<leader>p[h,j,k,l]` to navigate panes
- Added keymaps
  - `<leader>j` insert blank line below current line
  - `<leader>k` insert blank line above current line
  - `<leader>$` open terminal in split
  - `<leader>gc` write buffer, git add, git commit
  - `<leader>gs` git pull, git push
  - `<leader>si` Search NerdFont icons/glyphs
- Set folding to use Treesitter
  ```lua
  -- Fold text shows number of lines folded and first line, but without syntax highlighting
  vim.opt.foldmethod = 'expr'
  vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
  -- Shows only syntax-highlighted first line, no line numbers
  vim.opt.foldtext = ''
  -- Set what level of folds to be open by default
  vim.opt.foldlevelstart = 1
- Added `EdenEast/nightfox.nvim` theme (but it does not use different colours for different markdown heading levels)
- Added markdown headline level colours in `nvim/after/ftplugin/markdown.lua` 
  - Overridden if `:Telescope colorscheme` is used
  - To restore, use command `:luafile ~/.config/nvim/after/ftplugin/markdown.lua`
  - File contains
    ```lua
    -- Define custom highlight groups for each markdown heading level
    vim.api.nvim_set_hl(0, '@markdown.heading.1', { fg = '#7aa89f', bold = true })
    vim.api.nvim_set_hl(0, '@markdown.heading.2', { fg = '#ffc894', bold = true })
    vim.api.nvim_set_hl(0, '@markdown.heading.3', { fg = '#ffa066', bold = true })
    vim.api.nvim_set_hl(0, '@markdown.heading.4', { fg = '#e46876', bold = true })
    vim.api.nvim_set_hl(0, '@markdown.heading.5', { fg = '#938aa9', bold = true })
    vim.api.nvim_set_hl(0, '@markdown.heading.6', { fg = '#975fb8', bold = true })
    -- Link the custom highlight groups to Treesitter's markdown heading captures
    vim.api.nvim_set_hl(0, '@markup.heading.1.markdown', { link = '@markdown.heading.1' })
    vim.api.nvim_set_hl(0, '@markup.heading.2.markdown', { link = '@markdown.heading.2' })
    vim.api.nvim_set_hl(0, '@markup.heading.3.markdown', { link = '@markdown.heading.3' })
    vim.api.nvim_set_hl(0, '@markup.heading.4.markdown', { link = '@markdown.heading.4' })
    vim.api.nvim_set_hl(0, '@markup.heading.5.markdown', { link = '@markdown.heading.5' })
    vim.api.nvim_set_hl(0, '@markup.heading.6.markdown', { link = '@markdown.heading.6' })
- Set window split mode to reduce size of current window and leave other windows unaffected
  - In `init.lua` include the line
    ```lua
    -- Don't resize windows automatically when using :split
    vim.opt.equalalways = false
- Set up `pyright`, static type checker for Python
  - Uncommented `pyright` for `neovim/nvim-lspconfig`
    ```lua
    pyright = {},
  - Install `npm`
    ```bash
    sudo apt install npm
  - Changed autocompletion mapping to `<Tab>`
    - Uncommented relevant sections in `hrsh7th/nvim-cmp` config

## Introduction
A starting point for Neovim that is:

* Small
* Single-file
* Completely Documented

**NOT** a Neovim distribution, but instead a starting point for your configuration.

## Installation
### Install Neovim

Kickstart.nvim targets *only* the latest
['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest
['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim.
If you are experiencing issues, please make sure you have the latest versions.

### Install External Dependencies

External Requirements:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool (xclip/xsel/win32yank or other depending on platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Language Setup:
  - If you want to write Typescript, you need `npm`
  - If you want to write Golang, you will need `go`
  - etc.

> **NOTE**
> See [Install Recipes](#Install-Recipes) for additional Windows and Linux specific notes
> and quick install snippets

### Install Kickstart

> **NOTE**
> [Backup](#FAQ) your previous configuration (if any exists)

Neovim's configurations are located under the following paths, depending on your OS:

| OS | PATH |
| :- | :--- |
| Linux, MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)| `%localappdata%\nvim\` |
| Windows (powershell)| `$env:LOCALAPPDATA\nvim\` |

#### Recommended Step

[Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repo
so that you have your own copy that you can modify, then install by cloning the
fork to your machine using one of the commands below, depending on your OS.

> **NOTE**
> Your fork's url will be something like this:
> `https://github.com/<your_github_username>/kickstart.nvim.git`

You likely want to remove `lazy-lock.json` from your fork's `.gitignore` file
too - it's ignored in the kickstart repo to make maintenance easier, but it's
[recommmended to track it in version control](https://lazy.folke.io/usage/lockfile).

#### Clone kickstart.nvim
> **NOTE**
> If following the recommended step above (i.e., forking the repo), replace
> `nvim-lua` with `<your_github_username>` in the commands below

<details><summary> Linux and Mac </summary>

```sh
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

</details>

<details><summary> Windows </summary>

If you're using `cmd.exe`:

```
git clone https://github.com/nvim-lua/kickstart.nvim.git "%localappdata%\nvim"
```

If you're using `powershell.exe`

```
git clone https://github.com/nvim-lua/kickstart.nvim.git "${env:LOCALAPPDATA}\nvim"
```

</details>

### Post Installation

Start Neovim

```sh
nvim
```

That's it! Lazy will install all the plugins you have. Use `:Lazy` to view
current plugin status. Hit `q` to close the window.

Read through the `init.lua` file in your configuration folder for more
information about extending and exploring Neovim. That also includes
examples of adding popularly requested plugins.


### Getting Started

[The Only Video You Need to Get Started with Neovim](https://youtu.be/m8C0Cq9Uv9o)

### FAQ

* What should I do if I already have a pre-existing neovim configuration?
  * You should back it up and then delete all associated files.
  * This includes your existing init.lua and the neovim files in `~/.local`
    which can be deleted with `rm -rf ~/.local/share/nvim/`
* Can I keep my existing configuration in parallel to kickstart?
  * Yes! You can use [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME)`=nvim-NAME`
    to maintain multiple configurations. For example, you can install the kickstart
    configuration in `~/.config/nvim-kickstart` and create an alias:
    ```
    alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
    ```
    When you run Neovim using `nvim-kickstart` alias it will use the alternative
    config directory and the matching local directory
    `~/.local/share/nvim-kickstart`. You can apply this approach to any Neovim
    distribution that you would like to try out.
* What if I want to "uninstall" this configuration:
  * See [lazy.nvim uninstall](https://github.com/folke/lazy.nvim#-uninstalling) information
* Why is the kickstart `init.lua` a single file? Wouldn't it make sense to split it into multiple files?
  * The main purpose of kickstart is to serve as a teaching tool and a reference
    configuration that someone can easily use to `git clone` as a basis for their own.
    As you progress in learning Neovim and Lua, you might consider splitting `init.lua`
    into smaller parts. A fork of kickstart that does this while maintaining the 
    same functionality is available here:
    * [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim)
  * Discussions on this topic can be found here:
    * [Restructure the configuration](https://github.com/nvim-lua/kickstart.nvim/issues/218)
    * [Reorganize init.lua into a multi-file setup](https://github.com/nvim-lua/kickstart.nvim/pull/473)

### Install Recipes

Below you can find OS specific install instructions for Neovim and dependencies.

After installing all the dependencies continue with the [Install Kickstart](#Install-Kickstart) step.

#### Windows Installation

<details><summary>Windows with Microsoft C++ Build Tools and CMake</summary>
Installation may require installing build tools and updating the run command for `telescope-fzf-native`

See `telescope-fzf-native` documentation for [more details](https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation)

This requires:

- Install CMake and the Microsoft C++ Build Tools on Windows

```lua
{'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
```
</details>
<details><summary>Windows with gcc/make using chocolatey</summary>
Alternatively, one can install gcc and make which don't require changing the config,
the easiest way is to use choco:

1. install [chocolatey](https://chocolatey.org/install)
either follow the instructions on the page or use winget,
run in cmd as **admin**:
```
winget install --accept-source-agreements chocolatey.chocolatey
```

2. install all requirements using choco, exit previous cmd and
open a new one so that choco path is set, and run in cmd as **admin**:
```
choco install -y neovim git ripgrep wget fd unzip gzip mingw make
```
</details>
<details><summary>WSL (Windows Subsystem for Linux)</summary>

```
wsl --install
wsl
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```
</details>

#### Linux Install
<details><summary>Ubuntu Install Steps</summary>

```
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```
</details>
<details><summary>Debian Install Steps</summary>

```
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip curl

# Now we install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim-linux64
sudo mkdir -p /opt/nvim-linux64
sudo chmod a+rX /opt/nvim-linux64
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# make it available in /usr/local/bin, distro installs to /usr/bin
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/
```
</details>
<details><summary>Fedora Install Steps</summary>

```
sudo dnf install -y gcc make git ripgrep fd-find unzip neovim
```
</details>

<details><summary>Arch Install Steps</summary>

```
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim
```
</details>


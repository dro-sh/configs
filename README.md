# Drosh configuration

My dotfiles for neovim.

## Needs

- [x] Setup Neovim
- [ ] Setup tmux

## Prerequisite

- [Neovim v0.8.3](https://neovim.io/)
- [zsh v5.8.1](https://www.zsh.org/)
- [Patch font for icons](https://github.com/ryanoasis/nerd-fonts)

### Font icons

1. Download any font from [release](https://github.com/ryanoasis/nerd-fonts/releases)
2. Unarchive zip and select any font
3. Confirm installation
4. On Iterm2 open **Settings -> Profilies -> Text**
5. Select at **Non-ASCII Font** new font

## Instalation

1. Install fonts via [instruction](https://github.com/ryanoasis/nerd-fonts/#option-3-install-script)
   a. Patch via any font a
2. Run `git@github.com:dro-sh/configs.git & cd configs & init`

## Update plugins

1. `:PackerUpdate`
2. `:PackerSnapshot packer.lock.nvim`

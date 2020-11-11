# dotfiles
My personal configuration files

## Installation

- Install [YADM](https://yadm.io)
```bash
curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x /usr/local/bin/yadm
```
- `yadm clone --bootstrap https://github.com/chakrihacker/dotfiles.git`

## Description

Here's what is the bootstrap is doing:

- Install zsh with [oh-my-zsh](https://ohmyz.sh/) as a plugin manager
- Install all the packages/apps from `.Brewfile` using [Homebrew](https://brew.sh)

## Manual things to do after

- Set the homebrew zsh as the default shell

```bash
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)
```

- Delete `/usr/local/bin/yadm` and run `brew bundle` again to get `yadm` set up in homebrew properly

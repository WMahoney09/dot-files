# dotfiles
version controlled config for Vim, Zsh &amp; Tmux

## Usage
 - clone this repo **with `--recurse-submodules` flag**
   - [Vundle](https://github.com/VundleVim/Vundle.vim) is a submodule
   - [OhMyZsh](https://github.com/ohmyzsh/ohmyzsh) is a submodule
 - run the `backup_and_install.sh` script
   - moves all of your existing dot files to `~/dotfiles_old/<timestamp>`
   - symlinks dotfiles to `~`
   - don't forget to `source` your new `~/.zshrc`
 - open Vim, and run `:PluginInstall`
   - vim may complain about certain things not being installed, this is expected.
   - when Vundle completes the install, quit and restart vim.
   - there should be no errors this time

```sh
## clone and install
$ cd ~

$ git clone --recurse-submodules git@github.com:WMahoney09/dotfiles.git

$ bash dotfiles/backup_and_install.sh

$ source ~/.zshrc
```

#### Fonts
You may want to use a patched font for everything to look right.

I use [Dank Mono](https://gumroad.com/l/dank-mono).

### undoing this
You can find your previous dot files in `~/dotfiles_old/<timestamp>`
1. You'll want to `unlink` the relevant "dotfile(s)" _or delete them_
1. Copy or move the back up of the relevant "dotfile(s)" from `~/dotfiles_old/<timestamp>` back to `~`
1. Enjoy the familiarity of your old config :relaxed:

# dotfiles
version controlled config for Vim, Zsh &amp; Tmux

## Usage
- clone this repository in your home directory (`~`)
- make the `backup_and_install.sh` script executable and run it
```sh
$ cd ~

$ chmod +x backup_and_install.sh

$ backup_and_install.sh
```
   - This will create a back up of your existing dot files
   - symlinks will be created in your `~` directory pointing to `~/dotfiles/`
- From `~/dotfiles/` use `git fetch` to check for updates, and `git pull` to apply them
   - You do not need to re-run the install script for changes to take effect.
   - :warning: Re-running the install script will overrite your backups with "new backups"

### undoing this
You can find your previous dot files in `~/dotfiles_old/`
1. You'll want to `unlink` the relevant "dotfile(s)"
1. Copy or move the back up of the relevant "dotfile(s)" from `~/dotfiles_old/` back to `~`
1. Enjoy the familiarity of your old config :relaxed:

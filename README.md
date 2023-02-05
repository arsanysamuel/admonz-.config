# dotfiles

Configuration files for my ArchLinux setup, DWM and ST sources, shell scripts and a full package list. 

Including config files for:
- X11 (with startup programs)
- bash
- nnn
- Arduino CLI
- dunst (Notification Daemon)
- mimi (MIME filetypes)
- mpd
- mpv
- ncmpcpp
- neomutt
- newsboat
- neovim
- qutebrowser
- ranger
- transmission
- stig (transmission terminal client)
- sxhkd
- sxiv
- youtube-dl
- zathura
- pikaur (AUR helper)

### Usage:
Clone the bare repo and checkout
```
git clone --bare git@github.com:arsanysamuel/dotfiles.git $HOME/.dotfiles
git --work-tree=$HOME --git-dir=$HOME/.dotfiles/ checkout -f
rm -f LICENSE README.md
git --work-tree=$HOME --git-dir=$HOME/.dotfiles/ update-index --skip-worktree LICENSE README.md
git --work-tree=$HOME --git-dir=$HOME/.dotfiles/ config --local status.showUntrackedFiles no
```
The repo git command is aliased to `dotfiles` in `.bashrc`.

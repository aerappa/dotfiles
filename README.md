# Dotfiles Repository

This repository contains my personal configuration files (dotfiles) for various tools like Fish, Git, Neovim, and Tmux. These configurations can be easily managed and deployed using GNU Stow.

## Directory Structure

The repository is organized as follows:

```
.
├── fish/
│   └── .config/
│       └── fish/
│           ├── conf.d/
│           │   └── omf.fish
│           ├── config.fish
│           ├── fish_greeting.fish
│           ├── fish_variables
│           └── functions/
│               ├── fish_user_key_bindings.fish
│               └── fzf_key_bindings.fish
├── git/
│   └── .gitconfig
├── nvim/
│   └── .config/
│       └── nvim/
│           ├── init.lua
│           ├── lazy-lock.json
│           └── spell/
│               ├── en.utf-8.add
│               └── en.utf-8.add.spl
└── tmux/
    └── .tmux.conf
```


## Usage

### Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/): A symlink farm manager, used for applying and managing dotfiles.

### Applying Dotfiles

***Warning: You must clone the repository in your home directory!***
To apply the dotfiles (e.g., for `fish`), navigate to the root of this repository and use GNU Stow:

```
cd ~/dotfiles
stow fish
```

This will create the necessary symlinks in your home directory (e.g., `~/.config/fish` pointing to `dotfiles/fish/.config/fish`).

### Managing Individual Applications

To manage configurations for individual applications, use Stow with the specific directory name. For example, for Git:

```
stow git
```

And for Neovim:

```
stow nvim
```

### Removing Dotfiles

If you wish to remove the symlinks, you can do so with Stow's delete command. For example:

```
stow -D fish
```

## Customization

Feel free to customize the configurations to fit your preferences. The files are organized to make navigation and edits straightforward.

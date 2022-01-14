## Quick how-to

- 🚀 `stow <directory>` is enough add the desired configuration to your system.
- ⛔ `stow` will warn you before breaking anything (if you have dotfiles for
  that program already).
- 🔐 `filename.local` files are placeholders for `filename` files, that are not
  tracked.

## Install

1. Clone the repo.
2. Set-up `stow` with `stow -t ~ stow`, so it is easier to use.
3. Install whatever module you want by doing `stow <directory>`.
   - Check if there are any `*.local` files in there and set those up before
     you stow.

Dotfiles can be refreshed by running `stow <directory>` again, if any files are
added to the repo and need to be symlinked.

## How these are organized

The dotfiles are organized per program, each folder following a structure with
`$HOME` as root.
This is done so that `stow` is easy to use to set them up.

### Stow

`stow` is a super awesome to manage symlinks.
Well suited for managing dotfiles because of that.
Just [read the
docs](https://www.gnu.org/software/stow/manual/html_node/index.html).

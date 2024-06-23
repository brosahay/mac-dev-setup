#!/bin/bash

set -x

function backup_dotfiles()
{
  local BACKUP_DIR_DOTFILES="../dotfiles";
  for file in ~/.{path,exports,aliases,functions,extra,gitignore,gitconfig,zshrc}; do
    [ -r "$file" ] && [ -f "$file" ] && cp "$file" "$BACKUP_DIR_DOTFILES";
  done;
  unset file;
}

function backup_brew()
{
  local BACKUP_DIR_PACKAGES="../packages";
  brew list --formula -1 > "$BACKUP_DIR_PACKAGES/brew-install.list";
  brew list --cask -1 > "$BACKUP_DIR_PACKAGES/brew-cask-install.list";
}

configfiles=("compton.conf" "termite")
backup_dotfiles() {
  echo "starting backup\n"
  ls -tA "$DOTFILES/manualBack" | while read f; do
    if (($configfiles[(I)$f])); then
      src="$HOME/.config/$f"
    else
      src="$HOME/$f"
    fi
    if [ -f "$f" ]; then
      echo "$f\n"
      rsync -a $src "$DOTFILES/manualBack/$f"
    fi
    if [ -d "$f" ]; then
      echo $(tree "$f\n")
      rsync -a $src "$DOTFILES/manualBack/$f"
    fi
  done
}
backup_dotfiles;

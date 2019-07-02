backup_dotfiles() {
  echo "starting backup\n"
  ls -tA "$DOTFILES/manualBack" | while read f; do
    if [ -f "$f" ]; then
      echo "$f\n"
      rsync -a "$HOME/$f" "$DOTFILES/manualBack/$f"
    fi
    if [ -d "$f" ]; then
      echo $(tree "$f\n")
      rsync -a "$HOME/$f" "$DOTFILES/manualBack/$f"
    fi
  done
}
backup_dotfiles;

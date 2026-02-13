#!/bin/bash 
VAULT_DIR="$HOME/projects/Obsidian/The Begining" 
cd "$VAULT_DIR/inbox" || exit 
for file in *.md; do 
  [ -e "$file" ] || continue
  tag=$(grep -A 1 "tags:" "$file" | tail -n 1 | sed 's/- //' | xargs)
  if [ -n "$tag" ] && [ "$tag" != "-" ]; then
    mkdir -p "../$tag"
    mv "$file" "../$tag/"
    echo "Organized $file into $tag/"
  fi 
done

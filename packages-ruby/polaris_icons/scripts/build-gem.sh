#!/usr/bin/env bash
set -e

function abs_path {
  old_pwd=$(pwd)
  cd "$1" && full_path=$(pwd)
  cd "$old_pwd"
  echo "$full_path"
}


function recursive_find_file {
  path=$(abs_path "$1")
  while [[ "$path" != "" && ! -e "$path/$2" ]]; do
    path=${path%/*}
  done
  echo "$path"
}

script_dir=$(abs_path "$(dirname "${BASH_SOURCE[0]}")")
gem_root=$(recursive_find_file "$script_dir" "polaris_icons.gemspec")
proj_root=$(recursive_find_file "$script_dir" "dev.yml")

mkdir -p "$gem_root/images/pdf/"

for file in "$proj_root"/packages/polaris-icons-raw/icons/polaris/*.svg; do
  rsvg-convert -f pdf -o $(echo "$file" | sed -e 's/.svg$/.pdf/' -e "s#$proj_root/packages/polaris-icons-raw/icons/polaris\/#$gem_root/images/pdf/#") "$file"
  echo "Converted $file"
done

cd $gem_root && bundle exec rake build

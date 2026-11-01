#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

remove_placeholder() {
  local dir="$1"
  if [[ -f "$dir/README.md" ]] && [[ "$(find "$dir" -mindepth 1 -maxdepth 1 ! -name README.md | wc -l | tr -d ' ')" == "0" ]]; then
    rm "$dir/README.md"
  fi
}

for dir in backend frontend android; do
  if [[ -d "$dir" ]] && [[ -f "$dir/composer.json" || -f "$dir/package.json" || -f "$dir/pubspec.yaml" ]]; then
    echo "Folder $dir sudah berisi proyek. Melewati bootstrap untuk menjaga file yang ada."
  fi
done

if [[ ! -f backend/composer.json ]]; then
  command -v composer >/dev/null 2>&1 || { echo "Composer belum terpasang. Install PHP + Composer terlebih dahulu."; exit 1; }
  remove_placeholder backend
  composer create-project laravel/laravel backend
else
  echo "Laravel sudah ada di backend/. Lewati."
fi

if [[ ! -f frontend/package.json ]]; then
  command -v npx >/dev/null 2>&1 || { echo "Node.js/npm/npx belum terpasang."; exit 1; }
  remove_placeholder frontend
  npx create-next-app@latest frontend --yes --ts --tailwind --eslint --app --src-dir --import-alias "@/*"
else
  echo "Next.js sudah ada di frontend/. Lewati."
fi

if [[ ! -f android/pubspec.yaml ]]; then
  command -v flutter >/dev/null 2>&1 || { echo "Flutter SDK belum terpasang."; exit 1; }
  remove_placeholder android
  flutter create --project-name relawan_app --org id.ac.komunitas.relawan android
else
  echo "Flutter sudah ada di android/. Lewati."
fi

echo "Bootstrap selesai. Baca docs/teknis dan sesuaikan environment."

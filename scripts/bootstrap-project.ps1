$ErrorActionPreference = "Stop"
Set-Location (Join-Path $PSScriptRoot "..")

function Remove-Placeholder([string]$Directory) {
    $readme = Join-Path $Directory "README.md"
    if (Test-Path $readme) {
        $others = Get-ChildItem -Force $Directory | Where-Object { $_.Name -ne "README.md" }
        if (-not $others) { Remove-Item $readme -Force }
    }
}

if (-not (Test-Path "backend/composer.json")) {
    if (-not (Get-Command composer -ErrorAction SilentlyContinue)) { throw "Composer belum terpasang. Install PHP + Composer terlebih dahulu." }
    Remove-Placeholder "backend"
    composer create-project laravel/laravel backend
} else { Write-Host "Laravel sudah ada di backend/. Lewati." }

if (-not (Test-Path "frontend/package.json")) {
    if (-not (Get-Command npx -ErrorAction SilentlyContinue)) { throw "Node.js/npm/npx belum terpasang." }
    Remove-Placeholder "frontend"
    npx create-next-app@latest frontend --yes --ts --tailwind --eslint --app --src-dir --import-alias "@/*"
} else { Write-Host "Next.js sudah ada di frontend/. Lewati." }

if (-not (Test-Path "android/pubspec.yaml")) {
    if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) { throw "Flutter SDK belum terpasang." }
    Remove-Placeholder "android"
    flutter create --project-name relawan_app --org id.ac.komunitas.relawan android
} else { Write-Host "Flutter sudah ada di android/. Lewati." }

Write-Host "Bootstrap selesai. Baca docs/teknis dan sesuaikan environment."

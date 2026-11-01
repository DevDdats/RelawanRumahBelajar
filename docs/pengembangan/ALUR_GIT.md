# Alur Git dan GitHub

## Aturan repository

- `main`: stabil/presentable.
- `develop`: opsional, jika tim memutuskan menggunakannya sebagai integrasi sebelum `main`.
- Kerja melalui branch fitur/perbaikan/dokumentasi.
- Pull request wajib untuk perubahan yang digabung ke branch bersama.

## Workflow

```bash
git checkout main
git pull origin main
git checkout -b feat/modul-ringkasan
# lakukan perubahan
 git status
 git add path/file-yang-relevan
 git commit -m "feat(modul): deskripsi perubahan"
git push -u origin feat/modul-ringkasan
```

Lalu buat PR di GitHub, isi ringkasan dan test plan, minta review, perbaiki, kemudian merge sesuai aturan kelompok.

## Hindari konflik

- Jangan commit file hasil build (`node_modules`, `vendor`, `.next`, `build`, `.dart_tool`).
- Jangan commit `.env` atau credential.
- Hindari dua anggota mengubah migration yang sama di saat bersamaan.
- Sebelum mengubah kontrak API, beri tahu pemilik modul dan klien terkait.
- Jangan memaksa push (`--force`) ke branch bersama tanpa kesepakatan.
- Pull dan cek konflik sebelum memulai sesi pengerjaan baru.

## Format commit

`feat`, `fix`, `docs`, `test`, `refactor`, `chore`, atau `style` + scope opsional.

Contoh: `feat(pengguna): implementasi validasi profil`.

## GitHub Issues

Setiap issue idealnya memiliki konteks, hasil yang diharapkan, acceptance criteria, owner modul, dependency, dan label. Hindari issue yang terlalu luas seperti "kerjakan semua backend".

# 🗄️ Database Developer Guide

## Teknologi dan prinsip

- Database: MySQL 8.4 LTS sebagai baseline development.
- ORM: Eloquent melalui Laravel.
- Perubahan skema: Laravel migrations.
- Data contoh: Laravel seeders/factories berisi data fiktif.
- Dokumentasi struktur: `docs/database/RANCANGAN_DATABASE.md`.

## Aturan schema

1. Tentukan kebutuhan field berdasarkan requirement dan proses bisnis yang disetujui.
2. Gunakan nama tabel/kolom yang konsisten; ikuti konvensi Laravel kecuali ada alasan kuat.
3. Terapkan foreign key, index, unique constraint, nullability, dan default dengan sengaja.
4. Jangan simpan password dalam bentuk plaintext.
5. Hindari menyimpan data pribadi anak/keluarga yang tidak diperlukan.
6. Tanggal/waktu harus memiliki aturan zona waktu yang jelas; aplikasi menggunakan konteks Asia/Jakarta.
7. Untuk data yang memiliki siklus status, dokumentasikan nilai status dan transisi yang diizinkan.
8. Jangan menghapus/menulis ulang migration yang sudah digunakan bersama; tambahkan migration baru.

## Development commands

Jalankan dari backend:

```bash
php artisan make:model NamaModel -m
php artisan make:seeder NamaSeeder
php artisan migrate
php artisan migrate:status
php artisan db:seed
php artisan migrate:fresh --seed  # HANYA database lokal/dummy; menghapus semua tabel!
```

Jangan menjalankan `migrate:fresh` pada database yang berisi data penting atau milik anggota lain.

## Siklus perubahan tabel

1. Buat migration.
2. Perbarui model/relasi dan validation request.
3. Perbarui API Resource/endpoint jika kontrak berubah.
4. Perbarui `RANCANGAN_DATABASE.md` dan `KONTRAK_API.md` bila relevan.
5. Buat test.
6. Sertakan instruksi migration dalam pull request.
## Referensi resmi

- MySQL 8.4 Reference Manual: https://dev.mysql.com/doc/refman/8.4/en/
- Laravel migrations: https://laravel.com/docs/migrations
- Laravel Eloquent: https://laravel.com/docs/eloquent

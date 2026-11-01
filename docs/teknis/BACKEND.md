# ⚙️ Backend Developer Guide — Laravel REST API

## 1. Tanggung jawab

- Mengimplementasikan autentikasi dan otorisasi yang otoritatif.
- Menyediakan API untuk website dan Android.
- Menempatkan aturan bisnis di backend, melakukan validasi request, dan menangani transaksi.
- Mengelola migrations, models, seeders, policies, dan tests.
- Menjaga response API konsisten serta memperbarui dokumentasi endpoint.

## 2. Struktur Laravel yang disarankan

```text
backend/
├── app/
│   ├── Http/Controllers/Api/V1/
│   ├── Http/Requests/
│   ├── Http/Resources/
│   ├── Models/
│   ├── Policies/
│   └── Services/                   # hanya bila logika layak dipisah
├── database/
│   ├── factories/
│   ├── migrations/
│   └── seeders/
├── routes/api.php
├── tests/Feature/
├── tests/Unit/
├── .env                            # jangan commit
└── composer.json
```

Jangan membuat lapisan service/repository hanya untuk meneruskan panggilan tanpa nilai tambah. Ikuti pola tim dan hindari class terlalu besar.

## 3. Setup lokal

```bash
cd backend
cp .env.example .env        # PowerShell: Copy-Item .env.example .env
composer install
php artisan install:api  # siapkan routes/api.php dan Sanctum pada skeleton Laravel yang mendukung command ini
php artisan key:generate
```

Atur environment database agar cocok dengan Compose bila backend dijalankan di host:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3307
DB_DATABASE=relawan_db
DB_USERNAME=relawan_user
DB_PASSWORD=ganti_password_development
```

Ketika backend berjalan **di dalam Docker**, `DB_HOST` harus `mysql` dan `DB_PORT=3306`. Jalankan migration setelah skema disetujui:

```bash
php artisan migrate
php artisan db:seed
php artisan test
```

Jika memakai Docker, jalankan command dengan `docker compose --profile apps run --rm backend php artisan ...` setelah service siap.

## 4. Aturan API

- Prefix `/api/v1`.
- Gunakan Form Request untuk validasi payload yang cukup kompleks.
- Gunakan API Resource atau bentuk response terstandar.
- Pakai HTTP status sesuai makna; jangan selalu mengembalikan 200.
- Jangan mengekspos password hash, token, data internal, atau atribut model yang tidak diperlukan.
- Jangan percaya `user_id`, `role`, dan pemilik resource dari request body; derive identitas dari user yang terautentikasi.
- Gunakan Policies/Gates atau permission middleware untuk resource privat.
- Batasi operasi sensitif dengan rate limiting sesuai risiko.

## 5. Auth dan permission

Laravel Sanctum menjadi opsi baseline. Tentukan secara eksplisit:

- Website: session berbasis cookie/CSRF jika memakai pola SPA yang didukung; domain, CORS, dan stateful domains harus disiapkan dengan benar.
- Android: token API, disimpan di secure storage; logout harus mencabut token yang digunakan.
- Password: gunakan hashing bawaan framework, jangan membuat hash sendiri.
- Role/permission: finalkan tabel atau package setelah kelompok menyepakati strategi. Hindari duplikasi definisi role di banyak tempat.
- Setiap endpoint admin harus menolak role tanpa izin walaupun request dibuat melalui Postman/cURL.

## 6. Migration dan seeding

- Satu perubahan skema = migration baru; jangan mengubah database rekan secara manual tanpa migration.
- Jangan mengedit migration yang sudah dipakai bersama setelah orang lain menerapkannya; buat migration koreksi.
- Seeder development harus memakai data dummy dan idempotent jika memungkinkan.
- Jangan commit dump data pribadi.
- Gunakan foreign key, unique constraints, index, dan transaksi berdasarkan kebutuhan domain.

## 7. Error response

Gunakan bentuk JSON konsisten. Kontrak awal:

```json
{
  "message": "Validasi gagal.",
  "errors": {
    "email": ["Format email tidak valid."]
  }
}
```

Jangan mengembalikan stack trace pada response production. Detail tambahan dibatasi pada environment lokal.

## 8. Pengujian minimum

- Unit test untuk aturan bisnis yang kompleks.
- Feature test untuk endpoint, status HTTP, validation, auth, permission, dan perubahan database.
- Test positif (role berhak) dan negatif (tanpa login/role salah).
- Test migration/seed dari database bersih.
- Jalankan `php artisan test` sebelum pull request.

## 9. Checklist pull request

- [ ] Endpoint tercatat di `docs/api/KONTRAK_API.md`.
- [ ] Validation dan authorization di backend.
- [ ] Migration + seeder/test diperbarui bila perlu.
- [ ] Response tidak membocorkan atribut pribadi/secret.
- [ ] Error codes dan status HTTP konsisten.
- [ ] Test lulus dan tidak ada `.env` pada commit.
## 10. Referensi resmi

- Laravel documentation: https://laravel.com/docs
- Laravel Sanctum: https://laravel.com/docs/sanctum
- Laravel validation: https://laravel.com/docs/validation
- Laravel authorization: https://laravel.com/docs/authorization
- Eloquent ORM: https://laravel.com/docs/eloquent

# Arsitektur Sistem

## 1. Tujuan

Menyediakan satu platform manajemen relawan pengajar dan rumah belajar inklusif yang bisa diakses melalui website serta aplikasi Android. Website memuat informasi publik, area pengguna, dan admin dashboard. Android difokuskan pada kebutuhan pengguna; tidak ada admin dashboard pada aplikasi Android.

## 2. Tanggung jawab setiap lapisan

| Lapisan | Tanggung jawab | Tidak boleh dilakukan |
|---|---|---|
| Next.js | UI, navigasi, validasi ringan untuk UX, pemanggilan API | Mengakses database secara langsung atau menjadi satu-satunya penjaga izin |
| Flutter | UI Android, input/form, status loading/error, menyimpan token dengan aman, pemanggilan API | Mengakses database secara langsung |
| Laravel | autentikasi, otorisasi, validasi otoritatif, aturan bisnis, transaksi, audit log yang diperlukan | Mempercayai role/user_id dari input tanpa verifikasi |
| MySQL | penyimpanan relasional dan integritas data | Dijadikan endpoint publik langsung |
| Docker Compose | menyediakan lingkungan development yang konsisten | Menyimpan secret produksi di repository |

## 3. Aliran request

1. Pengguna membuka website atau aplikasi Android.
2. Klien mengirim HTTP request ke endpoint Laravel `/api/v1/...`.
3. Laravel memvalidasi token/session, role dan permission, payload, serta status domain.
4. Laravel memproses operasi dan membaca/menulis MySQL melalui model/migration.
5. API mengembalikan response JSON dengan status HTTP yang sesuai.
6. UI menampilkan hasil, loading, empty state, atau error secara ramah pengguna.

## 4. Identitas dan hak akses

Role awal yang disebutkan dalam kebutuhan:

- **Admin Komunitas** — mengelola data dan operasional sistem sesuai kewenangan.
- **Relawan Pengajar** — mengakses profil dan fitur yang berkaitan dengan relawan.
- **Publik/Orang Tua** — melihat informasi publik; fitur yang membutuhkan akun mengikuti keputusan kebutuhan sistem.

Rincian permission per modul wajib disepakati dalam matriks akses. Jangan menganggap semua orang tua harus punya akun sebelum kebutuhan itu tervalidasi. Endpoint privat wajib diperiksa di backend.

## 5. Authentication approach

Gunakan Laravel Sanctum. Pilih dan dokumentasikan mekanisme web setelah menentukan apakah frontend berjalan sebagai SPA pada domain yang mendukung cookie/CSRF atau menggunakan token. Untuk Flutter, alur token API biasanya lebih sederhana. Token mobile harus disimpan dengan mekanisme secure storage; jangan simpan password.

## 6. Versioning dan kompatibilitas

- Prefix endpoint: `/api/v1`.
- Setiap perubahan response yang breaking harus disepakati dan didokumentasikan.
- Jangan mengganti nama field diam-diam.
- Next.js dan Flutter menggunakan kontrak API yang sama.
- Gunakan migrations dan seeders agar semua anggota memiliki struktur data yang sama.

## 7. Keputusan yang harus dicatat

- Domain deployment dan strategi CORS/CSRF.
- Finalisasi modul dan permission matrix.
- Definisi status dan transisi tiap proses.
- Kebijakan penyimpanan/penghapusan data pribadi.
- Strategi backup dan lokasi file upload (jika fitur upload dipakai).

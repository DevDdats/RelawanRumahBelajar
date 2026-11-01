# Roadmap Pengerjaan

Urutan berikut adalah usulan dependency; tim bisa mengatur timeline aktual mengikuti jadwal TA.

## Tahap 1 — Analisis dan kesepakatan

- [ ] Validasi kebutuhan dari wawancara/dokumen.
- [ ] Finalisasi role, modul, use case, dan batas sistem.
- [ ] Susun matriks modul dan permission.
- [ ] Konfirmasi stack, domain data, dan status proses.

## Tahap 2 — Fondasi repository

- [ ] Bootstrap Laravel, Next.js, Flutter.
- [ ] Jalankan MySQL melalui Docker Compose.
- [ ] Atur `.env` lokal yang tidak di-commit.
- [ ] Sepakati branch, commit, review, dan aturan file.
- [ ] Buat response API standar, CORS/CSRF, dan strategi autentikasi.

## Tahap 3 — Fondasi data dan akses

- [ ] Buat migrations dan seeders awal.
- [ ] Implementasi login/logout, role, permission, serta profile sesuai modul.
- [ ] Tulis test autentikasi dan akses terlarang.
- [ ] Sambungkan website dan Android ke endpoint dasar.

## Tahap 4 — Implementasi modul inti

- [ ] Bangun setiap modul mengikuti matriks modul.
- [ ] Perbarui kontrak API dan rancangan database per PR.
- [ ] Pastikan website dan Android menggunakan API yang sama.
- [ ] Lakukan integrasi dan review antaranggota.

## Tahap 5 — Pengujian end-to-end

- [ ] Uji alur per aktor dan per role.
- [ ] Uji validasi, status, skenario gagal, dan akses langsung ke endpoint.
- [ ] Uji pada ukuran layar yang relevan dan perangkat/emulator Android.
- [ ] Lakukan uji regresi setelah migration atau perubahan kontrak API.

## Tahap 6 — Persiapan presentasi/deployment

- [ ] Siapkan data demonstrasi non-pribadi.
- [ ] Tulis panduan instalasi dan akun demo secara terpisah dari repository publik.
- [ ] Backup database demonstrasi jika diperlukan.
- [ ] Pastikan aplikasi dapat dijalankan dari petunjuk README.
- [ ] Dokumentasikan batasan, hasil pengujian, dan pekerjaan lanjutan.

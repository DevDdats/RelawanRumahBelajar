# Panduan Anggota — Sannatthariq Annizemi Achmed Deedat

## Penugasan yang diketahui

**Modul 1: Manajemen Pengguna dan Hak Akses.** Cakupan awal: registrasi/login (sesuai role yang perlu akun), profil, dan role/permission untuk Admin Komunitas, Relawan Pengajar, serta Publik/Orang Tua. Rincian final harus mengikuti hasil analisis dan kesepakatan kelompok.

Penanggung jawab modul bertanggung jawab mengoordinasikan alur modul end-to-end, bukan hanya satu layer. Kolaborasi dengan anggota lain diperbolehkan.

## Hasil kerja minimum modul

- [ ] Requirement dan acceptance criteria disepakati.
- [ ] Matriks role-permission untuk tiap aksi dibuat.
- [ ] Alur registrasi/login/logout dan profil terdokumentasi.
- [ ] Migration/model yang diperlukan dibuat dan direview.
- [ ] Endpoint auth/profile dicatat dalam kontrak API.
- [ ] UI website yang relevan dibuat atau dikoordinasikan.
- [ ] Android menggunakan endpoint yang sama untuk fitur pengguna yang masuk scope.
- [ ] Backend memverifikasi authentication dan permission.
- [ ] Test untuk success, invalid input, guest, role salah, dan akses resource orang lain dibuat.
- [ ] Panduan demo menggunakan akun fiktif diperbarui.

## Dependensi

- Kesepakatan auth website: cookie/CSRF atau mekanisme yang dipilih setelah review.
- Laravel Sanctum untuk API baseline.
- Kontrak API bersama anggota yang mengerjakan backend/client.
- Keputusan apakah Publik/Orang Tua harus memiliki akun untuk fitur tertentu.

## Larangan/risiko yang perlu dihindari

- Jangan menyimpan password plaintext.
- Jangan percaya role yang dikirim dari frontend.
- Jangan membuat API admin tanpa middleware/policy.
- Jangan log bearer token atau data profil sensitif.
- Jangan memakai data anak/keluarga asli dalam seed.

## Update pekerjaan

Untuk tiap PR, cantumkan status requirement, endpoint yang berubah, migration, test, dan cara menguji. Update matriks modul ketika scope disepakati berubah.

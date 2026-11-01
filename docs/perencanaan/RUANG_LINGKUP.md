# Ruang Lingkup Sistem (Draft)

## Tujuan produk

Mengembangkan platform web untuk membantu pengelolaan relawan pengajar dan rumah belajar inklusif anak prasejahtera, dengan akses melalui website dan aplikasi Android khusus pengguna.

## Aktor awal

1. Admin Komunitas.
2. Relawan Pengajar.
3. Publik/Orang Tua.

Aktor, kebutuhan login, dan permission harus diperiksa kembali dengan hasil wawancara serta kesepakatan tim.

## Cakupan awal yang diusulkan

- Registrasi/login dan pengelolaan profil serta hak akses.
- Pengelolaan data relawan.
- Pengelolaan data rumah belajar.
- Pengelolaan informasi kegiatan/jadwal belajar.
- Alur pendaftaran/partisipasi relawan pada kegiatan apabila dibutuhkan oleh proses bisnis.
- Informasi yang dapat dilihat publik dan informasi yang memerlukan login.
- Area admin untuk operasi sesuai permission.
- Aplikasi Android yang mengakses fitur pengguna melalui API yang sama.
- Pengujian fungsi inti, hak akses, serta konsistensi data antarklien.

Daftar tersebut **bukan requirement final**. Jangan membangun fitur yang belum disetujui hanya karena tercantum di draft.

## Di luar cakupan default

- Aplikasi Android untuk admin.
- Chat real-time, pembayaran, peta, notifikasi push, tanda tangan digital, atau integrasi pihak ketiga, kecuali ada requirement terverifikasi.
- Produksi dengan data asli anak sebelum izin, dasar pemrosesan, dan kebijakan keamanan ditentukan.

## Kriteria sukses awal

- Fungsi prioritas berjalan end-to-end pada website dan endpoint API.
- Fitur pengguna prioritas dapat diakses dari Android.
- Pembatasan akses diuji di backend, bukan hanya di UI.
- Migration dapat dijalankan dari database kosong.
- Dokumentasi setup dan alur modul bisa diikuti anggota lain.
- Semua requirement inti memiliki skenario pengujian.

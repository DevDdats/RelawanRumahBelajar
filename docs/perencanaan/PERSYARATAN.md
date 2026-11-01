# Kebutuhan Sistem (Draft untuk Validasi)

## Kebutuhan fungsional

| ID | Kebutuhan | Prioritas | Status |
|---|---|---:|---|
| FR-01 | Sistem mengenali role Admin Komunitas, Relawan Pengajar, dan Publik/Orang Tua sesuai keputusan login final | Tinggi | Validasi |
| FR-02 | Pengguna yang memerlukan akun dapat login/logout dengan aman | Tinggi | Draft |
| FR-03 | Pengguna dapat melihat dan memperbarui profil yang menjadi haknya | Tinggi | Draft |
| FR-04 | Admin dapat mengelola data sesuai permission yang ditetapkan | Tinggi | Draft |
| FR-05 | Sistem memiliki pengelolaan relawan pengajar | Tinggi | Draft |
| FR-06 | Sistem memiliki data rumah belajar | Tinggi | Draft |
| FR-07 | Sistem dapat menampilkan informasi kegiatan/jadwal sesuai status akses | Sedang | Draft |
| FR-08 | Website dan Android mengakses data melalui satu backend API | Tinggi | Baseline arsitektur |
| FR-09 | Sistem menampilkan validasi, loading, empty state, dan pesan kesalahan yang mudah dipahami | Tinggi | Baseline UI |
| FR-10 | Perubahan penting pada data memiliki aturan audit/riwayat bila kebutuhan mengharuskan | Sedang | Perlu keputusan |

Pemilik requirement perlu menambahkan aktor, precondition, alur utama, alur alternatif, aturan status, acceptance criteria, dan sumber (wawancara/dokumen) sebelum dianggap final.

## Kebutuhan nonfungsional

- **Keamanan:** otorisasi backend, hash password framework, validasi server-side, rahasia di environment, rate limit untuk endpoint sensitif.
- **Privasi:** minimalkan data anak dan keluarga yang dikumpulkan; jangan memakai data nyata pada development; batasi akses berdasarkan kebutuhan tugas.
- **Kegunaan:** navigasi bahasa Indonesia, formulir jelas, responsif pada mobile, pesan error yang dapat ditindaklanjuti.
- **Reliabilitas:** transaksi database untuk perubahan multi-tabel, penanganan kegagalan API, backup sesuai kebijakan.
- **Maintainability:** penamaan konsisten, tests, migrations, dokumentasi API, code review.
- **Portabilitas:** lingkungan development utama tersedia lewat Docker Compose dan langkah setup lintas sistem operasi.
- **Aksesibilitas:** label form, kontras yang cukup, kontrol yang dapat dioperasikan, dan teks alternatif jika relevan.

## Template requirement terperinci

```text
ID:
Nama:
Sumber requirement:
Aktor:
Tujuan:
Precondition:
Alur utama:
Alur alternatif/exception:
Aturan bisnis:
Data yang dibaca/ditulis:
Role/permission:
Acceptance criteria:
Skenario uji:
Status: Draft / Disetujui / Diimplementasikan / Diuji
```

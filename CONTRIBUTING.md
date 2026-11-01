# Panduan Kontribusi Kelompok

## Prinsip kerja

1. Pembagian utama pekerjaan mengikuti **modul sistem**, bukan memisahkan anggota secara permanen menjadi frontend/backend/database.
2. Setiap modul memiliki penanggung jawab yang mengoordinasikan alur UI website, API, database, pengujian, dan bila relevan Android.
3. Pemilik modul boleh meminta bantuan anggota lain untuk layer tertentu; keputusan skema/API tetap dicatat dan disepakati.
4. Jangan mengubah modul orang lain tanpa diskusi pada issue atau pull request.

## Branch

- `main`: versi stabil yang siap dipresentasikan.
- `develop`: integrasi fitur harian (opsional jika kelompok merasa perlu; sepakati di awal).
- `feat/<modul>-<ringkasan>`: fitur baru, contoh `feat/pengguna-login`.
- `fix/<modul>-<ringkasan>`: perbaikan bug.
- `docs/<ringkasan>`: dokumentasi.

Buat branch dari branch integrasi yang telah disepakati. Jangan langsung push ke `main`.

## Format commit

Gunakan pola sederhana:

- `feat(auth): tambah endpoint login`
- `fix(profile): validasi pembaruan profil`
- `docs(api): perbarui kontrak endpoint`
- `test(user): tambah pengujian hak akses`
- `chore(docker): perbarui service mysql`

## Alur pull request

1. Buat atau pilih GitHub Issue dan definisikan kriteria selesai.
2. Buat branch dengan nama yang sesuai.
3. Kerjakan perubahan satu topik/modul; hindari file format yang tidak berkaitan.
4. Jalankan pemeriksaan sesuai layer: lint/typecheck untuk frontend, test untuk backend, `flutter analyze` untuk Android.
5. Perbarui dokumentasi, kontrak API, migration, atau `.env.example` bila perlu.
6. Push branch dan buka pull request dengan ringkasan, cara menguji, screenshot bila ada perubahan UI, serta catatan risiko/migration.
7. Minimal satu anggota lain melakukan review. Selesaikan komentar sebelum merge.

## Aturan code review

- Jangan masukkan secret, data asli, atau file hasil build.
- Periksa otorisasi backend untuk operasi yang mengubah data.
- Pastikan migration dapat dijalankan dari database kosong.
- Jangan mengubah respons API tanpa memperbarui kontrak API dan konsumen terkait.
- Hindari duplikasi aturan bisnis pada website dan Android; aturan bisnis utama berada di Laravel.

## Sebelum merge

- [ ] Kriteria issue terpenuhi.
- [ ] Tidak ada secret atau data pribadi di commit.
- [ ] Tes/lint yang relevan lulus.
- [ ] Dokumentasi diperbarui.
- [ ] Tidak ada migration atau perubahan API yang belum diberitahukan ke kelompok.
- [ ] Reviewer menyetujui PR.

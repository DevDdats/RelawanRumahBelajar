# Strategi Pengujian

## Prinsip

Pengujian harus mengikuti acceptance criteria setiap modul dan memeriksa hasil positif maupun negatif. UI tidak cukup diuji hanya melalui screenshot; endpoint dan aturan akses juga perlu diuji.

## Backend Laravel

- Feature test endpoint: status HTTP, response shape, validasi, dan efek database.
- Auth tests: guest, token/session valid, token invalid/expired.
- Authorization tests: role berhak vs role tidak berhak, termasuk resource milik user lain.
- Database tests: constraint, relasi, transaksi, serta migration dari kondisi bersih.
- Rule/domain tests: status/transisi dan aturan yang memiliki banyak cabang.

Jalankan `php artisan test`.

## Website Next.js

- Lint/typecheck/build sesuai scripts yang tersedia.
- Test halaman publik, login, form validation, empty/loading/error states, dan navigasi.
- Pastikan API 401/403/422/5xx ditangani.
- Cek aksesibilitas dasar: label, keyboard, focus, kontras.
- Cek breakpoint mobile/desktop.

## Flutter

- Jalankan `flutter analyze` dan `flutter test`.
- Uji parsing response dan error networking.
- Uji alur login/logout, expired token, retry, loading, dan empty state.
- Uji pada emulator dan setidaknya satu perangkat nyata bila tersedia.

## Integrasi end-to-end

- Perubahan yang dibuat dari website terlihat konsisten di Android dan sebaliknya.
- Pengguna tanpa izin tidak dapat memanggil API terproteksi melalui klien lain.
- Migration dapat dijalankan di database baru.
- Uji koneksi ketika API tidak tersedia atau jaringan lambat.
- Gunakan data dummy; tidak perlu memakai data anak/keluarga nyata.

## Template skenario uji

```text
ID skenario:
Requirement/modul:
Aktor/role:
Precondition:
Langkah:
Data uji (dummy):
Hasil yang diharapkan:
Hasil aktual:
Status: Pass / Fail / Blocked
Bukti:
```

## Definition of Done

- Acceptance criteria terpenuhi.
- Test layer terkait lulus.
- Tidak ada bug blocker yang diketahui.
- Permission dan negative cases diuji.
- Dokumentasi serta kontrak API diperbarui.
- PR direview dan dapat dijalankan dari petunjuk repo.

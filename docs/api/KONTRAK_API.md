# Kontrak REST API (Draft)

Dokumen ini adalah aturan integrasi awal, bukan daftar endpoint final. Tambahkan endpoint setelah requirement dan modul disetujui.

## Konvensi

- Base URL lokal: `http://localhost:8000/api/v1`.
- Format: JSON; request yang mengirim JSON memakai `Content-Type: application/json`.
- Response membaca JSON dengan header `Accept: application/json`.
- Encoding UTF-8.
- Waktu API sebaiknya ISO 8601; format dan zona waktu harus konsisten.
- Gunakan pagination untuk koleksi yang berpotensi panjang.
- Jangan mengembalikan field sensitif atau atribut internal model secara otomatis.

## Bentuk response yang disarankan

Sukses satu resource:

```json
{
  "data": {
    "id": 1,
    "name": "Nama contoh"
  },
  "message": "Data berhasil dimuat."
}
```

Sukses koleksi (format pagination harus distandarkan implementasi):

```json
{
  "data": [],
  "meta": {
    "current_page": 1,
    "per_page": 10,
    "total": 0,
    "last_page": 1
  }
}
```

Validasi gagal:

```json
{
  "message": "Validasi gagal.",
  "errors": {
    "email": ["Format email tidak valid."]
  }
}
```

## Status HTTP

| Status | Kapan digunakan |
|---|---|
| 200 | Request berhasil dan mengembalikan data |
| 201 | Resource berhasil dibuat |
| 204 | Berhasil tanpa body response, bila cocok |
| 400 | Request tidak valid secara umum |
| 401 | Belum terautentikasi/token tidak valid |
| 403 | Terautentikasi tetapi tidak berhak |
| 404 | Resource tidak ditemukan atau tidak boleh diungkapkan keberadaannya |
| 409 | Konflik state/duplikasi yang dapat dijelaskan |
| 422 | Payload lolos parsing tetapi gagal validasi |
| 429 | Terkena rate limit |
| 500 | Kesalahan server tanpa detail internal ke klien |

## Daftar endpoint — lengkapi bersama penanggung jawab modul

| Method | Endpoint draft | Tujuan | Auth/permission | Status |
|---|---|---|---|---|
| POST | `/auth/login` | Login | Publik | Draft; tetapkan bentuk auth sesuai Sanctum |
| POST | `/auth/logout` | Logout/revoke token | Terautentikasi | Draft |
| GET | `/me` | Data pengguna saat ini | Terautentikasi | Draft |
| PATCH | `/me` | Perbarui profil sendiri | Terautentikasi + policy | Draft |
| GET | `/...` | Endpoint modul | Berdasarkan matriks akses | Belum dirancang |

Jangan mulai integrasi dengan menganggap endpoint draft sudah tersedia. Backend dan klien harus sepakat soal nama field, format response, status, pagination, dan error sebelum implementasi.

## Template endpoint

```text
Nama fitur:
Method + path:
Tujuan:
Aktor/role:
Permission:
Request headers:
Path/query/body parameters:
Validation rules:
Success status + sample response:
Error statuses + sample response:
Side effects/transactions:
Tests:
Owner modul:
Status: Draft / Disetujui / Implemented / Tested
```

## Aturan perubahan

Perubahan breaking (hapus/ubah tipe field, perubahan arti status, ubah bentuk response) harus dibahas di PR, update dokumentasi, backend, website, Android, dan test terkait secara bersamaan.

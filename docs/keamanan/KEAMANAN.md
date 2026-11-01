# Pedoman Keamanan dan Privasi

Sistem berhubungan dengan komunitas dan anak prasejahtera. Gunakan prinsip minimisasi data dan least privilege. Dokumen ini pedoman pengembangan, bukan pengganti peninjauan hukum/kebijakan organisasi.

## Identitas dan akses

- Semua endpoint privat memerlukan autentikasi.
- Semua operasi admin memerlukan permission backend.
- Gunakan policies untuk memastikan pengguna hanya mengubah resource yang memang menjadi haknya.
- Validasi semua payload di server; validasi frontend hanya membantu UX.
- Terapkan rate limiting pada login/reset password dan endpoint sensitif.
- Gunakan hashing password framework dan mekanisme reset password yang aman.
- Jangan log password, token, dokumen sensitif, atau data pribadi penuh.

## Data pribadi

- Kumpulkan field minimum yang dibutuhkan untuk proses komunitas.
- Bedakan data publik, data internal, dan data sensitif.
- Jangan gunakan identitas asli anak/keluarga pada seed atau demo.
- Tentukan pihak yang boleh melihat/mengubah data serta berapa lama data disimpan.
- Hindari screenshot demonstrasi yang memperlihatkan informasi pribadi.
- Siapkan prosedur penghapusan/koreksi data sesuai kebijakan yang disetujui organisasi.

## Secret dan konfigurasi

- `.env` tidak boleh masuk Git.
- `.env.example` hanya berisi placeholder, tidak boleh credential asli.
- Jangan hardcode secret di source, screenshot, issue, atau commit.
- Jangan gunakan credential development untuk production.
- Gunakan HTTPS pada deployment dan konfigurasi CORS hanya untuk origin yang benar-benar dibutuhkan.

## Frontend dan Android

- Jangan menaruh secret backend di `NEXT_PUBLIC_*`.
- Hindari menyimpan token mobile di penyimpanan plaintext; gunakan secure storage.
- Jangan mencetak token ke console/log.
- Tangani logout dan token invalid.
- Jangan mengandalkan UI untuk menyembunyikan akses; lakukan enforcement di API.

## Keamanan database

- Database tidak diekspos ke internet pada deployment.
- Batasi user DB berdasarkan kebutuhan.
- Terapkan backup dengan akses terbatas.
- Hindari commit dump DB dan data personal.
- Uji permission pada record yang bukan milik user.

## Pelaporan masalah

Laporkan masalah keamanan ke anggota kelompok melalui kanal privat, bukan dengan mempublikasikan credential atau data pribadi pada issue publik. Revoke/rotate credential yang terlanjur ter-commit.

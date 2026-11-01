# Panduan Deployment (Kerangka)

Dokumen ini menjadi checklist persiapan. Target hosting dan domain belum ditentukan, sehingga detail provider, pipeline, dan konfigurasi production perlu diputuskan sebelum deployment.

## Prasyarat produksi

- Domain dan HTTPS.
- Hosting yang mendukung runtime Next.js dan PHP/Laravel atau strategi container terkelola.
- MySQL yang tidak dapat diakses publik secara bebas.
- Secret production disimpan di environment/secret manager, bukan repository.
- Strategi backup dan uji restore.
- Logging, monitoring, dan mekanisme rotasi credential.
- CORS/CSRF dan URL API diatur sesuai domain sebenarnya.

## Checklist

- [ ] `.env` production dibuat di environment target, bukan di-commit.
- [ ] `APP_DEBUG=false`, APP_KEY aman, dan environment production benar.
- [ ] Migrasi dijalankan dalam prosedur deployment yang terkontrol.
- [ ] Seed data dummy/demo tidak dijalankan sembarangan pada production.
- [ ] Database tidak mengekspos port publik tanpa kebutuhan.
- [ ] Admin pertama dibuat dengan proses aman; tidak ada password default di README.
- [ ] CORS dibatasi ke domain yang disetujui.
- [ ] HTTPS aktif dan cookie/auth disesuaikan dengan domain.
- [ ] Akses file dan izin direktori ditinjau.
- [ ] Backup dan pemulihan diuji.
- [ ] Android release keystore tidak masuk Git; signing dilakukan secara aman.
- [ ] Endpoint dan versi aplikasi yang dirilis dicatat.

## Catatan

`docker-compose.yml` di root adalah untuk development dan tidak boleh dianggap konfigurasi produksi tanpa penyesuaian. Jangan publish phpMyAdmin atau port MySQL ke internet.

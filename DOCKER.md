# 🐳 Docker & Docker Compose Guide

## Tujuan

Compose menyamakan MySQL dan phpMyAdmin untuk seluruh anggota. Backend dan frontend memiliki profile `apps` agar container aplikasi baru dinyalakan setelah framework di-bootstrap. Flutter berjalan dari host/emulator, bukan dalam container Android emulator.

## 1. File terkait

- `docker-compose.yml`: service dan network.
- `.env.example`: template variabel Compose.
- `docker/dev-backend.Dockerfile`: image development PHP + Composer + extension MySQL.
- `docker/dev-frontend.Dockerfile`: image development Node.js.
- `backend/.env`: konfigurasi Laravel lokal (jangan commit).
- `frontend/.env.local`: konfigurasi Next.js lokal (jangan commit).

## 2. Setup pertama

```bash
cp .env.example .env
# Windows PowerShell:
# Copy-Item .env.example .env

docker compose config --quiet
docker compose up -d mysql
# phpMyAdmin bersifat opsional (profile tools):
docker compose --profile tools up -d phpmyadmin

docker compose ps
docker compose logs -f mysql
```

- MySQL dari host: `127.0.0.1:3307` (bisa diubah melalui `MYSQL_FORWARD_PORT`).
- Service lain di network Compose: host `mysql`, port `3306`.
- phpMyAdmin: `http://localhost:8081`, user `relawan_user` atau `root`, password dari `.env`.

## 3. Menjalankan backend dan frontend dalam Docker

Setelah Bootstrap Laravel dan Next.js selesai:

```bash
docker compose --profile apps up --build
```

Compose akan menjalankan Laravel pada `http://localhost:8000` dan Next.js pada `http://localhost:3000`. Pada startup pertama, service frontend/backend memasang dependencies; tunggu proses pertama selesai.

### Laravel key dan migration

Jalankan satu kali setelah service backend dapat dijalankan:

```bash
docker compose --profile apps run --rm backend php artisan key:generate
docker compose --profile apps run --rm backend php artisan migrate
```

Pastikan `backend/.env` terbentuk dan `APP_KEY` tidak kosong. Karena file `.env` dibaca Laravel dari volume, `php artisan key:generate` akan menyimpan key di file tersebut. Setelah Composer dependencies tersedia, jalankan `docker compose exec backend php artisan install:api` bila command ini tersedia pada versi Laravel yang terpasang, agar scaffolding API/Sanctum disiapkan. Bila versi Laravel mengarahkan ke langkah instalasi berbeda, ikuti dokumentasi resmi versi tersebut.

### Jika menjalankan backend/frontend langsung di host

- MySQL tetap lewat Compose.
- Backend gunakan `DB_HOST=127.0.0.1`, `DB_PORT=3307`.
- Frontend gunakan `NEXT_PUBLIC_API_URL=http://localhost:8000/api/v1`.
- Android emulator gunakan `10.0.2.2` untuk akses host, bukan localhost.

## 4. Command sehari-hari

```bash
docker compose ps
docker compose logs -f mysql
docker compose logs -f backend frontend
docker compose restart mysql
docker compose stop
docker compose down
```

`docker compose down -v` menghapus volume database dan semua data MySQL development. Jangan menjalankan command ini jika data lokal masih dibutuhkan.

## 5. Masalah umum

**Port sudah dipakai:** ubah `MYSQL_FORWARD_PORT`, `PHPMYADMIN_PORT`, atau mapping port aplikasi di Compose.

**Laravel tidak bisa konek database:** pastikan `DB_HOST=mysql` dari container, `DB_PORT=3306`, kredensial sesuai root `.env`, dan MySQL healthy. Jika Laravel di host, gunakan `127.0.0.1:3307`.

**Aplikasi belum ada:** service `backend` dan `frontend` hanya aktif pada profile `apps`. Jalankan bootstrap terlebih dahulu.

**Dependency rusak setelah pergantian branch:** hentikan service dan lakukan pemasangan ulang yang sesuai. Jangan hapus volume MySQL untuk memperbaiki `node_modules` atau `vendor`.

**Android tidak bisa konek:** pastikan backend port 8000 dipublish, firewall mengizinkan koneksi, dan base URL cocok dengan emulator/perangkat.

## 6. Batas pemakaian

Konfigurasi ini untuk development, bukan deployment production. Production memerlukan image multi-stage/immutable, HTTPS, secrets manager/environment aman, konfigurasi web server, backup, logging, dan review keamanan.
## Referensi resmi

- Docker Compose documentation: https://docs.docker.com/compose/
- Compose file reference: https://docs.docker.com/reference/compose-file/
- Docker Desktop installation: https://docs.docker.com/desktop/

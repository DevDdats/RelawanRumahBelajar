# 🎨 Frontend Developer Guide

Dokumentasi untuk pengembangan website publik, area user, dan admin dashboard. Format panduan ini mengikuti gaya `FRONTEND.md` contoh yang dilampirkan, tetapi isi dan contoh telah disesuaikan dengan proyek manajemen relawan (bukan e-commerce).

## 1. Tanggung jawab

- Membuat UI publik, login/register bila diperlukan, area pengguna, dan admin dashboard.
- Menyambungkan halaman ke Laravel REST API.
- Menangani form, state, validasi untuk pengalaman pengguna, loading/empty/error states.
- Membuat website responsif dan aksesibel.
- Menguji route dan tampilan berdasarkan role serta permission API.
- Menjaga agar aturan bisnis utama tidak hanya berada di frontend.

## 2. Stack

- Next.js App Router + React + TypeScript
- Tailwind CSS
- `fetch` atau Axios (pilih satu pola dan konsisten)
- React Hook Form/Zod boleh ditambahkan jika dibutuhkan dan disepakati
- Docker Compose untuk development

## 3. Setup

### Opsi A — Bootstrap repository

Dari root repo jalankan script bootstrap sesuai OS. Script akan menghasilkan skeleton Next.js di `frontend/`.

### Opsi B — Folder frontend sudah ada

```bash
cd frontend
npm install
npm run dev
```

Bila development lewat Docker setelah semua app siap:

```bash
docker compose --profile apps up --build
```

URL default: `http://localhost:3000`.

## 4. Environment

Buat `frontend/.env.local` untuk development lokal:

```env
NEXT_PUBLIC_API_URL=http://localhost:8000/api/v1
```

Jika Next.js berjalan di browser, base URL harus dapat dijangkau browser pengguna. Jangan menaruh secret di variabel `NEXT_PUBLIC_*`; variabel tersebut dapat terpapar ke browser.

## 5. Struktur folder yang disarankan

```text
frontend/
├── src/
│   ├── app/
│   │   ├── (public)/                # landing, informasi publik
│   │   ├── (auth)/                  # login/register bila diperlukan
│   │   ├── (user)/                  # halaman relawan/orang tua
│   │   ├── admin/                   # admin dashboard
│   │   ├── layout.tsx
│   │   └── page.tsx
│   ├── components/
│   │   ├── ui/                      # komponen dasar
│   │   ├── layout/                  # header, footer, sidebar
│   │   └── shared/                  # komponen lintas fitur
│   ├── features/
│   │   ├── auth/
│   │   ├── pengguna/
│   │   ├── relawan/
│   │   ├── rumah-belajar/
│   │   └── kegiatan/                # finalkan berdasar modul yang disetujui
│   ├── lib/
│   │   ├── api-client.ts
│   │   ├── auth/
│   │   └── utils/
│   ├── types/
│   └── styles/
├── public/
├── .env.local                       # jangan commit
└── package.json
```

Nama fitur pada `features/` hanyalah titik awal. Pertahankan fitur final berdasarkan matriks modul, bukan membuat folder untuk fitur yang belum disetujui.

## 6. Integrasi API

- Semua request data dinamis menuju `NEXT_PUBLIC_API_URL` atau helper server-side yang telah disepakati.
- Buat satu API client terpusat untuk base URL, timeout, dan penanganan error.
- Jangan mengirim `role` atau `user_id` dari form sebagai sumber otoritas. Backend menentukan identitas melalui session/token.
- Konsisten dengan response dan nama field dalam `docs/api/KONTRAK_API.md`.
- Tangani status 401, 403, 404, 422, 429, dan 5xx dengan pengalaman yang tepat.
- Jangan menyimpan token sensitif secara ceroboh. Pilih strategi auth web dan mitigasi XSS/CSRF sebelum implementasi.

Contoh helper generik (sesuaikan setelah kontrak final):

```ts
const API_URL = process.env.NEXT_PUBLIC_API_URL;

export async function apiGet<T>(path: string): Promise<T> {
  if (!API_URL) throw new Error('NEXT_PUBLIC_API_URL belum diatur');
  const response = await fetch(`${API_URL}${path}`, {
    headers: { Accept: 'application/json' },
    cache: 'no-store',
  });
  if (!response.ok) throw new Error(`API gagal dengan status ${response.status}`);
  return response.json() as Promise<T>;
}
```

Ini contoh dasar, belum mencakup auth, cookie/CSRF, pagination, atau parsing error 422.

## 7. Aturan UI/UX

- Setiap data-fetching punya loading, empty, success, dan error state.
- Beri label pada semua field form dan pesan validasi yang spesifik.
- Admin dashboard hanya menampilkan menu sesuai role bila informasi role tersedia, tetapi backend tetap melakukan otorisasi.
- Hindari menampilkan data pribadi anak/keluarga jika tidak diperlukan untuk tujuan tugas.
- Gunakan layout responsif; jangan berasumsi semua orang mengakses melalui layar desktop.
- Konfirmasi sebelum operasi destruktif, dan tampilkan hasil operasi dengan jelas.

## 8. Perintah pemeriksaan

Gunakan script yang ada di `package.json` (cek nama script saat skeleton dibuat):

```bash
npm run dev
npm run lint
npm run build
```

Jangan menganggap `lint` tersedia sebelum melihat `package.json`. Tambahkan test UI bila setup pengujian telah disepakati.

## 9. Checklist pull request

- [ ] Halaman sesuai acceptance criteria.
- [ ] Loading, empty, error, dan validasi form ditangani.
- [ ] Semua data dinamis berasal dari API, bukan dummy permanen.
- [ ] Role-based UI konsisten dengan API namun tidak menggantikan otorisasi backend.
- [ ] Responsif dan label aksesibilitas memadai.
- [ ] Tidak ada secret atau data pribadi dalam commit.
- [ ] Endpoint/field yang berubah tercatat di kontrak API.
## 10. Referensi resmi

- Next.js App Router: https://nextjs.org/docs/app
- Next.js installation: https://nextjs.org/docs/app/getting-started/installation
- React: https://react.dev/learn
- Tailwind CSS: https://tailwindcss.com/docs

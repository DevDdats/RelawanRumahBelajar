# 📱 Android Developer Guide — Flutter

## 1. Peran aplikasi Android

Aplikasi Flutter ditujukan untuk pengguna (misalnya relawan dan orang tua/publik sesuai kebutuhan final). Admin dashboard tetap ada di website. Aplikasi Android dan website tidak membuat database atau aturan bisnis terpisah; keduanya menggunakan Laravel REST API yang sama.

## 2. Tools

- Flutter SDK dan Dart yang kompatibel.
- Android Studio untuk Android SDK, emulator, dan device tools.
- VS Code/Android Studio dengan plugin Flutter dan Dart.
- Perangkat Android atau emulator untuk test.

Verifikasi:

```bash
flutter --version
flutter doctor
```

Bootstrap script akan membuat aplikasi Flutter dalam `android/`. Sesudah itu:

```bash
cd android
flutter pub get
flutter run
flutter analyze
flutter test
```

## 3. Struktur fitur yang disarankan

```text
android/
├── lib/
│   ├── main.dart
│   ├── app.dart
│   ├── core/
│   │   ├── config/
│   │   ├── networking/
│   │   ├── storage/
│   │   ├── errors/
│   │   └── widgets/
│   └── features/
│       ├── auth/
│       ├── profil/
│       ├── relawan/
│       ├── rumah_belajar/
│       └── kegiatan/              # finalkan berdasarkan scope yang disepakati
├── test/
├── pubspec.yaml
└── android/
    └── app/src/main/AndroidManifest.xml
```

Gunakan struktur feature-first yang sederhana. Tiap fitur boleh berisi `data/`, `domain/`, dan `presentation/` jika kompleksitasnya memang membutuhkannya; jangan membuat banyak abstraksi sebelum diperlukan.

## 4. Mengakses API dari emulator/perangkat

Base URL yang digunakan berbeda berdasarkan tempat aplikasi berjalan:

| Target | Base URL development |
|---|---|
| Flutter di Android Emulator standar | `http://10.0.2.2:8000/api/v1` |
| HP fisik di jaringan Wi-Fi yang sama | `http://IP-LAN-KOMPUTER:8000/api/v1` |
| Flutter web/desktop lokal (jika diuji) | `http://localhost:8000/api/v1` |
| Production | HTTPS domain API yang sebenarnya |

`localhost` di dalam emulator menunjuk ke emulator itu sendiri, bukan komputer development. Pastikan backend listen pada host yang dapat diakses emulator. Perangkat fisik dan komputer harus berada di jaringan yang dapat saling terhubung.

HTTP cleartext hanya untuk development lokal jika diperlukan; jangan menonaktifkan keamanan transport untuk production. Pastikan permission internet terdapat di Android manifest sesuai panduan Flutter.

## 5. Networking dan auth

- Gunakan satu client HTTP terpusat (`http` atau `dio`, pilih satu setelah diskusi tim).
- Pisahkan API client, model/DTO, repository bila perlu, dan UI.
- Tampilkan loading, error, empty state, serta tombol retry.
- Parse response ke model Dart; hindari `dynamic` menyebar ke seluruh aplikasi.
- Simpan token menggunakan secure storage; jangan simpan password atau token di source code/log.
- Kirim token melalui header `Authorization: Bearer ...` sesuai kontrak API.
- Bersihkan token saat logout dan tangani response 401/403.
- Jangan menanam URL produksi atau secret langsung di kode; gunakan konfigurasi per environment.

## 6. UI dan navigasi

- Prioritaskan alur yang paling sering dipakai user.
- Gunakan form yang ringkas, label jelas, keyboard yang sesuai, dan pesan validasi yang mudah dimengerti.
- Antisipasi jaringan lambat/putus.
- Hindari menyimpan data anak/keluarga yang sensitif secara lokal tanpa kebutuhan dan kebijakan yang jelas.
- Jangan menampilkan atau menambah fitur admin di Android tanpa perubahan scope resmi.

## 7. Checklist pull request

- [ ] `flutter analyze` lulus.
- [ ] `flutter test` lulus untuk fungsi yang relevan.
- [ ] Request mengikuti kontrak API.
- [ ] Loading/error/empty state tersedia.
- [ ] Token tidak di-hardcode atau dicatat ke log.
- [ ] URL berjalan pada target uji yang disebutkan.
- [ ] README/API docs diperbarui jika perlu.
## 8. Referensi resmi

- Flutter documentation: https://docs.flutter.dev/
- Flutter networking cookbook: https://docs.flutter.dev/cookbook/networking
- Flutter testing: https://docs.flutter.dev/testing/overview
- Dart language: https://dart.dev/language

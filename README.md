# Dompet Helm

## Deskripsi Aplikasi
Dompet Helm adalah aplikasi mobile berbasis Flutter yang berfungsi sebagai dompet digital (e-wallet). Aplikasi ini dilengkapi dengan berbagai fitur modern seperti autentikasi melalui Firebase, pemindai QR Code untuk transaksi yang cepat, serta dukungan deep link.

## Arsitektur Aplikasi
Aplikasi ini diimplementasikan menggunakan **Clean Architecture** untuk memisahkan logika bisnis dari UI dan data. Struktur utama aplikasi dibagi ke dalam beberapa layer (berada di dalam folder `lib/`):
- **Core**: Berisi fungsi utilitas, konstanta, konfigurasi, dan rute aplikasi.
- **Domain**: Berisi aturan bisnis inti, *entities*, dan *use cases*.
- **Data**: Menangani pengambilan dan penyimpanan data, terdiri dari *repositories*, *data sources* (API/lokal), dan *models*.
- **Presentation**: Berisi UI/Screens dan logika tampilan (*state management*) yang diatur menggunakan arsitektur BLoC (Business Logic Component).
- **Injection**: Menangani pengelolaan dependensi (Dependency Injection) menggunakan `get_it`.

## Cara Menjalankan Proyek
1. Pastikan Anda telah menginstal **Flutter SDK** (versi `^3.9.2` atau kompatibel).
2. Lakukan *clone* repositori atau buka folder proyek di IDE (seperti VS Code atau Android Studio).
3. Unduh semua dependensi dengan menjalankan perintah:
   ```bash
   flutter pub get
   ```
4. Pastikan konfigurasi Firebase sudah disiapkan (seperti `google-services.json` untuk Android dan `GoogleService-Info.plist` untuk iOS) jika dibutuhkan untuk autentikasi dan notifikasi.
5. Jalankan aplikasi di emulator atau perangkat fisik menggunakan perintah:
   ```bash
   flutter run
   ```

## Daftar Dependensi Utama
Berikut adalah beberapa library (package) utama yang digunakan dalam pengembangan aplikasi ini:
- **State Management:** `flutter_bloc`, `equatable`
- **Dependency Injection:** `get_it`
- **Navigasi:** `go_router`
- **Jaringan (Network):** `dio`, `pretty_dio_logger`
- **Firebase & Autentikasi:** `firebase_core`, `firebase_auth`, `firebase_messaging`, `google_sign_in`
- **Penyimpanan Lokal:** `flutter_secure_storage`, `shared_preferences`
- **QR / Scanner:** `mobile_scanner`
- **Lain-lain:** `app_links` (Deep links), `cached_network_image`, `shimmer`

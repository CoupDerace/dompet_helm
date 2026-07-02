# Dompet Helm

## Pengembang
 * Muhammad Turtusi Afrizal Perdana 
 * 1123150012
 * TI SE 23 P1
 * Teknik Informatika
 * Software Engineering   
 * [Link-Youtube-presentation](https://youtu.be/eaOdBzlhGT8?si=hcxhMzmdavuXZM4F)

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

# Tampilan Aplikasi Helmet Wallet
## Halaman Login & Register
<img width="150" height="336" alt="Screenshot_20260702-115746" src="https://github.com/user-attachments/assets/3434a0e6-9ba0-4d6d-8b0b-72e4cd7219d7" />
<img width="150" height="336" alt="Screenshot_20260702-115750" src="https://github.com/user-attachments/assets/c4e5d550-3a58-4686-af03-fe1d4502ac74" />
<img width="150" height="336" alt="Screenshot_20260702-115755" src="https://github.com/user-attachments/assets/230f68a7-308e-44ad-9326-62e6fc71a179" />

## OTP yang harus dimasukkan ketika Login dengan Akun Google
<img width="150" height="336" alt="Screenshot_20260702-115830" src="https://github.com/user-attachments/assets/17fcda63-6b7d-4bc4-aa92-910dc179de67" />

## Halaman Utama
<img width="150" height="336" alt="Screenshot_20260702-115839" src="https://github.com/user-attachments/assets/3f125750-3f7e-4977-89e9-85870fe608c7" />
<img width="150" height="336" alt="Screenshot_20260702-115942" src="https://github.com/user-attachments/assets/7f32c3bb-f184-4ea0-b515-11484f8137a4" />

## Halaman Isi Saldo
<img width="150" height="336" alt="Screenshot_20260702-115917" src="https://github.com/user-attachments/assets/7c661998-1ca2-43f8-938a-130262cacfae" />

## Halaman Transfer 
<img width="150" height="336" alt="Screenshot_20260702-120011" src="https://github.com/user-attachments/assets/e2d0bb23-f3d7-4eff-9634-e8d4f3dd7d42" />
<img width="150" height="336" alt="Screenshot_20260702-120013" src="https://github.com/user-attachments/assets/78769b37-50eb-406d-845f-b07a81178ea4" />

## Halaman Riwayat Pemesanan
<img width="150" height="336" alt="Screenshot_20260702-115928" src="https://github.com/user-attachments/assets/ef66a54f-28f3-4f8d-bb87-6f1819170c1f" />
<img width="!50" height="336" alt="Screenshot_20260702-115932" src="https://github.com/user-attachments/assets/ab0f9354-0152-4528-9ba7-d85b97789aa3" />
<img width="150" height="336" alt="Screenshot_20260702-115935" src="https://github.com/user-attachments/assets/3629a37e-8eba-4efa-8461-e21165c6d5df" />

## Halaman Promo
<img width="150" height="336" alt="Screenshot_20260702-115945" src="https://github.com/user-attachments/assets/f484d191-295f-41e3-9ce0-c6afb2da98b4" />

## Halaman Profil
<img width="150" height="336" alt="Screenshot_20260702-115948" src="https://github.com/user-attachments/assets/3bf12166-3871-4596-a82b-6d84257f5259" />


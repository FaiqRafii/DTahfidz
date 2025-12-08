# DTahfidz - Aplikasi Pengelolaan Hafalan & Presensi Santri

DTahfidz adalah aplikasi mobile berbasis Flutter yang membantu musyrif tahfidz mengelola administrasi halaqoh secara digital—mulai dari login, melihat detail halaqoh, presensi santri dan musyrif, hingga pencatatan serta pemantauan setoran hafalan. Aplikasi ini dirancang untuk mempercepat pencatatan, meminimalkan kesalahan administrasi, dan memudahkan rekap data harian.

Aplikasi menerapkan arsitektur **MVVM (Model–View–ViewModel)** untuk memisahkan UI, logika, dan pengolahan data API sehingga lebih mudah dikembangkan dan dirawat.

---

## Fitur Utama
- Login musyrif
- Detail halaqoh musyrif
- Presensi musyrif
- Presensi santri per halaqoh, tanggal, dan jam
- Setoran hafalan santri:
  - Tambah setoran
  - Lihat riwayat
  - Update setoran
  - Hapus setoran
- Ganti password
- Pencarian data santri / surah (sesuai implementasi di aplikasi)

---

## Tech Stack
- Flutter
- HTTP
- Arsitektur: MVVM
- Named Routes

---

## Sumber API
Aplikasi menggunakan dua sumber API:
1. **DTahfidz API** untuk data user, halaqoh, santri, presensi, dan setoran.
2. **Quran API** untuk daftar surah.

---

## Daftar Endpoint API yang Digunakan

### Auth
- **POST** `https://dtahfidz-api.vercel.app/login`  
  Login musyrif

### Halaqoh
- **GET** `https://dtahfidz-api.vercel.app/halaqoh?id_user={id_user}`  
  Mengambil detail halaqoh musyrif

### Santri
- **GET** `https://dtahfidz-api.vercel.app/santri?id_halaqoh={id_halaqoh}`  
  Mengambil daftar santri per halaqoh

### Presensi Musyrif
- **GET** `https://dtahfidz-api.vercel.app/presensi/musyrif?id_user={id_user}&tanggal={tanggal}`  
  Mengambil data presensi musyrif
- **POST** `https://dtahfidz-api.vercel.app/presensi/musyrif`  
  Menambahkan presensi musyrif

### Presensi Santri
- **GET** `https://dtahfidz-api.vercel.app/presensi/santri?id_halaqoh={id_halaqoh}&tanggal={tanggal}&jam={jam}`  
  Mengambil data presensi santri
- **POST** `https://dtahfidz-api.vercel.app/presensi/santri`  
  Menambahkan presensi santri (batch)

### Setoran Hafalan
- **POST** `https://dtahfidz-api.vercel.app/setoran`  
  Menambahkan setoran
- **GET** `https://dtahfidz-api.vercel.app/setoran?id_santri={id_santri}`  
  Mengambil riwayat setoran per santri
- **PUT** `https://dtahfidz-api.vercel.app/setoran`  
  Update setoran
- **DELETE** `https://dtahfidz-api.vercel.app/setoran?id_setoran={id_setoran}`  
  Hapus setoran

### Password
- **POST** `https://dtahfidz-api.vercel.app/users/change-password`  
  Mengubah password user

### Quran
- **GET** `https://quran-api.santrikoding.com/api/surah`  
  Mengambil daftar surah

---

## Cara Instalasi

### Prasyarat
- Flutter SDK (stable)
- Android Studio / VS Code
- Android SDK
- Emulator Android atau perangkat fisik

### Langkah Menjalankan
1. Clone repository:
   ```bash
   git clone <URL_REPOSITORY_KAMU>
   cd <NAMA_FOLDER_PROJECT>
2. Login
   Email: faiq@gmail.com
   Password: password

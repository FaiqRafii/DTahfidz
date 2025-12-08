# DTahfidz - Aplikasi Pengelolaan Hafalan Santri untuk Musyrif Tahfidz

DTahfidz adalah aplikasi mobile berbasis Flutter yang membantu musyrif tahfidz dalam mengelola administrasi halaqoh secara digital—mulai dari login, melihat detail halaqoh, presensi santri dan musyrif, hingga pencatatan serta pemantauan setoran hafalan. Aplikasi ini dirancang untuk menggantikan proses manual agar pencatatan lebih rapi, cepat, dan mudah direkap. :contentReference[oaicite:0]{index=0}

Aplikasi menggunakan arsitektur **MVVM (Model-View-ViewModel)**. Data utama dimuat dari API DTahfidz dan data surah diambil dari API Al-Qur’an pihak ketiga. :contentReference[oaicite:1]{index=1}

---

## Fitur Utama
- Autentikasi musyrif (login).
- Menampilkan detail halaqoh berdasarkan akun musyrif.
- Presensi musyrif (subuh/malam).
- Presensi santri per halaqoh, tanggal, dan jam.
- Setoran hafalan santri:
  - Tambah setoran
  - Lihat riwayat setoran
  - Update dan hapus setoran
- Ganti password.

---

## Tech Stack
- **Flutter**
- **Arsitektur**: MVVM
- **Navigasi**: Named Routes

---

## Sumber API
Aplikasi menggunakan dua sumber API utama:  
1) **DTahfidz API** untuk user, santri, halaqoh, presensi, dan setoran.  
2) **Quran API** untuk daftar surah. :contentReference[oaicite:2]{index=2}

---

## Daftar Endpoint API yang Digunakan

### Auth
- **POST** `https://dtahfidz-api.vercel.app/login`  
  Untuk login musyrif. :contentReference[oaicite:3]{index=3}

### Halaqoh
- **GET** `https://dtahfidz-api.vercel.app/halaqoh?id_user={id_user_musyrif}`  
  Mengambil detail halaqoh musyrif. :contentReference[oaicite:4]{index=4}

### Presensi Musyrif
- **GET** `https://dtahfidz-api.vercel.app/presensi/musyrif?id_user={id_user}&tanggal={tanggal}`  
  Mengambil rekap presensi musyrif. :contentReference[oaicite:5]{index=5}
- **POST** `https://dtahfidz-api.vercel.app/presensi/musyrif`  
  Menambahkan presensi musyrif. :contentReference[oaicite:6]{index=6}

### Santri
- **GET** `https://dtahfidz-api.vercel.app/santri?id_halaqoh={id_halaqoh}`  
  Mengambil daftar santri per halaqoh (dipakai saat memilih santri pada setoran). :contentReference[oaicite:7]{index=7}

### Setoran Hafalan
- **POST** `https://dtahfidz-api.vercel.app/setoran`  
  Menambahkan data setoran. :contentReference[oaicite:8]{index=8}
- **GET** `https://dtahfidz-api.vercel.app/setoran?id_santri={id_santri}`  
  Mengambil riwayat setoran per santri. :contentReference[oaicite:9]{index=9}
- **PUT** `https://dtahfidz-api.vercel.app/setoran`  
  Update setoran berdasarkan id_setoran. :contentReference[oaicite:10]{index=10}
- **DELETE** `https://dtahfidz-api.vercel.app/setoran?id_setoran={id_setoran}`  
  Hapus setoran. :contentReference[oaicite:11]{index=11}

### Presensi Santri
- **GET** `https://dtahfidz-api.vercel.app/presensi/santri?id_halaqoh={id_halaqoh}&tanggal={tanggal}&jam={jam}`  
  Mengambil data presensi santri. :contentReference[oaicite:12]{index=12}
- **POST** `https://dtahfidz-api.vercel.app/presensi/santri`  
  Menambahkan presensi santri. :contentReference[oaicite:13]{index=13}

### Password
- **POST** `https://dtahfidz-api.vercel.app/users/change-password`  
  Mengubah password user. :contentReference[oaicite:14]{index=14}

### Data Surah Al-Qur’an
- **GET** `https://quran-api.santrikoding.com/api/surah`  
  Mengambil daftar nama surah (dipakai pada form setoran). :contentReference[oaicite:15]{index=15}

---

## Cara Instalasi & Menjalankan

### Prasyarat
- Flutter SDK (stable)
- Android Studio / VS Code
- Android SDK & emulator atau perangkat fisik

### Langkah
1. Clone repo:
   ```bash
   git clone <URL_REPO_KAMU>
   cd <NAMA_FOLDER_PROJECT>

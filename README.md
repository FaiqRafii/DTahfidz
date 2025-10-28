# DTahfidz

DTahfidz is a mobile application designed to manage Quran memorization (hafalan) for students (santri) at Islamic boarding schools (pondok pesantren). The application assists **musyrif** (Quran group leaders) and **admin tahfidz** (administrators) in monitoring student progress, managing attendance, and recording their Quran memorization.

---

## Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [File Structure](#file-structure)
- [Contributing](#contributing)
- [License](#license)

---

## Features

### Musyrif Tahfidz (Quran Group Leader)
- **Login Page**: Musyrif logs in using their account provided by the admin. If they don't have an account, they can register (or the account can be created by the admin).
  
- **Home Page (Dashboard Musyrif)**:
  1. **View Number of Quran Group's Students**: Musyrif can view the number of students in the halaqoh they are leading.
  2. **View Quran Group's Name**: Musyrif can view the name of the halaqoh they are leading.
  3. **View Quran Group's Place**: Musyrif can view the location of the halaqoh they are leading.
  4. **Musyrif Attendance**: Musyrif can mark their daily attendance according to the tahfidz hours (Subuh: 04.30 WIB - 05.30 WIB, Nights: 18.30 WIB - 19.30 WIB).

- **Attendance Page**:
  Musyrif can mark halaqoh's students' daily attendance according to the date and tahfidz hours (Subuh: 04.30 WIB - 05.30 WIB, Nights: 18.30 WIB - 19.30 WIB).

- **Quran Memorization Records**:
  1. **Input Quran Memorization Record**: Musyrif can input daily memorization submissions from the students (Date, Tahfidz Hours, Beginning Surah, Beginning Ayah, Ending Surah, and Ending Ayah).
  2. **View Quran Memorization Record**: Musyrif can see the student's previous Quran memorization records (Date, Tahfidz Hours, Beginning Surah, Beginning Ayah, Ending Surah, and Ending Ayah).

- **Profile / Settings**:
  1. **Change Password**: Musyrif can update their password through the settings page.

---

## Tech Stack

- **Frontend**: Flutter (Dart)
- **State Management**: Provider, Stateful Widgets
- **Backend (API)**: JSON data for user and memorization records, Quran API for dynamic surah fetching.
- **Design**: Material Design principles for intuitive navigation and a seamless user experience.

---

## Installation

### Prerequisites

- Flutter SDK installed. If not, follow the [Flutter Installation Guide](https://flutter.dev/docs/get-started/install).
- A suitable IDE, such as Android Studio or Visual Studio Code, with Flutter and Dart plugins.

### Steps

1. Clone the repository to your local machine:
    ```bash
    git clone https://github.com/yourusername/DTahfidz.git
    ```

2. Navigate into the project directory:
    ```bash
    cd DTahfidz
    ```

3. Install the dependencies:
    ```bash
    flutter pub get
    ```

4. Run the application:
    ```bash
    flutter run
    ```

---

## File Structure

The project structure is organized as follows:

```plaintext
DTahfidz/
├── assets/
│   └── data/
│       ├── halaqoh.json          # Sample halaqoh data
│       ├── presensiMusyrif.json  # Sample presensi data
│       ├── setoranSantri.json    # Sample setoran hafalan data
│       └── user.json             # Sample user data
├── lib/
│   ├── model/                    # Data models (User, Halaqoh, Setoran, etc.)
│   ├── view/                     # Screen UI files (Profile, Home, etc.)
│   ├── viewmodel/                # View models for business logic
│   └── main.dart                 # Entry point of the Flutter app
├── pubspec.yaml                  # Flutter project dependencies
└── README.md                     # Documentation file

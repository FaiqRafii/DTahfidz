# DTahfidz

DTahfidz is a mobile application designed to manage Quran memorization (hafalan) for students (santri) at Islamic boarding schools (pondok pesantren). The application assists **musyrif** (Quran group leaders) and **admin tahfidz** (administrators) in monitoring student progress, managing attendance, and evaluating their Quran memorization performance.

---

## Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Usage](#usage)
- [File Structure](#file-structure)
- [Contributing](#contributing)
- [License](#license)

---

## Features

### Musyrif Tahfidz (Quran Group Leader)
- **Login Page**: Musyrif logs in using their account provided by the admin. If they don't have an account, they can register (or the account can be created by the admin).
  
- **Main Page (Dashboard Musyrif)**:
  1. **View Santri List**: Musyrif can view the list of students in the halaqoh they are leading.
  2. **Student Attendance**: Musyrif can mark attendance for students every day.
  3. **Setoran Hafalan**: Musyrif can input daily memorization submissions from the students (e.g., Juz, Surah, and Ayah).
  4. **Tahfidz Test Scores**: Musyrif can input the memorization test scores for each student.

### Admin Tahfidz (Admin)
- **Login Page**: Admin logs in using a special admin account. Admin cannot register from the application; accounts are manually created by the system.

- **Main Page (Dashboard Admin)**:
  1. **Input New Santri Data**: Admin can add new students (name, nis, halaqoh, and musyrif).
  2. **Input New Musyrif Data**: Admin can add new musyrif and assign tahfidz halaqoh groups to them.
  3. **View Hafalan Reports**: Admin can view memorization progress and test scores of all musyrif's students.
  4. **View Student Attendance**: Admin can monitor student attendance on a daily basis.

### Profile / Settings
- **Change Password**: Users (musyrif/admin) can update their password through the settings page.

---

## Tech Stack

- **Frontend**: Flutter (Dart)
- **State Management**: Provider, Stateful Widgets
- **Backend (API)**: Local JSON data for user and memorization records, Quran API for dynamic surah fetching.
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

## Usage

### Musyrif Tahfidz (Quran Group Leader)

1. **Login**: Musyrif logs in using the credentials provided by the admin or creates a new account if allowed.
2. **Dashboard**:
   - **Santri List**: View the list of students in the halaqoh.
   - **Attendance**: Mark student attendance during Subuh and Malam sessions.
   - **Setoran Hafalan**: Input daily memorization progress (Juz, Surah, and Ayah).
   - **Test Scores**: Enter tahfidz exam results for students.

### Admin Tahfidz (Admin)

1. **Login**: Admin logs in using their special account.
2. **Dashboard**:
   - **Add Santri**: Input new student information such as name, nis, halaqoh, and assigned musyrif.
   - **Add Musyrif**: Manage musyrif accounts and assign halaqoh groups to them.
   - **View Reports**: View memorization progress, attendance, and exam results of students across all musyrif.

### Profile / Settings

- Both musyrif and admin can access their profile and change their password through the settings page.

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

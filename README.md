# DTahfidz - Quran Memorization App

DTahfidz is a mobile application designed to assist users in memorizing and tracking their Quranic recitation and hafalan (memorization). It provides a user-friendly interface with features such as profile management, schedule tracking, and the ability to mark progress in memorization. The application is designed for students of the Quran and provides tools for both musyrif (teachers) and students.

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

- **User Authentication**: Login system for students and teachers (musyrif) using email and password.
- **Profile Management**: Manage and update user profiles with personal information such as name, level, and email.
- **Halaqoh Information**: Musyrif can manage and track halaqoh details, including the number of students and the location.
- **Presensi Santri**: Teachers can mark attendance for students during specific prayer times (Subuh and Malam).
- **Setoran Hafalan**: Record and view hafalan progress for each student, including the starting and ending surah and ayah.
- **Quran Surah List**: API integration to fetch a list of Quranic surahs for easier navigation.
- **Date and Time Tracking**: Track specific memorization sessions based on the time of day (Subuh/Malam).
  
---

## Tech Stack

- **Frontend**: Flutter
- **State Management**: Provider, Stateful Widgets
- **Backend (API)**: Local JSON data and Quran API for surah information.
- **Authentication**: Local user authentication with stored credentials.
- **Database**: Local JSON storage for user and memorization data.
- **Design**: Material Design principles for an intuitive user experience.

---

## Installation

### Prerequisites

- Ensure that you have Flutter installed on your machine. You can follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install).
- Ensure you have a suitable IDE for Flutter development such as Android Studio or VS Code.

### Steps

1. Clone the repository to your local machine:
    ```bash
    git clone https://github.com/yourusername/dtahfidz.git
    ```

2. Navigate into the project directory:
    ```bash
    cd dtahfidz
    ```

3. Get the required dependencies:
    ```bash
    flutter pub get
    ```

4. Run the app on your emulator or physical device:
    ```bash
    flutter run
    ```

---

## Usage

### Running the Application

- Open the app on your device or emulator.
- Log in using a pre-existing account or create a new account.
- You can access the main features via the home screen, including:
  - **Profile**: View and edit your profile information.
  - **Presensi**: Mark your attendance during Subuh and Malam.
  - **Setoran Hafalan**: Track your Quran memorization progress.
  - **Halaqoh**: View the details of your halaqoh.

### Notes

- The application uses local JSON files to store user, halaqoh, and presensi data. You may want to integrate a backend for production purposes.
- The app includes a Quran API to fetch surah names dynamically.

---

## File Structure

The project is organized as follows:

```plaintext
DTahfidz/
├── assets/
│   └── data/
│       ├── halaqoh.json          # Sample halaqoh data
│       ├── presensiMusyrif.json  # Sample presensi data
│       ├── setoranSantri.json    # Sample setoran hafalan data
│       └── user.json             # Sample user data
├── lib/
│   ├── model/                    # Contains data models (User, Halaqoh, etc.)
│   ├── view/                     # Contains all screen UI files (Profile, Home, etc.)
│   ├── viewmodel/                # Contains the view models for business logic
│   └── main.dart                 # Main entry point of the Flutter app
├── pubspec.yaml                  # Flutter project dependencies
└── README.md                     # Documentation file

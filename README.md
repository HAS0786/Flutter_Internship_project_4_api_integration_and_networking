📱 Flutter API Integration & Networking

A Flutter application demonstrating RESTful API integration, JSON parsing, and robust UI state handling using real network data.

📌 Overview

This project fetches user data from a public REST API, parses JSON responses into Dart model classes, and displays the data in a structured and responsive UI. It focuses on core Flutter networking concepts and best practices.

🎯 Key Features

Fetches data from a RESTful API using the http package

Parses JSON into Dart models using factory constructors

Displays data using ListView

Handles loading, success, and error states

Implements safe UI updates using mounted

Includes user profile detail screen with navigation

🌐 API Used
https://jsonplaceholder.typicode.com/users

🛠️ Tech Stack

Flutter

Dart

REST API

HTTP package

Material Design

📂 Project Structure
lib/
├── models/     # JSON parsing models
├── services/   # API service layer
├── views/      # UI screens
└── main.dart   # App entry point

🚀 Run the Project
flutter pub get
flutter run

⚠️ Notes

The API does not provide profile images; a placeholder avatar is used

Flutter Web requires an internet connection for engine resources

👨‍💻 Author

Hasnat Ahmad

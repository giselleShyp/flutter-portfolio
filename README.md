Flutter Portfolio Template
A modern, dynamic digital resume built with Flutter and Clean Architecture. This project is fully data-driven via Firebase.
✨ Features
- AI-Optimized UI: Designed using Reforge AI for a sleek, professional developer look.
- Dynamic Data: Fetches Profile, Experience, and Volunteering sections from Firestore.
- Service-Oriented: Integrated URL handling for LinkedIn, GitHub, and Email.

🛠 Tech Stack
- Framework: Flutter
- State Management: Riverpod (with Code Generation)
- Backend: Firebase Firestore
- Design: Reforge AI
- Navigation: AutoRoute
- Formatting: Intl Package

## 🏗 Project Structure

```text
lib/
├── core/               # Shared logic, theme, and global providers
│   ├── layouts/        # Main app wrappers (MainLayout)
│   ├── providers/      # Global Riverpod providers
│   ├── services/       # Core services (Firebase, URL Launcher)
│   └── widgets/        # Reusable UI components (AppText, BaseCard)
└── features/           # Feature-first modules
    └── [feature_name]/ # e.g., experience, home, projects
        ├── data/       # Models and Remote Datasources
        ├── domain/     # Entities and Business Logic
        └── presentation/ # UI Screens and Controllers (Riverpod)
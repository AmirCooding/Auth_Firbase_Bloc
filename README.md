# Auht_Firbase_Bloc

A Flutter project implementing **Clean Architecture**, **GetIt** for dependency injection, and **Firebase Authentication** using the **Repository Pattern** for user sign-up and sign-in.

## Features
- User Authentication (Sign-Up & Sign-In) with Firebase
- Clean Architecture Implementation
- Dependency Injection using GetIt
- Repository Pattern for Data Management
- Separation of Concerns for Scalability
- Secure Storage of User Credentials
- State Management using Provider
- Error Handling and Validation Mechanisms
- Well-structured Codebase for Maintainability

## Project Structure
```
lib/
│── core/                # Core utilities, constants, and helpers
│── data/                # Data layer (Repositories, Data sources, Models)
│── domain/              # Business logic (Entities, UseCases, Repositories Interfaces)
│── presentation/        # UI Layer (Screens, Widgets, State Management)
│── main.dart            # Entry point
```

### Explanation
- **Core**: Contains reusable utilities, constants, and helper functions to support other layers.
- **Data**: Implements repositories and interacts with Firebase for authentication and user management.
- **Domain**: Defines business logic through entities, use cases, and repository interfaces, ensuring a clean separation of concerns.
- **Presentation**: Contains UI elements, screens, and state management solutions to create an interactive user experience.

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/project-name.git
   ```
2. Navigate into the project directory:
   ```bash
   cd Auht_Firbase_Bloc
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Setup Firebase:
   - Create a Firebase project in the Firebase Console.
   - Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) to the respective folders.
   - Enable Firebase Authentication in the Firebase Console and configure email/password authentication.
   - Configure Firebase Firestore or Realtime Database if additional user data storage is needed.

## Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
   equatable: ^2.0.7
  cupertino_icons: ^1.0.8
  firebase_core: ^3.12.0
  firebase_auth: ^5.5.0
  get_it: ^7.7.0
  flutter_getit: ^3.0.1
  bloc: ^9.0.0
  bloc_test: ^10.0.0
  cloud_firestore: ^5.6.4
  flutter_bloc: ^9.0.0
```

## Usage
1. Run the project:
   ```bash
   flutter run
   ```
2. Register a new user or sign in with an existing Firebase account.
3. Manage user authentication securely with Firebase and Flutter Secure Storage.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request.

## License
This project is licensed under the MIT License.

## Future Improvements
- Implement social authentication (Google, Facebook, Apple Sign-In)
- Add unit and integration tests
- Improve UI/UX with animations and themes
- Implement multi-language support

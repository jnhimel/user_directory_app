# User Directory App

A Flutter mobile application that fetches and displays a list of users from a public API. This project demonstrates skills in state management (using Cubits), API integration, clean architecture, and UI development.

## Features

- **User List Screen:** Fetches and displays users in a list with name and profile picture
- **User Detail Screen:** Shows detailed information for a selected user
- **Search Functionality:** Allows filtering users by name
- **Pagination:** Loads users in batches using API pagination and implements infinite scrolling
- **Error Handling:** Manages API failures and displays appropriate messages
- **Pull to Refresh:** Allows refreshing the user list
- **Clean Architecture:** Follows clean architecture principles for better separation of concerns

## Technology Stack

- **State Management:** Flutter Bloc
- **Architecture:** Clean Architecture (Domain, Data, Presentation layers)
- **Networking:** Retrofit (Dio) for API requests
- **Image Loading:** Cached Network Image for efficient image loading and caching
- **Connectivity:** Internet Connection Checker for network status detection

## Project Structure
```
lib/
  ├── main.dart
  ├── app.dart
  ├── config/
  │   ├── routes/
  │   └── theme/ 
  ├── core/
  │   ├── constants/
  │   ├── db/
  │   ├── di/
  │   ├── error/
  │   └── usecases/ 
  └── features/
        └── users_list/
            ├── data/
            │   ├── datasources/
            │   │    ├── local/
            │   │    │    └── db/
            │   │    │       ├── dao/
            │   │    │       └── tables/
            │   │    └── remote/
            │   ├── mappers/
            │   ├── models/
            │   └── repository/
            ├── domain/
            │   ├── entities/
            │   ├── repository/
            │   └── usecases/
            └── presentation/
                ├── bloc/
                ├── pages/
                └── widgets/
```

## Getting Started

### Prerequisites
- Flutter SDK (version 3.29.3 or higher)
- Dart SDK (version 3.7.2 or higher)
- Android Studio / VS Code
- Android SDK / Xcode (for iOS development)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/jnhimel/user_directory_app.git
cd user_directory_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Clean Architecture

This project follows Clean Architecture principles with three main layers:

1. **Domain Layer:** Contains business logic, entities, and repository interfaces
2. **Data Layer:** Implements repositories, contains data sources and models
3. **Presentation Layer:** Contains UI components, Cubits for state management

## State Management

State management is implemented using BLoC pattern with Cubits:

- **UserListBloc:** Manages the state for the user list screen, handling pagination and search

## API Integration

The app fetches data from [ReqRes API](https://reqres.in/api/users) with the following endpoints:

- GET `/users?page=1&per_page=10` - Get list of users with pagination

## Future Improvements

- Implement comprehensive test coverage
- Add theming support
- Implement user authentication
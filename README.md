# Tut Care Flutter Assessment

## Overview

Tut Care is a Flutter application that allows patients to securely log in, view their appointments, book new appointments, and cancel existing ones using the provided REST API.

The project follows a clean feature-based architecture with Bloc state management, dependency injection, centralized networking, and reusable UI components.

---

# Setup

## Prerequisites

- Flutter SDK 3.x or later
- Dart SDK
- Android Studio or VS Code
- Android Emulator or Physical Device
- Running backend API

## Installation

1. Clone the repository

```bash
git clone https://github.com/BassantAl/tut_care.git
```

2. Install dependencies

```bash
flutter pub get
```

3. Run the application

```bash
flutter run
```

---

# Project Structure

The project follows a feature-based architecture.

```
lib/
│
├── core/
│   ├── constants/
│   ├── di/
│   ├── errors/
│   ├── routes/
│   ├── services/
│   ├── theme/
│   ├── utils/
│   └── widgets/
│
├── features/
│
│   ├── auth/
│   │   ├── data/
│   │   └── presentation/
│   │
│   └── Appointments/
│       ├── data/
│       └── presentation/
```

## Core

The `core` folder contains shared functionality used across the application.

- API constants
- Dependency Injection using GetIt
- Error handling
- Routing with GoRouter
- Network services using Dio
- Secure storage
- Shared themes
- Responsive utilities
- Reusable widgets

## Features

Each feature is divided into two layers.

### Data

Contains:

- Models
- Repository implementation

### Presentation

Contains:

- Views
- Widgets
- Bloc
- Events
- States

This separation keeps the UI independent from networking and business logic, making the project easier to maintain and extend.

---

# State Management

The application uses **flutter_bloc**.

Each feature has its own Bloc responsible for handling business logic and state changes.

Implemented Blocs:

- LoginBloc
- GetDoctorsBloc
- BookAppointmentBloc
- GetMyAppointmentsBloc
- CancelAppointmentBloc

Widgets remain responsible only for displaying data and handling user interaction.

---

# Authentication

## Login

The user signs in using email and password.

After successful authentication, the backend returns an access token.

The token is stored securely using FlutterSecureStorage.

## Authorized Requests

Every authenticated request automatically includes

```
Authorization: Bearer <token>
```

through a Dio interceptor.

## Session Handling

If the backend returns **401 Unauthorized**

- the stored token is removed
- a session expiration event is emitted
- the application redirects the user back to the Login screen

This behavior is handled centrally without repeating logic inside individual screens.

---

# Features

- Secure Login
- Secure Token Storage
- Fetch Available Doctors
- Book Appointment
- View My Appointments
- Pull to Refresh
- Appointment Details
- Cancel Appointment
- Optimistic UI Update during cancellation
- Responsive Mobile and Tablet layouts
- Centralized Error Handling

---

# Responsive Design

The application supports both mobile and tablet layouts.

Responsive behavior is implemented using:

- AdaptiveLayout
- LayoutBuilder
- ConstrainedBox
- SizeConfig responsive typography

This keeps spacing, typography, and content readable across different screen sizes.

---

# Error Handling

Network failures are handled centrally.

Server failures are mapped into user-friendly messages including:

- Connection timeout
- Receive timeout
- No internet connection
- Bad response
- Unauthorized request
- Forbidden request
- Resource not found
- Validation errors
- Conflict errors
- Internal server errors

Loading, empty, success, and failure states are handled separately using Bloc states.

---

# Time Spent

| Task | Estimated Time |
|------|---------------:|
| Project Setup & Dependency Injection | 2 Hours |
| Authentication | 3 Hours |
| Appointment Feature | 5 Hours |
| UI Design & Responsive Layout | 4 Hours |
| Refactoring & Manual Testing | 2 Hours |
| **Total** | **16 Hours** |

---

# Testing Approach

The project was tested manually.

## Authentication

- Login with valid credentials
- Login with invalid credentials
- Empty input validation
- Email format validation

## Session Handling

- Verified Authorization header
- Verified automatic logout after 401 response

## Appointments

- Fetch appointments
- Pull to refresh
- Book appointment
- Cancel appointment
- Automatic refresh after booking
- Automatic refresh after cancellation

## Booking

- Doctor selection
- Date picker
- Time picker
- Required field validation

## Responsive Layout

Tested on

- Mobile screens
- Tablet screens

to verify layout constraints, spacing, and typography.

---


# Technologies

- Flutter
- Dart
- flutter_bloc
- bloc
- Dio
- GetIt
- GoRouter
- FlutterSecureStorage
- Dartz
- Intl

---

# Git History

The project was developed using incremental commits with descriptive commit messages rather than a single final commit to clearly show the development process.
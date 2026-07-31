# Tut Care Flutter Assessment

## Overview

Tut Care is a Flutter application that allows patients to authenticate, book appointments with doctors, view their appointments, and cancel existing appointments. The application communicates with the provided REST API and follows a clean, maintainable architecture.

---

## Setup

### Prerequisites

* Flutter SDK 3.x or later
* Dart SDK
* Android Studio or VS Code
* Android Emulator or Physical Device
* Backend API running and accessible



## Project Architecture

The project follows **Clean Architecture** with feature-based organization.

```
lib/
│
├── core/
│   ├── networking/
│   ├── routes/
│   ├── services/
│   ├── theme/
│   ├── utils/
│   └── widgets/
│
├── features/
│   ├── auth/
│   └── appointments/
│       ├── data/
│       ├── domain/
│       └── presentation/
```

Each feature is divided into:

* Data
  * Models
  * Repository implementation
  

* Presentation

  * Views
  * Widgets
  * Bloc
  * Events
  * States

This structure keeps business logic separated from the UI and makes the project easier to maintain and extend.

---

## State Management

The application uses **flutter_bloc (Bloc)**.

Reasons for choosing Bloc:

* Clear separation between UI and business logic.
* Predictable state transitions.
* Easy error handling.
* Scalable for medium and large applications.
* Simplifies testing.

Different blocs are responsible for independent features, including:

* Login
* Get Doctors
* Book Appointment
* Get My Appointments
* Cancel Appointment

---

## Authentication & Token Handling

### Login

* The user authenticates using email and password.
* The backend returns an access token.
* The token is stored securely using Flutter Secure Storage.

### Authorized Requests

Every authenticated request automatically attaches:

```
Authorization: Bearer <token>
```

using a Dio interceptor.

### Token Expiration

When the backend returns **401 Unauthorized**:

* The stored token is deleted.
* The user is redirected to the login screen.
* Further authenticated requests require logging in again.

---

## Features

* User Login
* Secure Authentication
* Doctor List
* Book Appointment
* View Appointments
* Cancel Appointment
* Pull to Refresh
* Error Handling
* Loading States

---

## Known Limitations

* Doctor names are not included in the My Appointments API response, therefore the application displays the available doctor identifier instead.
* Duplicate appointment validation depends on backend implementation.
* Token refresh is not implemented because the provided backend only supports session expiration with re-authentication.
* Offline support is not implemented.

---

## Technologies

* Flutter
* Dart
* flutter_bloc
* Dio
* GoRouter
* Flutter Secure Storage
* dartz
* getit

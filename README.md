# RecipeApp (Foodies) 🍲

A robust Flutter application built to explore, search, and manage food recipes. The project is engineered with a strict focus on **Clean MVVM Architecture**, advanced network optimizations, state management, and reliable local caching.

> **Note on UI/UX:** The current repository emphasizes solid backend integration, architectural patterns, and execution logic. A modern visual UI/UX redesign is actively in progress.

---

## 🛠️ Tech Stack & Dependencies

* **Framework:** Flutter & Dart
* **Architecture:** MVVM (Model-View-ViewModel)
* **State Management:** Flutter BLoC & Cubit (`flutter_bloc`, `bloc`, `equatable`)
* **Dependency Injection:** Service Locator (`get_it`)
* **Navigation:** Declarative Routing (`go_router`)
* **Networking:** HTTP client using `dio`
* **Local Caching:** `hive` & `hive_flutter`
* **Functional Programming:** `dartz` (Either / Functional error handling)

---

## 🚀 Key Technical Features

### 1. Architecture & State Management
* **MVVM Pattern:** Strict separation of concerns keeping presentation, logic, and data layers decoupled and testable.
* **Cubit & Service Locator:** Predictable state management powered by `Cubit` combined with `GetIt` for seamless dependency injection.

### 2. Advanced Network & Search Optimizations
* **Debounced Search Input:** Prevents spamming HTTP requests on fast user keystrokes during search operations.
* **Request Cancellation (`CancelToken`):** Utilizes Dio's `CancelToken` alongside debouncing to instantly cancel pending out-of-date API queries when new input is entered, saving bandwidth and preventing race conditions.

### 3. Offline-First & Local Storage
* **Search History & Favorites:** Integrated `Hive` key-value database to persist users' recent search terms and bookmarked meals locally across app sessions.

### 4. UI Components & Web Integration
* Dynamic navigation featuring `liquid_glass_bottom_bar` and custom splash/onboarding flows (`another_flutter_splash_screen`, `flutter_onboarding_slider`).
* Image caching via `cached_network_image` to avoid unnecessary network bandwidth.
* External web content rendering using `flutter_inappwebview` and `url_launcher`.
* Content sharing integration via `share_plus`.

---

## 📁 Project Architecture Overview

```text
lib/
├── core/
│   ├── di/              # Dependency Injection (GetIt)
│   ├── network/         # Dio client, CancelToken helpers & API endpoints
│   ├── router/          # GoRouter configuration
│   └── utils/           # Debouncer and helper utilities
├── features/
│   ├── auth / splash/   # Onboarding & Splash screens
│   ├── recipes/         # Core features (Search, Details, Favorites)
│   │   ├── data/        # Repositories & Hive local data sources
│   │   ├── logic/       # Cubits & States
│   │   └── presentation/# UI Widgets & Screens

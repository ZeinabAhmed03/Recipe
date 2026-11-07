# RecipeApp 🍲

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
* **Cubit & Service Locator:** Predictable state management powered by `Cubit` combined with `GetIt` (`service_locator.dart`) for seamless dependency injection.

### 2. Advanced Network & Search Optimizations
* **Debounced Search Input:** Prevents spamming HTTP requests on fast user keystrokes during search operations.
* **Request Cancellation (`CancelToken`):** Utilizes Dio's `CancelToken` alongside debouncing to instantly cancel pending out-of-date API queries when new input is entered, saving bandwidth and preventing race conditions.

### 3. Offline-First & Local Storage
* **Search History & Favorites:** Integrated `Hive` key-value database (`local_db.dart`) to persist users' recent search terms and bookmarked meals locally across app sessions.

### 4. UI Components & Integration
* Dynamic navigation using `go_router` (`app_route.dart`) featuring custom bottom bar and onboarding slider.
* Image caching via `cached_network_image` to minimize bandwidth consumption.
* In-app web integration (`flutter_inappwebview`, `url_launcher`) and native content sharing (`share_plus`).

---

## 📁 Project Structure

```text
lib/
├── core/
│   ├── models/           # Data models (meal.dart, meal.g.dart)
│   ├── routing/          # App navigation (app_route.dart)
│   ├── services/         # Core services (api_service.dart, local_db.dart, service_locator.dart, etc.)
│   ├── utils/            # UI constants & themes (app_assets.dart, app_colors.dart)
│   └── widgets/          # Shared reusable widgets (custom_local_indicator.dart, etc.)
├── features/
│   ├── favorites/        # Bookmarked meals feature
│   ├── home/             # Main recipes feed
│   ├── onboarding/       # Onboarding flow presentation
│   ├── recipie details/  # Detailed view for individual recipes
│   ├── Search/           # Debounced search 
│   └── splash/           # Splash screen view
└── main.dart             # Application entry point

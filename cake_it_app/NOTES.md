## NOTES

### Flutter Version

* Flutter version used: **3.41.6**


### Overview

This project was refactored to address the issues of stability, performance, and user experience. The main focus was on improving the pull-to-refresh functionality, error handling, and overall code structure while maintaining a clean and maintainable codebase.


---

### Fixes and Improvements

#### 1. UI and Layout

* Fixed layout issues across different screen sizes
* Ensured consistent spacing and alignment
* Prevented text overflow for long titles and descriptions
* Improved image rendering and sizing in list and detail views


#### 2. Performance and Smoothness

* Reduced UI flicker during data refresh
* Added smooth image loading with fade-in effect


#### 3. Pull to Refresh

* Implemented platform-specific pull-to-refresh:

  * Android: `RefreshIndicator`
  * iOS: `CupertinoSliverRefreshControl`
* Refresh keeps existing data visible while reloading
* Prevents UI flicker by separating loading and refreshing states


#### 4. Error Handling

* Added timeout handling for network requests
* Handled:
  * network failures
  * server errors
  * invalid endpoints
* App does not crash on failed requests
* Displays user-friendly error message with retry option

#### 5. Code Structure and Architecture

The project was refactored into a small feature-based structure.

* `core/` contains shared app-wide code such as networking, routing, theming, constants, and reusable widgets
* `features/` contains feature-specific code
* `localization/` contains localization files
* app-level setup is kept in `app.dart`, `app_blocs.dart`, and `app_dependencies.dart`

For the cakes feature, responsibilities were separated into:
* `data/` for models, services, and repositories
* `presentation/` for Bloc state management and UI views

This structure improves readability and separation of concerns while keeping the app simple.


#### 6. State Management


Bloc was used to manage the cakes feature state, and Cubit was used for app theme state.

For the cakes list, Bloc handles:
* loading data from the API
* storing loaded cakes
* refreshing the list
* reporting errors

Cubit was used for theme selection because it is a simpler form of state management and was enough for that use case.


#### 7. Navigation

* Implemented structured navigation using GoRouter
* Improved data passing between list and detail views


---


### What I Would Improve With More Time

* Save and restore theme mode selection across app restarts
* Add caching to avoid unnecessary network calls
* Improve error UI with more detailed feedback
* Add unit and widget tests
* Improve accessibility (semantics, text scaling)


---

###  Third Party Libraries

No additional third-party libraries were introduced beyond those permitted (`flutter_bloc` and `go_router`).
If allowed, I would consider:
* `shimmer` or `flutter_spinkit` (for loading effects)
* `connectivity` (for better network status handling)
* `cached_network_image` (for better image caching and placeholders)
* `flutter_screen_util` (for responsive UI across different screen sizes)
* `fluttertoast` (for user-friendly error messages)
* `hive` or `shared_preferences` (for local caching of data and theme selection)
* `get_it` (for dependency injection and better separation of concerns)
* `dio` or `retrofit` (for more robust networking)




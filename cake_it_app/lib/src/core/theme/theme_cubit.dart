import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_state.dart';

/// Cubit that manages the theme state of the application, allowing users
/// to switch between light, dark, and system themes. The current theme mode
/// is stored in the state and can be updated using the [setThemeMode] method,
/// which emits a new state with the updated theme mode.
///
/// The [ThemeCubit] is used in the [MyApp] widget to determine the theme
/// of the application and in the [SettingsView] to allow users to change
/// the theme mode through a dropdown menu.
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(ThemeMode.system));

  void setThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }
}

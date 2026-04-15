import 'package:flutter/material.dart';

//// The state of the theme, which holds the current [ThemeMode]
///(light, dark, or system).
class ThemeState {
  final ThemeMode themeMode;

  const ThemeState(this.themeMode);

  ThemeState copyWith({ThemeMode? themeMode}) {
    return ThemeState(themeMode ?? this.themeMode);
  }
}

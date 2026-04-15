import 'package:flutter/material.dart';

/// Displays the various settings that can be customized by the user.
///

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: DropdownButton<ThemeMode>(
          // Read the selected themeMode from the controller
          // value: controller.themeMode,
          value: ThemeMode.system,
          // Call the updateThemeMode method any time the user selects a theme.
          // onChanged: controller.updateThemeMode,
          onChanged: (v) {},
          items: const [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('System Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Light Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Dark Theme'),
            )
          ],
        ),
      ),
    );
  }
}

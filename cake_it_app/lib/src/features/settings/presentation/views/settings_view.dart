import 'package:cake_it_app/src/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/theme_cubit.dart';

/// Displays the various settings that can be customized by the user.
///

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButton<ThemeMode>(
          padding: EdgeInsets.symmetric(horizontal: 12),
          value: context.watch<ThemeCubit>().state.themeMode,
          onChanged: (v) {
            if (v != null) {
              context.read<ThemeCubit>().setThemeMode(v);
            }
          },
          items: ThemeMode.values.map((mode) {
            String text;
            switch (mode) {
              case ThemeMode.system:
                text = 'System Theme';
                break;
              case ThemeMode.light:
                text = 'Light Theme';
                break;
              case ThemeMode.dark:
                text = 'Dark Theme';
                break;
            }
            return DropdownMenuItem(
              value: mode,
              child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
            );
          }).toList(),
        ),
      ),
    );
  }
}

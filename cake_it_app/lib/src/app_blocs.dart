import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/theme_cubit.dart';

/// Provides a centralized location for all the global Blocs used in the app.
/// Blocs that are needed across multiple features should be added here
/// to ensure they are easily accessible throughout the app.
///
class AppBlocs {
  static final _blocs = [
    BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
    ),
  ];

  static List<BlocProvider<dynamic>> get blocs => _blocs;
}

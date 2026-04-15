import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/theme_cubit.dart';

class AppBlocs {
  static final _blocs = [
    BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
    ),
  ];

  static List<BlocProvider<ThemeCubit>> get blocs => _blocs;
}

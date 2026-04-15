import 'package:cake_it_app/src/app_blocs.dart';
import 'package:cake_it_app/src/core/routes/app_router.dart';
import 'package:cake_it_app/src/core/theme/app_theme.dart';
import 'package:cake_it_app/src/core/theme/theme_cubit.dart';
import 'package:cake_it_app/src/core/theme/theme_state.dart';
import 'package:cake_it_app/src/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocs.blocs,
      child: BlocBuilder<ThemeCubit, ThemeState>(builder: (ctx, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          routerDelegate: AppRouter.router.routerDelegate,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routeInformationProvider: AppRouter.router.routeInformationProvider,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: AppTheme.light(), // App light theme
          darkTheme: AppTheme.dark(), // App dark theme
          themeMode: state.themeMode,
        );
      }),
    );
  }
}

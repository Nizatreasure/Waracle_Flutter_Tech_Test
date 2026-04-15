// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'waracle_flutter_tech_test';

  @override
  String get settings => 'Settings';

  @override
  String get cakes => 'Cakes';

  @override
  String get retry => 'Retry';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get cakeDetails => 'Cake Details';

  @override
  String get lightTheme => 'Light Theme';

  @override
  String get darkTheme => 'Dark Theme';

  @override
  String get systemTheme => 'System Theme';
}

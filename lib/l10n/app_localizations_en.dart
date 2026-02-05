// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Flutter Labs';

  @override
  String get login => 'Login';

  @override
  String get password => 'Password';

  @override
  String get submitAuth => 'Login';

  @override
  String get unauthorized_exception => 'Credenciáis inválidas';

  @override
  String get generica_exception => 'Erro inesperado';
}

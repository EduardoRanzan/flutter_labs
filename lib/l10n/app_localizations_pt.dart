// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Flutter Labs';

  @override
  String get login => 'Login';

  @override
  String get password => 'Senha';

  @override
  String get submitAuth => 'Entrar';

  @override
  String get unauthorized_exception => 'Credenciáis inválidas';

  @override
  String get generica_exception => 'Erro inesperado';
}

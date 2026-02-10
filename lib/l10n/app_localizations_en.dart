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
  String get submit_auth => 'Login';

  @override
  String get unauthorized_exception => 'Invalid credentials';

  @override
  String get generic_exception => 'Unexpected error';

  @override
  String get success_login => 'Login successful';

  @override
  String get required => 'This field is required';

  @override
  String get home => 'Home';

  @override
  String get widgets => 'Widgets';

  @override
  String get profile => 'Profile';

  @override
  String get logout => 'Log out';

  @override
  String get welcome => 'Welcome';
}

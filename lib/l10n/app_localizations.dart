import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In pt, this message translates to:
  /// **'Flutter Labs'**
  String get appTitle;

  /// No description provided for @login.
  ///
  /// In pt, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @password.
  ///
  /// In pt, this message translates to:
  /// **'Senha'**
  String get password;

  /// No description provided for @submit_auth.
  ///
  /// In pt, this message translates to:
  /// **'Entrar'**
  String get submit_auth;

  /// No description provided for @unauthorized_exception.
  ///
  /// In pt, this message translates to:
  /// **'Credenciais inválidas'**
  String get unauthorized_exception;

  /// No description provided for @generic_exception.
  ///
  /// In pt, this message translates to:
  /// **'Erro inesperado'**
  String get generic_exception;

  /// No description provided for @success_login.
  ///
  /// In pt, this message translates to:
  /// **'Login realizado com sucesso'**
  String get success_login;

  /// No description provided for @required.
  ///
  /// In pt, this message translates to:
  /// **'Este campo é obrigatório'**
  String get required;

  /// No description provided for @home.
  ///
  /// In pt, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @widgets.
  ///
  /// In pt, this message translates to:
  /// **'Widgets'**
  String get widgets;

  /// No description provided for @profile.
  ///
  /// In pt, this message translates to:
  /// **'Perfil'**
  String get profile;

  /// No description provided for @logout.
  ///
  /// In pt, this message translates to:
  /// **'Sair'**
  String get logout;

  /// No description provided for @welcome.
  ///
  /// In pt, this message translates to:
  /// **'Bem-vindo'**
  String get welcome;

  /// No description provided for @master_data.
  ///
  /// In pt, this message translates to:
  /// **'Cadastros'**
  String get master_data;

  /// No description provided for @emoji_button.
  ///
  /// In pt, this message translates to:
  /// **'Botão de Emoji'**
  String get emoji_button;

  /// No description provided for @facial_collect.
  ///
  /// In pt, this message translates to:
  /// **'Coleta Facial'**
  String get facial_collect;

  /// No description provided for @expandable_area.
  ///
  /// In pt, this message translates to:
  /// **'Área Expandível'**
  String get expandable_area;

  /// No description provided for @products.
  ///
  /// In pt, this message translates to:
  /// **'Produtos'**
  String get products;

  /// No description provided for @product_name.
  ///
  /// In pt, this message translates to:
  /// **'Nome do produto'**
  String get product_name;

  /// No description provided for @product_price.
  ///
  /// In pt, this message translates to:
  /// **'Preço do produto'**
  String get product_price;

  /// No description provided for @product_description.
  ///
  /// In pt, this message translates to:
  /// **'Descrição do produto'**
  String get product_description;

  /// No description provided for @products_not_found.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum produto encontrado'**
  String get products_not_found;

  /// No description provided for @save.
  ///
  /// In pt, this message translates to:
  /// **'Salvar'**
  String get save;

  /// No description provided for @dismiss.
  ///
  /// In pt, this message translates to:
  /// **'Cancelar'**
  String get dismiss;

  /// No description provided for @created.
  ///
  /// In pt, this message translates to:
  /// **'Salvo'**
  String get created;

  /// No description provided for @removed.
  ///
  /// In pt, this message translates to:
  /// **'Deletado'**
  String get removed;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

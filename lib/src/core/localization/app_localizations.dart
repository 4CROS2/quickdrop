import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
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
/// import 'localization/app_localizations.dart';
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
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('pt')
  ];

  /// Eslogan de la aplicación.
  ///
  /// In es, this message translates to:
  /// **'encuentra, compra, recibe'**
  String get slogan;

  /// Etiqueta para el campo de correo electrónico.
  ///
  /// In es, this message translates to:
  /// **'correo'**
  String get emailLabel;

  /// Etiqueta para el campo de contraseña.
  ///
  /// In es, this message translates to:
  /// **'contraseña'**
  String get passwordLabel;

  /// Etiqueta para la opción de recuperación de contraseña.
  ///
  /// In es, this message translates to:
  /// **'¿olvidaste la contraseña?'**
  String get passwordRecovery;

  /// Etiqueta para el campo de nombre.
  ///
  /// In es, this message translates to:
  /// **'nombre'**
  String get nameLabel;

  /// Etiqueta para el campo de apellido.
  ///
  /// In es, this message translates to:
  /// **'apellido'**
  String get lastNameLabel;

  /// Etiqueta para el campo de teléfono.
  ///
  /// In es, this message translates to:
  /// **'telefono'**
  String get phoneLabel;

  /// Etiqueta para el botón de iniciar sesión.
  ///
  /// In es, this message translates to:
  /// **'iniciar sesion'**
  String get loginButton;

  /// Etiqueta para el botón de registrarse.
  ///
  /// In es, this message translates to:
  /// **'registrarse'**
  String get signInButton;

  /// Etiqueta para preguntar si el usuario no tiene cuenta.
  ///
  /// In es, this message translates to:
  /// **'aun no tienes cuenta?'**
  String get newUser;

  /// Etiqueta para preguntar si el usuario ya tiene cuenta.
  ///
  /// In es, this message translates to:
  /// **'ya tienes una cuenta'**
  String get haveAccount;

  /// No description provided for @invalidCredential.
  ///
  /// In es, this message translates to:
  /// **'Las credenciales son inválidas.'**
  String get invalidCredential;

  /// No description provided for @invalidEmail.
  ///
  /// In es, this message translates to:
  /// **'El correo electrónico no es válido.'**
  String get invalidEmail;

  /// No description provided for @userDisabled.
  ///
  /// In es, this message translates to:
  /// **'El usuario ha sido deshabilitado.'**
  String get userDisabled;

  /// No description provided for @userNotFound.
  ///
  /// In es, this message translates to:
  /// **'No se encontró ningún usuario con ese correo electrónico.'**
  String get userNotFound;

  /// No description provided for @wrongPassword.
  ///
  /// In es, this message translates to:
  /// **'La contraseña es incorrecta.'**
  String get wrongPassword;

  /// No description provided for @unknownError.
  ///
  /// In es, this message translates to:
  /// **'Ocurrió un error desconocido.'**
  String get unknownError;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'de',
        'en',
        'es',
        'fr',
        'it',
        'pt'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}

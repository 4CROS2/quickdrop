// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get slogan => 'finden, kaufen, empfangen';

  @override
  String get emailLabel => 'E-Mail';

  @override
  String get passwordLabel => 'Passwort';

  @override
  String get passwordRecovery => 'Passwort vergessen?';

  @override
  String get nameLabel => 'Name';

  @override
  String get lastNameLabel => 'Nachname';

  @override
  String get phoneLabel => 'Telefon';

  @override
  String get loginButton => 'Anmelden';

  @override
  String get signInButton => 'Registrieren';

  @override
  String get newUser => 'noch keinen Account?';

  @override
  String get haveAccount => 'haben Sie bereits einen Account';

  @override
  String get invalidCredential => 'Ungültige Anmeldeinformationen.';

  @override
  String get invalidEmail => 'Die E-Mail-Adresse ist ungültig.';

  @override
  String get userDisabled => 'Der Benutzer wurde deaktiviert.';

  @override
  String get userNotFound =>
      'Kein Benutzer mit dieser E-Mail-Adresse gefunden.';

  @override
  String get wrongPassword => 'Das Passwort ist falsch.';

  @override
  String get unknownError => 'Ein unbekannter Fehler ist aufgetreten.';
}

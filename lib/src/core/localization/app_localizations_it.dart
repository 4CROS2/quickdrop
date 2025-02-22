// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get slogan => 'trova, compra, ricevi';

  @override
  String get emailLabel => 'email';

  @override
  String get passwordLabel => 'password';

  @override
  String get passwordRecovery => 'hai dimenticato la password?';

  @override
  String get nameLabel => 'nome';

  @override
  String get lastNameLabel => 'cognome';

  @override
  String get phoneLabel => 'telefono';

  @override
  String get loginButton => 'accedi';

  @override
  String get signInButton => 'registrati';

  @override
  String get newUser => 'non hai un account?';

  @override
  String get haveAccount => 'hai già un account';

  @override
  String get invalidCredential => 'Credenziali non valide.';

  @override
  String get invalidEmail => 'L\'indirizzo email non è valido.';

  @override
  String get userDisabled => 'L\'utente è stato disabilitato.';

  @override
  String get userNotFound =>
      'Nessun utente trovato con questo indirizzo email.';

  @override
  String get wrongPassword => 'La password è errata.';

  @override
  String get unknownError => 'Si è verificato un errore sconosciuto.';
}

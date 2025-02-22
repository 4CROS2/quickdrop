// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get slogan => 'find, buy, receive';

  @override
  String get emailLabel => 'email';

  @override
  String get passwordLabel => 'password';

  @override
  String get passwordRecovery => 'forgot your password?';

  @override
  String get nameLabel => 'name';

  @override
  String get lastNameLabel => 'last name';

  @override
  String get phoneLabel => 'phone';

  @override
  String get loginButton => 'log in';

  @override
  String get signInButton => 'sign up';

  @override
  String get newUser => 'dont have an account?';

  @override
  String get haveAccount => 'already have an account';

  @override
  String get invalidCredential => 'Invalid credentials.';

  @override
  String get invalidEmail => 'The email address is invalid.';

  @override
  String get userDisabled => 'The user has been disabled.';

  @override
  String get userNotFound => 'No user found with this email address.';

  @override
  String get wrongPassword => 'The password is incorrect.';

  @override
  String get unknownError => 'An unknown error occurred.';
}

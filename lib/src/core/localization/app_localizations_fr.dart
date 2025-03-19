// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get slogan => 'trouver, acheter, recevoir';

  @override
  String get emailLabel => 'courriel';

  @override
  String get passwordLabel => 'mot de passe';

  @override
  String get passwordRecovery => 'mot de passe oublié?';

  @override
  String get nameLabel => 'nom';

  @override
  String get lastNameLabel => 'prénom';

  @override
  String get phoneLabel => 'téléphone';

  @override
  String get loginButton => 'se connecter';

  @override
  String get signInButton => 's inscrire';

  @override
  String get newUser => 'vous n avez pas de compte?';

  @override
  String get haveAccount => 'vous avez déjà un compte';

  @override
  String get invalidCredential => 'Identifiants invalides.';

  @override
  String get invalidEmail => 'L\'adresse e-mail est invalide.';

  @override
  String get userDisabled => 'L\'utilisateur a été désactivé.';

  @override
  String get userNotFound => 'Aucun utilisateur trouvé avec cette adresse e-mail.';

  @override
  String get wrongPassword => 'Le mot de passe est incorrect.';

  @override
  String get unknownError => 'Une erreur inconnue s\'est produite.';
}

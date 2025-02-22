// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get slogan => 'encontrar, comprar, receber';

  @override
  String get emailLabel => 'e-mail';

  @override
  String get passwordLabel => 'senha';

  @override
  String get passwordRecovery => 'esqueceu sua senha?';

  @override
  String get nameLabel => 'nome';

  @override
  String get lastNameLabel => 'sobrenome';

  @override
  String get phoneLabel => 'telefone';

  @override
  String get loginButton => 'entrar';

  @override
  String get signInButton => 'inscrever-se';

  @override
  String get newUser => 'não tem uma conta?';

  @override
  String get haveAccount => 'já tem uma conta';

  @override
  String get invalidCredential => 'Credenciais inválidas.';

  @override
  String get invalidEmail => 'O endereço de e-mail é inválido.';

  @override
  String get userDisabled => 'O usuário foi desativado.';

  @override
  String get userNotFound =>
      'Nenhum usuário encontrado com este endereço de e-mail.';

  @override
  String get wrongPassword => 'A senha está incorreta.';

  @override
  String get unknownError => 'Ocorreu um erro desconhecido.';
}

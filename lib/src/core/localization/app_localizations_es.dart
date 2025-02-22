// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get slogan => 'encuentra, compra, recibe';

  @override
  String get emailLabel => 'correo';

  @override
  String get passwordLabel => 'contraseña';

  @override
  String get passwordRecovery => '¿olvidaste la contraseña?';

  @override
  String get nameLabel => 'nombre';

  @override
  String get lastNameLabel => 'apellido';

  @override
  String get phoneLabel => 'telefono';

  @override
  String get loginButton => 'iniciar sesion';

  @override
  String get signInButton => 'registrarse';

  @override
  String get newUser => 'aun no tienes cuenta?';

  @override
  String get haveAccount => 'ya tienes una cuenta';

  @override
  String get invalidCredential => 'Las credenciales son inválidas.';

  @override
  String get invalidEmail => 'El correo electrónico no es válido.';

  @override
  String get userDisabled => 'El usuario ha sido deshabilitado.';

  @override
  String get userNotFound => 'No se encontró ningún usuario con ese correo electrónico.';

  @override
  String get wrongPassword => 'La contraseña es incorrecta.';

  @override
  String get unknownError => 'Ocurrió un error desconocido.';
}

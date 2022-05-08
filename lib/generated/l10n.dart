// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Bely Boutique Princess`
  String get AppTitle {
    return Intl.message(
      'Bely Boutique Princess',
      name: 'AppTitle',
      desc: '',
      args: [],
    );
  }

  /// `graphics/images/LOGO4-small.png`
  String get logo {
    return Intl.message(
      'graphics/images/LOGO4-small.png',
      name: 'logo',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error_title {
    return Intl.message(
      'Error',
      name: 'error_title',
      desc: '',
      args: [],
    );
  }

  /// `Algo salió mal`
  String get error_desc {
    return Intl.message(
      'Algo salió mal',
      name: 'error_desc',
      desc: '',
      args: [],
    );
  }

  /// ` // HOME SCREENS `
  String get COMMENT1 {
    return Intl.message(
      ' // HOME SCREENS ',
      name: 'COMMENT1',
      desc: '',
      args: [],
    );
  }

  /// `Carrito`
  String get tooltip_bttn_shopping_card {
    return Intl.message(
      'Carrito',
      name: 'tooltip_bttn_shopping_card',
      desc: '',
      args: [],
    );
  }

  /// `Opciones`
  String get tooltip_bttn_options {
    return Intl.message(
      'Opciones',
      name: 'tooltip_bttn_options',
      desc: '',
      args: [],
    );
  }

  /// `Visitanos`
  String get menu_appbar_item1 {
    return Intl.message(
      'Visitanos',
      name: 'menu_appbar_item1',
      desc: '',
      args: [],
    );
  }

  /// `Configuracion`
  String get menu_appbar_item2 {
    return Intl.message(
      'Configuracion',
      name: 'menu_appbar_item2',
      desc: '',
      args: [],
    );
  }

  /// `Ayuda`
  String get menu_appbar_item3 {
    return Intl.message(
      'Ayuda',
      name: 'menu_appbar_item3',
      desc: '',
      args: [],
    );
  }

  /// `Cerrar sesión`
  String get menu_appbar_item4 {
    return Intl.message(
      'Cerrar sesión',
      name: 'menu_appbar_item4',
      desc: '',
      args: [],
    );
  }

  /// `Error al cargar las interfaces`
  String get Error_displaying_interaces {
    return Intl.message(
      'Error al cargar las interfaces',
      name: 'Error_displaying_interaces',
      desc: '',
      args: [],
    );
  }

  /// ` // ONBOARDING SCREENS `
  String get COMMENT2 {
    return Intl.message(
      ' // ONBOARDING SCREENS ',
      name: 'COMMENT2',
      desc: '',
      args: [],
    );
  }

  /// `Bienvenido`
  String get title_app {
    return Intl.message(
      'Bienvenido',
      name: 'title_app',
      desc: '',
      args: [],
    );
  }

  /// `Esta es una tienda que se dedica a vender vestidos para las princesas de casa.`
  String get description_app {
    return Intl.message(
      'Esta es una tienda que se dedica a vender vestidos para las princesas de casa.',
      name: 'description_app',
      desc: '',
      args: [],
    );
  }

  /// `Empezar`
  String get bttn_start {
    return Intl.message(
      'Empezar',
      name: 'bttn_start',
      desc: '',
      args: [],
    );
  }

  /// `Correo electrónico`
  String get email {
    return Intl.message(
      'Correo electrónico',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Correo no válido`
  String get validator_email_error {
    return Intl.message(
      'Correo no válido',
      name: 'validator_email_error',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get password {
    return Intl.message(
      'Contraseña',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña no válida`
  String get validator_password_error {
    return Intl.message(
      'Contraseña no válida',
      name: 'validator_password_error',
      desc: '',
      args: [],
    );
  }

  /// `Registrarse`
  String get bttn_register {
    return Intl.message(
      'Registrarse',
      name: 'bttn_register',
      desc: '',
      args: [],
    );
  }

  /// `Error de registro`
  String get register_error_title {
    return Intl.message(
      'Error de registro',
      name: 'register_error_title',
      desc: '',
      args: [],
    );
  }

  /// `Usuario existente`
  String get register_error_desc {
    return Intl.message(
      'Usuario existente',
      name: 'register_error_desc',
      desc: '',
      args: [],
    );
  }

  /// `Ingresar`
  String get bttn_login {
    return Intl.message(
      'Ingresar',
      name: 'bttn_login',
      desc: '',
      args: [],
    );
  }

  /// `Regresar`
  String get bttn_go_back {
    return Intl.message(
      'Regresar',
      name: 'bttn_go_back',
      desc: '',
      args: [],
    );
  }

  /// `Usuario`
  String get title_user_screen {
    return Intl.message(
      'Usuario',
      name: 'title_user_screen',
      desc: '',
      args: [],
    );
  }

  /// `Sexo`
  String get gender {
    return Intl.message(
      'Sexo',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Masculino`
  String get gender_male {
    return Intl.message(
      'Masculino',
      name: 'gender_male',
      desc: '',
      args: [],
    );
  }

  /// `Femenino`
  String get gender_female {
    return Intl.message(
      'Femenino',
      name: 'gender_female',
      desc: '',
      args: [],
    );
  }

  /// `Seleccionar fecha de nacimiento`
  String get bttn_date_birth {
    return Intl.message(
      'Seleccionar fecha de nacimiento',
      name: 'bttn_date_birth',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

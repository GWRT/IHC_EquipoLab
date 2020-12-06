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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `System Language`
  String get systemLanguage {
    return Intl.message(
      'System Language',
      name: 'systemLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get textLogIn {
    return Intl.message(
      'Log In',
      name: 'textLogIn',
      desc: '',
      args: [],
    );
  }

  /// `USER`
  String get textWithPlaceholderUserLogin {
    return Intl.message(
      'USER',
      name: 'textWithPlaceholderUserLogin',
      desc: '',
      args: [],
    );
  }

  /// `PASSWORD`
  String get textWithPlaceholderUserPassword {
    return Intl.message(
      'PASSWORD',
      name: 'textWithPlaceholderUserPassword',
      desc: '',
      args: [],
    );
  }

  /// `Did you forget your password?`
  String get questionForPassword {
    return Intl.message(
      'Did you forget your password?',
      name: 'questionForPassword',
      desc: '',
      args: [],
    );
  }

  /// `LOG IN`
  String get textButtonLogIn {
    return Intl.message(
      'LOG IN',
      name: 'textButtonLogIn',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN BY E-MAIL`
  String get textButtonLogInByEmail {
    return Intl.message(
      'LOGIN BY E-MAIL',
      name: 'textButtonLogInByEmail',
      desc: '',
      args: [],
    );
  }

  /// `You do not have an account?`
  String get questionForAccount {
    return Intl.message(
      'You do not have an account?',
      name: 'questionForAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sing Up`
  String get textRegister {
    return Intl.message(
      'Sing Up',
      name: 'textRegister',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get inputPlaceHolderEmail {
    return Intl.message(
      'Enter your email',
      name: 'inputPlaceHolderEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone to verify your identity`
  String get inputPlaceHolderYouFone {
    return Intl.message(
      'Enter your phone to verify your identity',
      name: 'inputPlaceHolderYouFone',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 6-digit password`
  String get inputDigitsForConfirm {
    return Intl.message(
      'Enter the 6-digit password',
      name: 'inputDigitsForConfirm',
      desc: '',
      args: [],
    );
  }

  /// `SEND`
  String get sendButton {
    return Intl.message(
      'SEND',
      name: 'sendButton',
      desc: '',
      args: [],
    );
  }

  /// `BACK`
  String get backButton {
    return Intl.message(
      'BACK',
      name: 'backButton',
      desc: '',
      args: [],
    );
  }

  /// `User List`
  String get textUserList {
    return Intl.message(
      'User List',
      name: 'textUserList',
      desc: '',
      args: [],
    );
  }

  /// `Enter a username`
  String get textInputUser {
    return Intl.message(
      'Enter a username',
      name: 'textInputUser',
      desc: '',
      args: [],
    );
  }

  /// `Enter a E-Mail`
  String get textInputEmail {
    return Intl.message(
      'Enter a E-Mail',
      name: 'textInputEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter a Password`
  String get textInputPassword {
    return Intl.message(
      'Enter a Password',
      name: 'textInputPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get textInputConfirmPassword {
    return Intl.message(
      'Confirm your password',
      name: 'textInputConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `your registration was successful`
  String get textConfirmSingup {
    return Intl.message(
      'your registration was successful',
      name: 'textConfirmSingup',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es', countryCode: 'PE'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
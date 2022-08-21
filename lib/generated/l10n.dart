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

  // skipped getter for the 'Do meditation. Stay focused' key

  // skipped getter for the 'Live a healthy life.' key

  /// `Welcome`
  String get Welcome {
    return Intl.message(
      'Welcome',
      name: 'Welcome',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Create an account to get started on your health and happiness journey' key

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Email Address' key

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Forgot Password?' key

  // skipped getter for the 'Don’t have an account ? Register' key

  /// `Register`
  String get Register {
    return Intl.message(
      'Register',
      name: 'Register',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'First Name' key

  // skipped getter for the 'Last Name*' key

  // skipped getter for the 'Already have an account ? Login' key

  // skipped getter for the 'Good morning' key

  // skipped getter for the 'Good afternoon' key

  // skipped getter for the 'Good night' key

  // skipped getter for the 'Start Your Day' key

  // skipped getter for the 'Your afternoon lift' key

  // skipped getter for the 'At Night' key

  /// ``
  String get Today {
    return Intl.message(
      '',
      name: 'Today',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get Explore {
    return Intl.message(
      '',
      name: 'Explore',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get Favorite {
    return Intl.message(
      '',
      name: 'Favorite',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Find all your favorites meditation' key

  // skipped getter for the 'and exercirs here.' key

  /// ``
  String get Recent {
    return Intl.message(
      '',
      name: 'Recent',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get Featured {
    return Intl.message(
      '',
      name: 'Featured',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get Sleep {
    return Intl.message(
      '',
      name: 'Sleep',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get Focus {
    return Intl.message(
      '',
      name: 'Focus',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get Notification {
    return Intl.message(
      '',
      name: 'Notification',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get Meditate {
    return Intl.message(
      '',
      name: 'Meditate',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get Setting {
    return Intl.message(
      '',
      name: 'Setting',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Account Information' key

  // skipped getter for the 'Invite Friend' key

  // skipped getter for the 'My Data' key

  // skipped getter for the 'Terms & Conditions' key

  /// ``
  String get Downloads {
    return Intl.message(
      '',
      name: 'Downloads',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Privacy Policy' key

  /// ``
  String get Support {
    return Intl.message(
      '',
      name: 'Support',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Log Out' key

  // skipped getter for the 'You’ve used all you invites. More to come at' key

  // skipped getter for the 'the appropriate time.' key

  // skipped getter for the 'Send Invite' key

  // skipped getter for the 'Did someone forget their password ?' key

  // skipped getter for the 'Just enter the email address you’ve used to register with us and we’ll send you a reset link !' key

  /// ``
  String get Submit {
    return Intl.message(
      '',
      name: 'Submit',
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

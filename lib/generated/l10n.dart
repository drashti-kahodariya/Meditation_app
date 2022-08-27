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

  /// `Meditera. Var fokuserad.`
  String get doMeditationStayFocused {
    return Intl.message(
      'Meditera. Var fokuserad.',
      name: 'doMeditationStayFocused',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'liveAHealthyLife.' key

  /// `Välkommen`
  String get welcome {
    return Intl.message(
      'Välkommen',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Skapa ett konto och börja med din hälsa och glädje resa`
  String get createAnAccountToGetStartedOnYourHealthAndHappinessJourney {
    return Intl.message(
      'Skapa ett konto och börja med din hälsa och glädje resa',
      name: 'createAnAccountToGetStartedOnYourHealthAndHappinessJourney',
      desc: '',
      args: [],
    );
  }

  /// `Logga in`
  String get login {
    return Intl.message(
      'Logga in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email adress`
  String get emailAddress {
    return Intl.message(
      'Email adress',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Lösenord`
  String get password {
    return Intl.message(
      'Lösenord',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Glömt lösenord?`
  String get forgotPassword {
    return Intl.message(
      'Glömt lösenord?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'don’tHaveAnAccount' key

  /// `Registrera`
  String get register {
    return Intl.message(
      'Registrera',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Förnamn`
  String get firstName {
    return Intl.message(
      'Förnamn',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Efternamn`
  String get lastName {
    return Intl.message(
      'Efternamn',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Har redan ett konto? Logga in`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Har redan ett konto? Logga in',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `God morgon`
  String get goodMorning {
    return Intl.message(
      'God morgon',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `God eftermiddag`
  String get goodAfternoon {
    return Intl.message(
      'God eftermiddag',
      name: 'goodAfternoon',
      desc: '',
      args: [],
    );
  }

  /// `Godnatt`
  String get goodNight {
    return Intl.message(
      'Godnatt',
      name: 'goodNight',
      desc: '',
      args: [],
    );
  }

  /// `Starta din dag`
  String get startYourDay {
    return Intl.message(
      'Starta din dag',
      name: 'startYourDay',
      desc: '',
      args: [],
    );
  }

  /// `Din eftermiddags lyft`
  String get yourAfternoonLift {
    return Intl.message(
      'Din eftermiddags lyft',
      name: 'yourAfternoonLift',
      desc: '',
      args: [],
    );
  }

  /// `Till kvällen`
  String get atNight {
    return Intl.message(
      'Till kvällen',
      name: 'atNight',
      desc: '',
      args: [],
    );
  }

  /// `Idag`
  String get today {
    return Intl.message(
      'Idag',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Utforsa`
  String get explore {
    return Intl.message(
      'Utforsa',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `Favoriter`
  String get favorite {
    return Intl.message(
      'Favoriter',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'findAllYourFavoritesMeditationAndExerciesHere.' key

  /// `Nydligen spelade`
  String get recent {
    return Intl.message(
      'Nydligen spelade',
      name: 'recent',
      desc: '',
      args: [],
    );
  }

  /// `Utvalda`
  String get featured {
    return Intl.message(
      'Utvalda',
      name: 'featured',
      desc: '',
      args: [],
    );
  }

  /// `Sömn`
  String get sleep {
    return Intl.message(
      'Sömn',
      name: 'sleep',
      desc: '',
      args: [],
    );
  }

  /// `Fokus`
  String get focus {
    return Intl.message(
      'Fokus',
      name: 'focus',
      desc: '',
      args: [],
    );
  }

  /// `Notifikation`
  String get notification {
    return Intl.message(
      'Notifikation',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Meditera`
  String get meditate {
    return Intl.message(
      'Meditera',
      name: 'meditate',
      desc: '',
      args: [],
    );
  }

  /// `Inställningar`
  String get setting {
    return Intl.message(
      'Inställningar',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Konto information`
  String get accountInformation {
    return Intl.message(
      'Konto information',
      name: 'accountInformation',
      desc: '',
      args: [],
    );
  }

  /// `Bjud in en vän`
  String get inviteFriend {
    return Intl.message(
      'Bjud in en vän',
      name: 'inviteFriend',
      desc: '',
      args: [],
    );
  }

  /// `Min data`
  String get myData {
    return Intl.message(
      'Min data',
      name: 'myData',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'terms&Conditions' key

  /// `Nedladdningar`
  String get downloads {
    return Intl.message(
      'Nedladdningar',
      name: 'downloads',
      desc: '',
      args: [],
    );
  }

  /// `integritetspolicy`
  String get privacyPolicy {
    return Intl.message(
      'integritetspolicy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Logga ut`
  String get logOut {
    return Intl.message(
      'Logga ut',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'you’veUsedAllYouInvitesMoreToComeAtTheAppropriateTime.' key

  /// `Skicka inbjudan`
  String get sendInvite {
    return Intl.message(
      'Skicka inbjudan',
      name: 'sendInvite',
      desc: '',
      args: [],
    );
  }

  /// `Har någon glömt sitt lösenord?`
  String get didSomeoneForgetTheirPassword {
    return Intl.message(
      'Har någon glömt sitt lösenord?',
      name: 'didSomeoneForgetTheirPassword',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'justEnterTheEmailAddressYou’veUsedToRegisterWithUsAndWe’llSendYouAResetLink' key

  /// `Skicka in`
  String get submit {
    return Intl.message(
      'Skicka in',
      name: 'submit',
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
      Locale.fromSubtags(languageCode: 'sv'),
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization? of(BuildContext context) {
    return Localizations.of(context, AppLocalization);
  }

  Map<String, String> _localizedValues = {'': ''};

  Future loadJson() async {
    final jsonStringValues =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');

    final mappedJson = json.decode(jsonStringValues) as Map<String, dynamic>;
    _localizedValues =
        mappedJson.map((key, dynamic value) => MapEntry(key, value.toString()));
  }

  String getTranslatedValues(String key) {
    return _localizedValues[key] as String;
  }

  static LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  @override
  bool isSupported(Locale locale) {
    return ['de', 'en', 'ru'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    final localization = AppLocalization(locale);
    await localization.loadJson();
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) {
    return false;
  }
}

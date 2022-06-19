import 'package:flutter/material.dart';

mixin LanguageList {
  static ValueNotifier<List<bool>> langList = ValueNotifier([false, false, false]);

  static List<bool> changeLanguage(int index) {
    langList.value = [false, false, false];
    langList.value[index] = true;
    return langList.value;
  }
}

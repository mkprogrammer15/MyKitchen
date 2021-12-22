mixin LanguageList {
  static List<bool> langList = [false, false, false];

  static List<bool> changeLanguage(int index) {
    langList = [false, false, false];
    langList[index] = true;
    return langList;
  }
}

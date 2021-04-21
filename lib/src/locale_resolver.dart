class Locale {
  static const Map<String, String> _supportedLocales = const {
    'ar': 'arabic',
    'en': 'english',
    'fr': 'french',
    'de': 'german',
    'es': 'spanish',
    'it': 'italian',
    'pt': 'portuguese',
    'nl': 'dutch',
    'pl': 'polish',
    'cs': 'czech',
    'ru': 'russian',
    'tr': 'turkish',
    'sv': 'swedish',
    'da': 'danish',
    'no': 'norwegian',
    'fi': 'finnish',
    'ja': 'japanese',
    'zh': 'chinese',
    'hi': 'hindi',
    'ko': 'korean',
    'id': 'indonesian',
    'ur': 'urdu'
  };

  static void evaluate({String locale, List<String> inputLocales}) {
    if (!_supportedLocales.keys.contains(locale)) {
      throw '\u001b[31m' +
          'Unsupported Fallback Locale ===> $locale' +
          '\u001b[0m';
    }

    if (!inputLocales.contains(locale)) {
      throw '\u001b[31m' +
          'Fallback Locale: "$locale" doesn\'t exist in your supported languages list' +
          '\u001b[0m';
      //throw 'Error Code: 210';
    }

    inputLocales.forEach((locale) {
      if (!_supportedLocales.keys.contains(locale)) {
        throw '\u001b[31m' + 'Unsupported Locale ===> $locale' + '\u001b[0m';
      }
    });
  }

  static String resolveLocale(String locale) {
    return _supportedLocales[locale];
  }
}

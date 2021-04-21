import 'package:fluent/fluent_dependency.dart';

class Fluent {
  final List<Translatable> translations;
  final String fallbackLanguage;
  final List<String> supportedLanguages;
  final String fromCSV;

  const Fluent(
      {this.translations,
      this.fallbackLanguage,
      this.supportedLanguages,
      this.fromCSV})
      : assert(fallbackLanguage != null, 'Fallback language must be provided'),
        assert(supportedLanguages != null,
            'You must add at least one supported language');
}

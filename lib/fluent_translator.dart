import 'package:fluent_translator/fluent_dependency.dart';

class Fluent {
  final List<Translatable>? translations;
  final String fallbackLanguage;
  final List<String> supportedLanguages;
  final String? fromCSV;

  const Fluent({
    this.translations,
    required this.fallbackLanguage,
    required this.supportedLanguages,
    this.fromCSV,
  }) : assert(
          translations != null || fromCSV != null,
          'Translations must be provided either by a list of Translatable objects or from a CSV file',
        );
}

class Translatable {
  final String arabic;
  final String english;
  final String french;
  final String german;
  final String spanish;
  final String italian;
  final String portuguese;
  final String dutch;
  final String polish;
  final String czech;
  final String russian;
  final String turkish;
  final String swedish;
  final String danish;
  final String norwegian;
  final String finnish;
  final String japanese;
  final String chinese;
  final String hindi;
  final String korean;
  final String fieldName;

  const Translatable(
      {this.arabic,
      this.english,
      this.french,
      this.german,
      this.spanish,
      this.italian,
      this.portuguese,
      this.dutch,
      this.polish,
      this.czech,
      this.russian,
      this.turkish,
      this.swedish,
      this.danish,
      this.norwegian,
      this.finnish,
      this.japanese,
      this.chinese,
      this.hindi,
      this.korean,
      this.fieldName})
      : assert(fieldName != null, 'Translation field name must be provided');
}

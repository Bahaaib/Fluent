<p align="center">
<img  src="https://firebasestorage.googleapis.com/v0/b/sercl-7b895.appspot.com/o/fluent_logo.svg?alt=media&token=e4f320f7-150c-4792-8110-f800a0caaf4c" height="170">
</p>

<p align="center">
<a href="https://img.shields.io/badge/License-MIT-green"><img src="https://img.shields.io/badge/License-MIT-blueviolet" alt="MIT License"></a>
<a href="https://pub.dev/packages/auto_route/versions/1.0.2"><img src="https://img.shields.io/badge/version-1.0.0-green"></a>
</p>

### Introduction
##### What is Fluent?
It’s a Flutter package that helps you handling your project translations via code generation techniques.
##### Why Fluent?
Fluent came to get rid of the boilerplate code that the developers used to write to build translations into their apps. It wasn't coding at all more than time wasting and totally error prone process. So why not let the machine does it?!

### Installation

```yaml
dependencies:
  fluent: [latest-version]

dev_dependencies:
  fluent_generator: [latest-version]
  build_runner:
```

### Setup and Usage

---

Create a placeholder class and annotate it with `@Fluent` which takes: 
* A list of `Translatable` objects (in case you'll provide your translations manually)
* A CSV file path (in case your translations will be provided `fromCSV`)
* A list of locales for the supported languages as a required argument.
* A `fallback language` as a required argument.

**Note**: In case of loading translations from a CSV file. Please consider to declare it first in the `assets` section of your project `pubspec.yaml` file.

```dart
/// In case loading translations from a CSV file

@Fluent(
  fromCSV: 'assets/csv_test.csv',
  fallbackLanguage: 'ar',
  supportedLanguages: ['ar', 'en', 'fr']
)
class Translations {}

/// In case manually provide the traslations into [Translatable] objects
@Fluent(
  fallbackLanguage: 'ar',
  supportedLanguages: [
    'ar',
    'en',
    'fr',
  ],
  translations: [
    Translatable(
      arabic: 'مرحبا',
      english: 'Hello',
      french: 'Salut',
      fieldName: 'helloText',
    )
  ],
)
class Translations {}
```
**Note**: In case of providing both CSV file & a list of `Translatable` objects. `Fluent` is designed to overwrite the content of the `Translatable`s with the CSV file content. It will not add content from both resources.

**Note**: Make sure that you're using a valid ISO-639-1 locale codes in the `supportedLanguages` list. You can find a [full list here](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes#ID)

Lastly, You need to launch `build_runner` to start translations code generation using command `flutter pub run build_runner build` for a single time or using command `flutter pub run build_runner watch` to keep tracking the changes in the file system and automatically update the translations.


## CSV file content structure
For your CSV file be parsed correctly. You need to struct its content in a unified way according to the following rules
* Starting from cell A1, add all your locales in the first cell of each column (e.g.: ar, en, fr,...etc)
* After the last locale cell directly, add additional cell with text "fieldName"
* List all your translations of a certain language in the column related to its locale. (e.g.: Arabic translations in `ar` column)
* list the unique correspondant field name to each translation in `fieldName` column. If any field name duplicated in this column that will lead to errors in code generation process.
* If you need to add extra information in your CSV file, Skip one column empty next to the right of `fieldName` column. Any type of data will be added next to the empty column will be ignored and won't be parsed in any form into code.
* Make sure that no empty columns added between locales columns or before `fieldName` column
* Make sure that `fieldName` spelling and format _(Camelcase)_ is correct.

For full CSV file example, kindly download this [CSV file example](https://drive.google.com/file/d/1UGsoUkxWiiccSOsuIkedinJanOs5OpM2/view?usp=sharing)


## Working with Language Manager
Fluent is designed not to only generate your translations for different locales. It also generates a `Language Manager` that orchestrate the locale changes against the available translations during your app lifetime. 

### Fetch initial language
`LanguageManager` class includes `init()` function that will by default fetch your device current language and set as your locale. If you need the language manager to look into your local cache system (e.g.: Shared Preferences) you can pass named argument `LanguageSource.LOCAL_CACHE` as you can change it anytime to `LanguageSource.DEVICE` to reset default settings.

### Detect locale changes at runtime
`LanguageManager` will help you listen to any locale runtime changes by providing `onLanguageChanged()` that passes a string value for the updated locale code. It's recommended to implement it at the earliest point of your app (e.g.: `MyApp` class). If you're using any previous language stream listeners, `onLanguageChanged()` can replace it peacefully without a noticeable breaking change. It's worth mentioning that you can use `LanguageManager.currentCode` getter to get the most recent locale anywhere in your app.

### Update remote server locale
`LanguageManager` is equipped with `setServerLocale()` function that is able to update your logged in entity (e.g.: customer, user, ..etc) on the server database so that all future results fetched from server should be translated into your updated language locale. You'll need to provide `setServerLocale()` with some arguments to help it do its job. `languageNodeName`, `locale` and `id` are required arguments to execute the server request. Meanwhile, you can tell `LanguageManager` to cache this lacale by setting `locallyCached` argument to `true` as it will NOT cache your locales by default to save resources and perform faster. 

### Release resources
All `LanguageManager`'s streams and listeners could be unsubscribed hence released from memory easily by dart garbage collector (DGC) by simply calling `dispose()` function. Unlike `Init()`, it's recommended to call `dispose()` at the latest point of your app which is usually the `dispose()` function of `MyApp` class widget

import 'package:english_words/english_words.dart';

class WordService {
  List<String> generateNouns(
    int count, {
    String? firstLetter,
    String? lastLetter,
    int? lenght,
    int? syllableLenght,
    Comparison comparison = Comparison.equals,
  }) {
    final filteredNouns = nouns.where((value) {
      if (firstLetter != null) {
        if (!value.startsWith(firstLetter)) return false;
      }
      if (lastLetter != null) {
        if (!value.endsWith(lastLetter)) return false;
      }
      return true;
    }).where((value) {
      return _nounComparisonTest(value, comparison, value.length, lenght);
    }).where((value) {
      if (syllableLenght == null) return true;
      return _nounComparisonTest(value, comparison, syllables(value), lenght);
    }).toList();
    return (filteredNouns..shuffle()).take(count).toList();
  }

  bool _nounComparisonTest(String value, Comparison comparison, int a, int? b) {
    if (b == null) return true;
    switch (comparison) {
      case Comparison.equals:
        return a == b;
      case Comparison.greaterThan:
        return a > b;
      case Comparison.lessThan:
        return a < b;
    }
  }
}

enum Comparison {
  equals('equals'),
  greaterThan('greaterThan'),
  lessThan('lessThan');

  const Comparison(this.value);

  factory Comparison.fromString(String? value) {
    if (value == greaterThan.value) return greaterThan;
    if (value == lessThan.value) return lessThan;
    return equals;
  }

  final String value;
}

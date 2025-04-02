import 'grammar_agglutinative.dart';

/// Finds all unique terminal symbols from the grammar rules.
List<String> findTerminals(List<GrammarRule> rules) {
  final terminalNames = <String>{};

  for (final rule in rules) {
    for (final symbol in rule.expansion) {
      if (symbol.isTerminal) {
        terminalNames.add(symbol.name);
      }
    }
  }

  return terminalNames.toList()..sort();
}

int processSequencesUpToLength(List<String> items, int maxLength, void Function(List<String> sequence) action) {
  if (items.isEmpty || maxLength <= 0) {
    return 0;
  }

  int sequenceCount = 0;
  final int n = items.length;

  for (int length = 1; length <= maxLength; length++) {
    int totalSequences = 1;
    for (int i = 0; i < length; i++) {
      totalSequences *= n;
    }

    for (int index = 0; index < totalSequences; index++) {
      List<String> sequence = List.filled(length, '');
      int tempIndex = index;

      // Convert index to a sequence by treating it as a base-n number
      for (int pos = length - 1; pos >= 0; pos--) {
        int itemIndex = tempIndex % n;
        sequence[pos] = items[itemIndex];
        tempIndex ~/= n;
      }

      action(sequence);
      sequenceCount++;
    }
  }

  return sequenceCount;
}

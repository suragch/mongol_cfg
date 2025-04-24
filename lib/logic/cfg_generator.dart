import 'dart:math';

import 'package:mongol_cfg/logic/grammar_agglutinative.dart';

import 'symbol.dart';

(String sentence, String parseTree) generateRandomSentence() {
  var sentence = [const Symbol('S')];
  var hasNonTerminal = true;
  final parseTree = StringBuffer();

  while (hasNonTerminal) {
    hasNonTerminal = false;
    var newSentence = <Symbol>[];

    for (var symbol in sentence) {
      if (symbol.isNonTerminal) {
        hasNonTerminal = true;
        final matchingRules = productionRules.where((rule) => rule.symbol == symbol).toList();
        final selectedRule = matchingRules[Random().nextInt(matchingRules.length)];
        newSentence.addAll(selectedRule.expansion);
      } else {
        newSentence.add(symbol);
      }
    }
    parseTree.writeln(sentence);
    sentence = newSentence;
  }

  final output = sentence.map((symbol) => symbol.name).join(' ');
  return (output, parseTree.toString());
}

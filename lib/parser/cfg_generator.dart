import 'dart:math';

import 'package:mongol_cfg/parser/grammar.dart';

import 'symbol.dart';

String generateRandomSentence() {
  var sentence = [const CfgSymbol('S')];
  var hasNonTerminal = true;
  print(sentence);

  while (hasNonTerminal) {
    hasNonTerminal = false;
    var newSentence = <CfgSymbol>[];

    for (var symbol in sentence) {
      if (symbol.isNonTerminal) {
        hasNonTerminal = true;
        final matchingRules = grammarRules.where((rule) => rule.symbol == symbol).toList();
        final selectedRule = matchingRules[Random().nextInt(matchingRules.length)];
        newSentence.addAll(selectedRule.expansion);
      } else {
        newSentence.add(symbol);
      }
    }
    print(newSentence);

    sentence = newSentence;
  }

  return sentence.map((symbol) => symbol.name).join(' ');
}

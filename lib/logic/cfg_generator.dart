import 'dart:math';

import 'package:mongol_cfg/logic/grammar.dart';

import 'symbol.dart';

(String sentence, String parseTree) generateRandomSentence() {
  var sentence = [const CfgSymbol('S')];
  var hasNonTerminal = true;
  // print(sentence);
  final parseTree = StringBuffer();
  // parseTree.writeln(sentence);

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
    // print(newSentence);
    parseTree.writeln(sentence);

    sentence = newSentence;
  }

  final output = sentence.map((symbol) => symbol.name).join(' ');
  return (output, parseTree.toString());
}

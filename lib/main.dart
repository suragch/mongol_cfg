// import 'package:mongol_cfg/cases/sentence_types.dart';

import 'parser/grammar.dart';
import 'parser/pda_parser.dart';
import 'parser/symbol.dart';

// void main() {
//   // final sentence = NominativeSentence();
//   // final sentence = GenitiveSentence();
//   // final sentence = DativeLocativeSentence();
//   // final sentence = DativeLocativeSentence();
//   // final sentence = AblativeSentence();
//   // final sentence = InstrumentalSentence();
//   // final sentence = ComitativeSentence();
//   // final sentence = DirectiveSentence();
//   for (int i = 0; i < 10; i++) {
//     final sentence = Sentence.random();
//     print(sentence.createExample());
//   }
// }

void main() {
  // Define the grammar rules
  const grammarRules = [
    GrammarRule(CfgSymbol('S'), [CfgSymbol('NP'), CfgSymbol('VP')]),
    GrammarRule(CfgSymbol('NP'), [CfgSymbol('N')]),
    GrammarRule(CfgSymbol('VP'), [CfgSymbol('V'), CfgSymbol('N')]),
    GrammarRule(CfgSymbol('N'), [CfgSymbol('i', isTerminal: true)]),
    GrammarRule(CfgSymbol('N'), [CfgSymbol('dogs', isTerminal: true)]),
    GrammarRule(CfgSymbol('N'), [CfgSymbol('cats', isTerminal: true)]),
    GrammarRule(CfgSymbol('V'), [CfgSymbol('like', isTerminal: true)]),
    GrammarRule(CfgSymbol('V'), [CfgSymbol('see', isTerminal: true)]),
  ];

  // Create PDA parser
  final parser = PDAParser(
    grammarRules: grammarRules,
    startSymbol: const CfgSymbol('S'),
  );

  // Input sentence
  final sentence = ['i', 'see', 'people'];
  // final sentence = ['i', 'like', 'dogs'];

  // Parse the sentence
  bool isValid = parser.parse(sentence);

  if (isValid) {
    print('The sentence "$sentence" is valid according to the grammar.');
  } else {
    print('The sentence "$sentence" is NOT valid according to the grammar.');
  }
}

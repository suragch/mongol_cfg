// import 'package:mongol_cfg/cases/sentence_types.dart';

import 'package:mongol_cfg/parser/cfg_generator.dart';

import 'parser/grammar.dart';
import 'parser/pda_parser.dart';
import 'parser/symbol.dart';

void main() {
  // final sentence = NominativeSentence();
  // final sentence = GenitiveSentence();
  // final sentence = DativeLocativeSentence();
  // final sentence = DativeLocativeSentence();
  // final sentence = AblativeSentence();
  // final sentence = InstrumentalSentence();
  // final sentence = ComitativeSentence();
  // final sentence = DirectiveSentence();
  final sentence = generateRandomSentence();
  print(sentence);
  // for (int i = 0; i < 10; i++) {
  // }
}

void main2() {
  // Define the grammar rules
  // const grammarRules = [
  //   GrammarRule(CfgSymbol('S'), [CfgSymbol('NP'), CfgSymbol('VP')]),
  //   GrammarRule(CfgSymbol('NP'), [CfgSymbol('N')]),
  //   GrammarRule(CfgSymbol('VP'), [CfgSymbol('V'), CfgSymbol('N')]),
  //   GrammarRule(CfgSymbol('N'), [CfgSymbol('i', isTerminal: true)]),
  //   GrammarRule(CfgSymbol('N'), [CfgSymbol('dogs', isTerminal: true)]),
  //   GrammarRule(CfgSymbol('N'), [CfgSymbol('cats', isTerminal: true)]),
  //   GrammarRule(CfgSymbol('V'), [CfgSymbol('like', isTerminal: true)]),
  //   GrammarRule(CfgSymbol('V'), [CfgSymbol('see', isTerminal: true)]),
  // ];

  // Create PDA parser
  final parser = PDAParser(
    grammarRules: grammarRules,
    startSymbol: const CfgSymbol('S'),
  );

  // Input sentence
  // final sentence = ['тэр', 'ирсэн'];
  // final sentence = ['түүний', 'ээж', 'ирсэн'];
  // final sentence = ['би', 'ирсэн'];
  // final sentence = ['бат', 'явж байна'];
  // final sentence = ['ээж', 'ирнэ'];

  // final sentence = ['түүний', 'ээж', 'ирсэн'];
  // final sentence = ['миний', 'аав', 'явж байна'];
  // final sentence = ['батын', 'морь', 'явна'];

  // final sentence = ['би', 'улаанбаатарт', 'ирсэн'];
  // final sentence = ['тэр', 'гэрт', 'явж байна'];
  // final sentence = ['бат', 'ээжид', 'ирнэ'];

  // final sentence = ['би', 'энэ', 'номыг', 'авсан'];
  // final sentence = ['тэр', 'тэр', 'мөнгийг', 'авж байна'];
  // final sentence = ['ээж', 'энэ', 'морийг', 'авна'];

  // final sentence = ['би', 'америкаас', 'ирсэн'];
  // final sentence = ['бат', 'ээжээс', 'явж байна'];
  // final sentence = ['ээж', 'мориноос', 'ирнэ'];

  // final sentence = ['би', 'машинаар', 'ирсэн'];
  // final sentence = ['бат', 'мориор', 'явж байна'];

  // final sentence = ['би', 'түүнтэй', 'ирсэн'];
  // final sentence = ['бат', 'надтай', 'явж байна'];
  // final sentence = ['ээж', 'аавтай', 'ирнэ'];
  // final sentence = ['тэр', 'морьтой', 'явна'];

  // final sentence = ['би', 'америк руу', 'ирсэн'];
  // final sentence = ['бат', 'гол руу', 'явж байна'];
  final sentence = ['ээж', 'дэлгүүр лүү', 'ирнэ'];

  // Parse the sentence
  bool isValid = parser.parse(sentence);

  if (isValid) {
    print('The sentence "$sentence" is valid according to the grammar.');
  } else {
    print('The sentence "$sentence" is NOT valid according to the grammar.');
  }
}

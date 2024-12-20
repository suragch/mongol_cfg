import 'dart:core' hide Symbol;

import 'symbol.dart';

class GrammarRule {
  const GrammarRule(this.symbol, this.expansion);
  final CfgSymbol symbol;
  final List<CfgSymbol> expansion;
}

const grammarRules = [
  GrammarRule(CfgSymbol('S'), [CfgSymbol('NounPhrase'), CfgSymbol('Verb')]),
  GrammarRule(CfgSymbol('NounPhrase'), [CfgSymbol('NomNoun')]),
  GrammarRule(CfgSymbol('Verb'), [CfgSymbol('PastVerb')]),
  GrammarRule(CfgSymbol('Verb'), [CfgSymbol('PresentVerb')]),
  GrammarRule(CfgSymbol('Verb'), [CfgSymbol('FutureVerb')]),
  GrammarRule(CfgSymbol('NomNoun'), [CfgSymbol('Pronoun')]),
  GrammarRule(CfgSymbol('NomNoun'), [CfgSymbol('Name')]),
  GrammarRule(CfgSymbol('NomNoun'), [CfgSymbol('RegularNoun')]),
  GrammarRule(CfgSymbol('Pronoun'), [CfgSymbol('тэр', isTerminal: true)]),
  GrammarRule(CfgSymbol('Pronoun'), [CfgSymbol('би', isTerminal: true)]),
  GrammarRule(CfgSymbol('Name'), [CfgSymbol('бат', isTerminal: true)]),
  GrammarRule(CfgSymbol('Name'), [CfgSymbol('мишээл', isTerminal: true)]),
  GrammarRule(CfgSymbol('RegularNoun'), [CfgSymbol('аав', isTerminal: true)]),
  GrammarRule(CfgSymbol('RegularNoun'), [CfgSymbol('ээж', isTerminal: true)]),
  GrammarRule(CfgSymbol('RegularNoun'), [CfgSymbol('морь', isTerminal: true)]),
  GrammarRule(CfgSymbol('PastVerb'), [CfgSymbol('ирсэн', isTerminal: true)]),
  GrammarRule(CfgSymbol('PastVerb'), [CfgSymbol('явсан', isTerminal: true)]),
  GrammarRule(CfgSymbol('PresentVerb'), [CfgSymbol('ирж байна', isTerminal: true)]),
  GrammarRule(CfgSymbol('PresentVerb'), [CfgSymbol('явж байна', isTerminal: true)]),
  GrammarRule(CfgSymbol('FutureVerb'), [CfgSymbol('ирнэ', isTerminal: true)]),
  GrammarRule(CfgSymbol('FutureVerb'), [CfgSymbol('явна', isTerminal: true)]),
];

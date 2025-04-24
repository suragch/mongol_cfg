import 'dart:core' hide Symbol;

import 'symbol.dart';

class GrammarRule {
  const GrammarRule(this.symbol, this.expansion);
  final CfgSymbol symbol;
  final List<CfgSymbol> expansion;
}

const grammarRules = [
  // Non-terminal symbols
  GrammarRule(CfgSymbol('S'), [CfgSymbol('NounPhrase'), CfgSymbol('Verb')]),

  GrammarRule(CfgSymbol('NounPhrase'), [CfgSymbol('NominativeCase')]),
  GrammarRule(CfgSymbol('NounPhrase'), [CfgSymbol('GenitiveCase'), CfgSymbol('Noun')]),
  GrammarRule(CfgSymbol('NounPhrase'), [CfgSymbol('Noun'), CfgSymbol('DativeLocativeCase')]),
  GrammarRule(CfgSymbol('NounPhrase'), [CfgSymbol('Noun'), CfgSymbol('AccusativeCase')]),
  GrammarRule(CfgSymbol('NounPhrase'), [CfgSymbol('Noun'), CfgSymbol('AblativeCase')]),
  GrammarRule(CfgSymbol('NounPhrase'), [CfgSymbol('Noun'), CfgSymbol('InstrumentalCase')]),
  GrammarRule(CfgSymbol('NounPhrase'), [CfgSymbol('Noun'), CfgSymbol('ComitativeCase')]),
  GrammarRule(CfgSymbol('NounPhrase'), [CfgSymbol('Noun'), CfgSymbol('DirectiveCase')]),

  GrammarRule(CfgSymbol('NominativeCase'), [CfgSymbol('Noun')]),
  GrammarRule(CfgSymbol('NominativeCase'), [CfgSymbol('Noun'), CfgSymbol('Noun')]),
  GrammarRule(CfgSymbol('GenitiveCase'), [CfgSymbol('Noun'), CfgSymbol('-ын', isTerminal: true)]),
  GrammarRule(CfgSymbol('DativeLocativeCase'), [CfgSymbol('Noun'), CfgSymbol('-д', isTerminal: true)]),
  GrammarRule(CfgSymbol('AccusativeCase'), [CfgSymbol('Noun'), CfgSymbol('-ыг', isTerminal: true)]),
  GrammarRule(CfgSymbol('AblativeCase'), [CfgSymbol('Noun'), CfgSymbol('-аас', isTerminal: true)]),
  GrammarRule(CfgSymbol('InstrumentalCase'), [CfgSymbol('Noun'), CfgSymbol('-аар', isTerminal: true)]),
  GrammarRule(CfgSymbol('ComitativeCase'), [CfgSymbol('Noun'), CfgSymbol('-тай', isTerminal: true)]),
  GrammarRule(CfgSymbol('DirectiveCase'), [CfgSymbol('Noun'), CfgSymbol('руу', isTerminal: true)]),

  // Terminal symbols
  GrammarRule(CfgSymbol('Noun'), [CfgSymbol('тэр', isTerminal: true)]),
  GrammarRule(CfgSymbol('Noun'), [CfgSymbol('би', isTerminal: true)]),
  GrammarRule(CfgSymbol('Noun'), [CfgSymbol('бат', isTerminal: true)]),
  GrammarRule(CfgSymbol('Noun'), [CfgSymbol('мишээл', isTerminal: true)]),
  GrammarRule(CfgSymbol('Noun'), [CfgSymbol('аав', isTerminal: true)]),
  GrammarRule(CfgSymbol('Noun'), [CfgSymbol('ээж', isTerminal: true)]),
  GrammarRule(CfgSymbol('Noun'), [CfgSymbol('морь', isTerminal: true)]),
  GrammarRule(CfgSymbol('Noun'), [CfgSymbol('улаанбаатар', isTerminal: true)]),
  GrammarRule(CfgSymbol('Noun'), [CfgSymbol('монгол', isTerminal: true)]),
  GrammarRule(CfgSymbol('Noun'), [CfgSymbol('америк', isTerminal: true)]),
  GrammarRule(CfgSymbol('Noun'), [CfgSymbol('машин', isTerminal: true)]),
  GrammarRule(CfgSymbol('Noun'), [CfgSymbol('гол', isTerminal: true)]),
  GrammarRule(CfgSymbol('Noun'), [CfgSymbol('дэлгүүр', isTerminal: true)]),

  GrammarRule(CfgSymbol('Verb'), [CfgSymbol('ирсэн', isTerminal: true)]),
  GrammarRule(CfgSymbol('Verb'), [CfgSymbol('явсан', isTerminal: true)]),
  GrammarRule(CfgSymbol('Verb'), [CfgSymbol('ирнэ', isTerminal: true)]),
  GrammarRule(CfgSymbol('Verb'), [CfgSymbol('явна', isTerminal: true)]),
  GrammarRule(CfgSymbol('Verb'), [CfgSymbol('авсан', isTerminal: true)]),
  GrammarRule(CfgSymbol('Verb'), [CfgSymbol('авна', isTerminal: true)]),
];

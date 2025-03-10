import 'dart:core' hide Symbol;

import 'symbol.dart';

class GrammarRule {
  const GrammarRule(this.symbol, this.expansion);
  final CfgSymbol symbol;
  final List<CfgSymbol> expansion;
}

const grammarRules = [
  GrammarRule(CfgSymbol('S'), [CfgSymbol('NominativeSentence')]),
  GrammarRule(CfgSymbol('S'), [CfgSymbol('GenitiveSentence')]),
  GrammarRule(CfgSymbol('S'), [CfgSymbol('DativeLocativeSentence')]),
  GrammarRule(CfgSymbol('S'), [CfgSymbol('AccusativeSentence')]),
  GrammarRule(CfgSymbol('S'), [CfgSymbol('AblativeSentence')]),
  GrammarRule(CfgSymbol('S'), [CfgSymbol('InstrumentalSentence')]),
  GrammarRule(CfgSymbol('S'), [CfgSymbol('ComitativeSentence')]),
  GrammarRule(CfgSymbol('S'), [CfgSymbol('DirectiveSentence')]),

  // Nominative Sentence
  GrammarRule(CfgSymbol('NominativeSentence'), [CfgSymbol('NounPhrase'), CfgSymbol('Verb')]),
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

  // Genitive Sentence
  GrammarRule(CfgSymbol('GenitiveSentence'), [CfgSymbol('GenNoun'), CfgSymbol('NomNoun'), CfgSymbol('Verb')]),
  GrammarRule(CfgSymbol('GenNoun'), [CfgSymbol('Pronoun'), CfgSymbol('-ын', isTerminal: true)]),
  GrammarRule(CfgSymbol('GenNoun'), [CfgSymbol('Name'), CfgSymbol('-ын', isTerminal: true)]),
  GrammarRule(CfgSymbol('GenNoun'), [CfgSymbol('RegularNoun'), CfgSymbol('-ын', isTerminal: true)]),

  // Dative Locative Sentence
  GrammarRule(CfgSymbol('DativeLocativeSentence'), [CfgSymbol('NomNoun'), CfgSymbol('DatNoun'), CfgSymbol('Verb')]),
  GrammarRule(CfgSymbol('DatNoun'), [CfgSymbol('Place'), CfgSymbol('-т', isTerminal: true)]),
  GrammarRule(CfgSymbol('DatNoun'), [CfgSymbol('RegularNoun'), CfgSymbol('-т', isTerminal: true)]),
  GrammarRule(CfgSymbol('Place'), [CfgSymbol('улаанбаатар', isTerminal: true)]),
  GrammarRule(CfgSymbol('Place'), [CfgSymbol('монгол', isTerminal: true)]),

  // Accusative Sentence
  GrammarRule(CfgSymbol('AccusativeSentence'),
      [CfgSymbol('NomNoun'), CfgSymbol('DemPronoun'), CfgSymbol('AccNoun'), CfgSymbol('TransVerb')]),
  GrammarRule(CfgSymbol('DemPronoun'), [CfgSymbol('энэ', isTerminal: true)]),
  GrammarRule(CfgSymbol('DemPronoun'), [CfgSymbol('тэр', isTerminal: true)]),
  GrammarRule(CfgSymbol('AccNoun'), [CfgSymbol('Pronoun'), CfgSymbol('-ыг', isTerminal: true)]),
  GrammarRule(CfgSymbol('AccNoun'), [CfgSymbol('Name'), CfgSymbol('-ыг', isTerminal: true)]),
  GrammarRule(CfgSymbol('AccNoun'), [CfgSymbol('RegularNoun'), CfgSymbol('-ыг', isTerminal: true)]),
  GrammarRule(CfgSymbol('TransVerb'), [CfgSymbol('TransPastVerb')]),
  GrammarRule(CfgSymbol('TransVerb'), [CfgSymbol('TransPresentVerb')]),
  GrammarRule(CfgSymbol('TransVerb'), [CfgSymbol('TransFutureVerb')]),
  GrammarRule(CfgSymbol('TransPastVerb'), [CfgSymbol('авсан', isTerminal: true)]),
  GrammarRule(CfgSymbol('TransPresentVerb'), [CfgSymbol('авж байна', isTerminal: true)]),
  GrammarRule(CfgSymbol('TransFutureVerb'), [CfgSymbol('авна', isTerminal: true)]),

  // Ablative Sentence
  GrammarRule(CfgSymbol('AblativeSentence'), [CfgSymbol('NomNoun'), CfgSymbol('AblNoun'), CfgSymbol('Verb')]),
  GrammarRule(CfgSymbol('AblNoun'), [CfgSymbol('Place'), CfgSymbol('-аас', isTerminal: true)]),
  GrammarRule(CfgSymbol('AblNoun'), [CfgSymbol('RegularNoun'), CfgSymbol('-аас', isTerminal: true)]),
  GrammarRule(CfgSymbol('Place'), [CfgSymbol('америк', isTerminal: true)]),

  // Instrumental Sentence
  GrammarRule(CfgSymbol('InstrumentalSentence'), [CfgSymbol('NomNoun'), CfgSymbol('InsNoun'), CfgSymbol('Verb')]),
  GrammarRule(CfgSymbol('InsNoun'), [CfgSymbol('RegularNoun'), CfgSymbol('-аар', isTerminal: true)]),
  GrammarRule(CfgSymbol('RegularNoun'), [CfgSymbol('машин', isTerminal: true)]),

  // Comitative Sentence
  GrammarRule(CfgSymbol('ComitativeSentence'), [CfgSymbol('NomNoun'), CfgSymbol('ComNoun'), CfgSymbol('Verb')]),
  GrammarRule(CfgSymbol('ComNoun'), [CfgSymbol('Pronoun'), CfgSymbol('-тай', isTerminal: true)]),
  GrammarRule(CfgSymbol('ComNoun'), [CfgSymbol('Name'), CfgSymbol('-тай', isTerminal: true)]),
  GrammarRule(CfgSymbol('ComNoun'), [CfgSymbol('RegularNoun'), CfgSymbol('-тай', isTerminal: true)]),

  // Directive Sentence
  GrammarRule(CfgSymbol('DirectiveSentence'), [CfgSymbol('NomNoun'), CfgSymbol('DirNoun'), CfgSymbol('Verb')]),
  GrammarRule(CfgSymbol('DirNoun'), [CfgSymbol('Place'), CfgSymbol('-руу', isTerminal: true)]),
  GrammarRule(CfgSymbol('DirNoun'), [CfgSymbol('RegularNoun'), CfgSymbol('-руу', isTerminal: true)]),
  GrammarRule(CfgSymbol('RegularNoun'), [CfgSymbol('гол', isTerminal: true)]),
  GrammarRule(CfgSymbol('RegularNoun-'), [CfgSymbol('дэлгүүр', isTerminal: true)]),
];

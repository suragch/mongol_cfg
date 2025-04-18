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
  GrammarRule(CfgSymbol('NominativeSentence'), [
    CfgSymbol('NounPhrase'),
    CfgSymbol('Verb'),
  ]),
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
  GrammarRule(CfgSymbol('PresentVerb'), [
    CfgSymbol('ирж байна', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('PresentVerb'), [
    CfgSymbol('явж байна', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('FutureVerb'), [CfgSymbol('ирнэ', isTerminal: true)]),
  GrammarRule(CfgSymbol('FutureVerb'), [CfgSymbol('явна', isTerminal: true)]),

  // Genitive Sentence
  GrammarRule(CfgSymbol('GenitiveSentence'), [
    CfgSymbol('GenNoun'),
    CfgSymbol('NomNoun'),
    CfgSymbol('Verb'),
  ]),
  GrammarRule(CfgSymbol('GenNoun'), [CfgSymbol('Pronoun-ын')]),
  GrammarRule(CfgSymbol('GenNoun'), [CfgSymbol('Name-ын')]),
  GrammarRule(CfgSymbol('GenNoun'), [CfgSymbol('RegularNoun-ын')]),
  GrammarRule(CfgSymbol('Pronoun-ын'), [CfgSymbol('түүний', isTerminal: true)]),
  GrammarRule(CfgSymbol('Pronoun-ын'), [CfgSymbol('миний', isTerminal: true)]),
  GrammarRule(CfgSymbol('Name-ын'), [CfgSymbol('батын', isTerminal: true)]),
  GrammarRule(CfgSymbol('Name-ын'), [CfgSymbol('мишээлийн', isTerminal: true)]),
  GrammarRule(CfgSymbol('RegularNoun-ын'), [
    CfgSymbol('аавын', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('RegularNoun-ын'), [
    CfgSymbol('ээжийн', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('RegularNoun-ын'), [
    CfgSymbol('морины', isTerminal: true),
  ]),

  // Dative Locative Sentence
  GrammarRule(CfgSymbol('DativeLocativeSentence'), [
    CfgSymbol('NomNoun'),
    CfgSymbol('DatNoun'),
    CfgSymbol('Verb'),
  ]),
  GrammarRule(CfgSymbol('DatNoun'), [CfgSymbol('Place-т')]),
  GrammarRule(CfgSymbol('DatNoun'), [CfgSymbol('RegularNoun-т')]),
  GrammarRule(CfgSymbol('Place-т'), [
    CfgSymbol('улаанбаатарт', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('Place-т'), [CfgSymbol('монголд', isTerminal: true)]),
  GrammarRule(CfgSymbol('RegularNoun-т'), [
    CfgSymbol('гэрт', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('RegularNoun-т'), [
    CfgSymbol('ээжид', isTerminal: true),
  ]),

  // Accusative Sentence
  GrammarRule(CfgSymbol('AccusativeSentence'), [
    CfgSymbol('NomNoun'),
    CfgSymbol('DemPronoun'),
    CfgSymbol('AccNoun'),
    CfgSymbol('TransVerb'),
  ]),
  GrammarRule(CfgSymbol('DemPronoun'), [CfgSymbol('энэ', isTerminal: true)]),
  GrammarRule(CfgSymbol('DemPronoun'), [CfgSymbol('тэр', isTerminal: true)]),
  GrammarRule(CfgSymbol('AccNoun'), [CfgSymbol('Pronoun-ыг')]),
  GrammarRule(CfgSymbol('AccNoun'), [CfgSymbol('Name-ыг')]),
  GrammarRule(CfgSymbol('AccNoun'), [CfgSymbol('RegularNoun-ыг')]),
  GrammarRule(CfgSymbol('Pronoun-ыг'), [
    CfgSymbol('түүнийг', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('Pronoun-ыг'), [CfgSymbol('намайг', isTerminal: true)]),
  GrammarRule(CfgSymbol('Name-ыг'), [CfgSymbol('батыг', isTerminal: true)]),
  GrammarRule(CfgSymbol('Name-ыг'), [CfgSymbol('мишээлийг', isTerminal: true)]),
  GrammarRule(CfgSymbol('RegularNoun-ыг'), [
    CfgSymbol('мөнгийг', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('RegularNoun-ыг'), [
    CfgSymbol('номыг', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('RegularNoun-ыг'), [
    CfgSymbol('морийг', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('TransVerb'), [CfgSymbol('TransPastVerb')]),
  GrammarRule(CfgSymbol('TransVerb'), [CfgSymbol('TransPresentVerb')]),
  GrammarRule(CfgSymbol('TransVerb'), [CfgSymbol('TransFutureVerb')]),
  GrammarRule(CfgSymbol('TransPastVerb'), [
    CfgSymbol('авсан', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('TransPresentVerb'), [
    CfgSymbol('авж байна', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('TransFutureVerb'), [
    CfgSymbol('авна', isTerminal: true),
  ]),

  // Ablative Sentence
  GrammarRule(CfgSymbol('AblativeSentence'), [
    CfgSymbol('NomNoun'),
    CfgSymbol('AblNoun'),
    CfgSymbol('Verb'),
  ]),
  GrammarRule(CfgSymbol('AblNoun'), [CfgSymbol('Place-аас')]),
  GrammarRule(CfgSymbol('AblNoun'), [CfgSymbol('RegularNoun-аас')]),
  GrammarRule(CfgSymbol('Place-аас'), [
    CfgSymbol('америкаас', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('Place-аас'), [
    CfgSymbol('монголоос', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('RegularNoun-аас'), [
    CfgSymbol('ааваас', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('RegularNoun-аас'), [
    CfgSymbol('ээжээс', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('RegularNoun-аас'), [
    CfgSymbol('мориноос', isTerminal: true),
  ]),

  // Instrumental Sentence
  GrammarRule(CfgSymbol('InstrumentalSentence'), [
    CfgSymbol('NomNoun'),
    CfgSymbol('InsNoun'),
    CfgSymbol('Verb'),
  ]),
  GrammarRule(CfgSymbol('InsNoun'), [CfgSymbol('RegularNoun-аар')]),
  GrammarRule(CfgSymbol('RegularNoun-аар'), [
    CfgSymbol('машинаар', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('RegularNoun-аар'), [
    CfgSymbol('мориор', isTerminal: true),
  ]),

  // Comitative Sentence
  GrammarRule(CfgSymbol('ComitativeSentence'), [
    CfgSymbol('NomNoun'),
    CfgSymbol('ComNoun'),
    CfgSymbol('Verb'),
  ]),
  GrammarRule(CfgSymbol('ComNoun'), [CfgSymbol('Pronoun-тай')]),
  GrammarRule(CfgSymbol('ComNoun'), [CfgSymbol('Name-тай')]),
  GrammarRule(CfgSymbol('ComNoun'), [CfgSymbol('RegularNoun-тай')]),
  GrammarRule(CfgSymbol('Pronoun-тай'), [
    CfgSymbol('түүнтэй', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('Pronoun-тай'), [
    CfgSymbol('надтай', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('Name-тай'), [CfgSymbol('баттай', isTerminal: true)]),
  GrammarRule(CfgSymbol('Name-тай'), [
    CfgSymbol('мишээлтэй', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('RegularNoun-тай'), [
    CfgSymbol('аавтай', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('RegularNoun-тай'), [
    CfgSymbol('морьтой', isTerminal: true),
  ]),

  // Directive Sentence
  GrammarRule(CfgSymbol('DirectiveSentence'), [
    CfgSymbol('NomNoun'),
    CfgSymbol('DirNoun'),
    CfgSymbol('Verb'),
  ]),
  GrammarRule(CfgSymbol('DirNoun'), [CfgSymbol('Place-руу')]),
  GrammarRule(CfgSymbol('DirNoun'), [CfgSymbol('RegularNoun-руу')]),
  GrammarRule(CfgSymbol('Place-руу'), [
    CfgSymbol('америк руу', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('Name-руу'), [
    CfgSymbol('монгол руу', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('RegularNoun-руу'), [
    CfgSymbol('гол руу', isTerminal: true),
  ]),
  GrammarRule(CfgSymbol('RegularNoun-руу'), [
    CfgSymbol('дэлгүүр лүү', isTerminal: true),
  ]),
];

import 'dart:core' hide Symbol;

import 'symbol.dart';

class GrammarRule {
  const GrammarRule(this.symbol, this.expansion);
  final Symbol symbol;
  final List<Symbol> expansion;
}

const grammarRules = [
  GrammarRule(Symbol('S'), [Symbol('NominativeSentence')]),
  GrammarRule(Symbol('S'), [Symbol('GenitiveSentence')]),
  GrammarRule(Symbol('S'), [Symbol('DativeLocativeSentence')]),
  GrammarRule(Symbol('S'), [Symbol('AccusativeSentence')]),
  GrammarRule(Symbol('S'), [Symbol('AblativeSentence')]),
  GrammarRule(Symbol('S'), [Symbol('InstrumentalSentence')]),
  GrammarRule(Symbol('S'), [Symbol('ComitativeSentence')]),
  GrammarRule(Symbol('S'), [Symbol('DirectiveSentence')]),

  // Nominative Sentence
  GrammarRule(Symbol('NominativeSentence'), [Symbol('NounPhrase'), Symbol('Verb')]),
  GrammarRule(Symbol('NounPhrase'), [Symbol('NomNoun')]),
  GrammarRule(Symbol('Verb'), [Symbol('PastVerb')]),
  GrammarRule(Symbol('Verb'), [Symbol('PresentVerb')]),
  GrammarRule(Symbol('Verb'), [Symbol('FutureVerb')]),
  GrammarRule(Symbol('NomNoun'), [Symbol('Pronoun')]),
  GrammarRule(Symbol('NomNoun'), [Symbol('Name')]),
  GrammarRule(Symbol('NomNoun'), [Symbol('RegularNoun')]),
  GrammarRule(Symbol('Pronoun'), [Symbol('тэр', isTerminal: true)]),
  GrammarRule(Symbol('Pronoun'), [Symbol('би', isTerminal: true)]),
  GrammarRule(Symbol('Name'), [Symbol('бат', isTerminal: true)]),
  GrammarRule(Symbol('Name'), [Symbol('мишээл', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun'), [Symbol('аав', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun'), [Symbol('ээж', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun'), [Symbol('морь', isTerminal: true)]),
  GrammarRule(Symbol('PastVerb'), [Symbol('ирсэн', isTerminal: true)]),
  GrammarRule(Symbol('PastVerb'), [Symbol('явсан', isTerminal: true)]),
  GrammarRule(Symbol('PresentVerb'), [Symbol('ирж байна', isTerminal: true)]),
  GrammarRule(Symbol('PresentVerb'), [Symbol('явж байна', isTerminal: true)]),
  GrammarRule(Symbol('FutureVerb'), [Symbol('ирнэ', isTerminal: true)]),
  GrammarRule(Symbol('FutureVerb'), [Symbol('явна', isTerminal: true)]),

  // Genitive Sentence
  GrammarRule(Symbol('GenitiveSentence'), [Symbol('GenNoun'), Symbol('NomNoun'), Symbol('Verb')]),
  GrammarRule(Symbol('GenNoun'), [Symbol('Pronoun-ын')]),
  GrammarRule(Symbol('GenNoun'), [Symbol('Name-ын')]),
  GrammarRule(Symbol('GenNoun'), [Symbol('RegularNoun-ын')]),
  GrammarRule(Symbol('Pronoun-ын'), [Symbol('түүний', isTerminal: true)]),
  GrammarRule(Symbol('Pronoun-ын'), [Symbol('миний', isTerminal: true)]),
  GrammarRule(Symbol('Name-ын'), [Symbol('батын', isTerminal: true)]),
  GrammarRule(Symbol('Name-ын'), [Symbol('мишээлийн', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun-ын'), [Symbol('аавын', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun-ын'), [Symbol('ээжийн', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun-ын'), [Symbol('морины', isTerminal: true)]),

  // Dative Locative Sentence
  GrammarRule(Symbol('DativeLocativeSentence'), [Symbol('NomNoun'), Symbol('DatNoun'), Symbol('Verb')]),
  GrammarRule(Symbol('DatNoun'), [Symbol('Place-т')]),
  GrammarRule(Symbol('DatNoun'), [Symbol('RegularNoun-т')]),
  GrammarRule(Symbol('Place-т'), [Symbol('улаанбаатарт', isTerminal: true)]),
  GrammarRule(Symbol('Place-т'), [Symbol('монголд', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun-т'), [Symbol('гэрт', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun-т'), [Symbol('ээжид', isTerminal: true)]),

  // Accusative Sentence
  GrammarRule(Symbol('AccusativeSentence'), [
    Symbol('NomNoun'),
    Symbol('DemPronoun'),
    Symbol('AccNoun'),
    Symbol('TransVerb'),
  ]),
  GrammarRule(Symbol('DemPronoun'), [Symbol('энэ', isTerminal: true)]),
  GrammarRule(Symbol('DemPronoun'), [Symbol('тэр', isTerminal: true)]),
  GrammarRule(Symbol('AccNoun'), [Symbol('Pronoun-ыг')]),
  GrammarRule(Symbol('AccNoun'), [Symbol('Name-ыг')]),
  GrammarRule(Symbol('AccNoun'), [Symbol('RegularNoun-ыг')]),
  GrammarRule(Symbol('Pronoun-ыг'), [Symbol('түүнийг', isTerminal: true)]),
  GrammarRule(Symbol('Pronoun-ыг'), [Symbol('намайг', isTerminal: true)]),
  GrammarRule(Symbol('Name-ыг'), [Symbol('батыг', isTerminal: true)]),
  GrammarRule(Symbol('Name-ыг'), [Symbol('мишээлийг', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun-ыг'), [Symbol('мөнгийг', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun-ыг'), [Symbol('номыг', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun-ыг'), [Symbol('морийг', isTerminal: true)]),
  GrammarRule(Symbol('TransVerb'), [Symbol('TransPastVerb')]),
  GrammarRule(Symbol('TransVerb'), [Symbol('TransPresentVerb')]),
  GrammarRule(Symbol('TransVerb'), [Symbol('TransFutureVerb')]),
  GrammarRule(Symbol('TransPastVerb'), [Symbol('авсан', isTerminal: true)]),
  GrammarRule(Symbol('TransPresentVerb'), [Symbol('авж байна', isTerminal: true)]),
  GrammarRule(Symbol('TransFutureVerb'), [Symbol('авна', isTerminal: true)]),

  // Ablative Sentence
  GrammarRule(Symbol('AblativeSentence'), [Symbol('NomNoun'), Symbol('AblNoun'), Symbol('Verb')]),
  GrammarRule(Symbol('AblNoun'), [Symbol('Place-аас')]),
  GrammarRule(Symbol('AblNoun'), [Symbol('RegularNoun-аас')]),
  GrammarRule(Symbol('Place-аас'), [Symbol('америкаас', isTerminal: true)]),
  GrammarRule(Symbol('Place-аас'), [Symbol('монголоос', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun-аас'), [Symbol('ааваас', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun-аас'), [Symbol('ээжээс', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun-аас'), [Symbol('мориноос', isTerminal: true)]),

  // Instrumental Sentence
  GrammarRule(Symbol('InstrumentalSentence'), [Symbol('NomNoun'), Symbol('InsNoun'), Symbol('Verb')]),
  GrammarRule(Symbol('InsNoun'), [Symbol('RegularNoun-аар')]),
  GrammarRule(Symbol('RegularNoun-аар'), [Symbol('машинаар', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun-аар'), [Symbol('мориор', isTerminal: true)]),

  // Comitative Sentence
  GrammarRule(Symbol('ComitativeSentence'), [Symbol('NomNoun'), Symbol('ComNoun'), Symbol('Verb')]),
  GrammarRule(Symbol('ComNoun'), [Symbol('Pronoun-тай')]),
  GrammarRule(Symbol('ComNoun'), [Symbol('Name-тай')]),
  GrammarRule(Symbol('ComNoun'), [Symbol('RegularNoun-тай')]),
  GrammarRule(Symbol('Pronoun-тай'), [Symbol('түүнтэй', isTerminal: true)]),
  GrammarRule(Symbol('Pronoun-тай'), [Symbol('надтай', isTerminal: true)]),
  GrammarRule(Symbol('Name-тай'), [Symbol('баттай', isTerminal: true)]),
  GrammarRule(Symbol('Name-тай'), [Symbol('мишээлтэй', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun-тай'), [Symbol('аавтай', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun-тай'), [Symbol('морьтой', isTerminal: true)]),

  // Directive Sentence
  GrammarRule(Symbol('DirectiveSentence'), [Symbol('NomNoun'), Symbol('DirNoun'), Symbol('Verb')]),
  GrammarRule(Symbol('DirNoun'), [Symbol('Place-руу')]),
  GrammarRule(Symbol('DirNoun'), [Symbol('RegularNoun-руу')]),
  GrammarRule(Symbol('Place-руу'), [Symbol('америк руу', isTerminal: true)]),
  GrammarRule(Symbol('Name-руу'), [Symbol('монгол руу', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun-руу'), [Symbol('гол руу', isTerminal: true)]),
  GrammarRule(Symbol('RegularNoun-руу'), [Symbol('дэлгүүр лүү', isTerminal: true)]),
];

import 'symbol.dart';

class Rule {
  const Rule(this.symbol, this.expansion);
  final Symbol symbol;
  final List<Symbol> expansion;
}

const grammarRules = [
  Rule(Symbol('S'), [Symbol('NounPhrase'), Symbol('Verb')]),

  Rule(Symbol('NounPhrase'), [Symbol('NominativeCase')]),
  Rule(Symbol('NounPhrase'), [Symbol('GenitiveCase'), Symbol('Noun')]),
  Rule(Symbol('NounPhrase'), [Symbol('Noun'), Symbol('DativeLocativeCase')]),
  Rule(Symbol('NounPhrase'), [Symbol('Noun'), Symbol('AccusativeCase')]),
  Rule(Symbol('NounPhrase'), [Symbol('Noun'), Symbol('AblativeCase')]),
  Rule(Symbol('NounPhrase'), [Symbol('Noun'), Symbol('InstrumentalCase')]),
  Rule(Symbol('NounPhrase'), [Symbol('Noun'), Symbol('ComitativeCase')]),
  Rule(Symbol('NounPhrase'), [Symbol('Noun'), Symbol('DirectiveCase')]),

  Rule(Symbol('NominativeCase'), [Symbol('Noun')]),
  Rule(Symbol('NominativeCase'), [Symbol('Noun'), Symbol('Noun')]),
  Rule(Symbol('GenitiveCase'), [Symbol('Noun'), Symbol('-ын', isTerminal: true)]),
  Rule(Symbol('DativeLocativeCase'), [Symbol('Noun'), Symbol('-д', isTerminal: true)]),
  Rule(Symbol('AccusativeCase'), [Symbol('Noun'), Symbol('-ыг', isTerminal: true)]),
  Rule(Symbol('AblativeCase'), [Symbol('Noun'), Symbol('-аас', isTerminal: true)]),
  Rule(Symbol('InstrumentalCase'), [Symbol('Noun'), Symbol('-аар', isTerminal: true)]),
  Rule(Symbol('ComitativeCase'), [Symbol('Noun'), Symbol('-тай', isTerminal: true)]),
  Rule(Symbol('DirectiveCase'), [Symbol('Noun'), Symbol('руу', isTerminal: true)]),

  Rule(Symbol('Noun'), [Symbol('тэр', isTerminal: true)]),
  Rule(Symbol('Noun'), [Symbol('би', isTerminal: true)]),
  Rule(Symbol('Noun'), [Symbol('Бат', isTerminal: true)]),
  Rule(Symbol('Noun'), [Symbol('Мишээл', isTerminal: true)]),
  Rule(Symbol('Noun'), [Symbol('аав', isTerminal: true)]),
  Rule(Symbol('Noun'), [Symbol('ээж', isTerminal: true)]),
  Rule(Symbol('Noun'), [Symbol('морь', isTerminal: true)]),
  Rule(Symbol('Noun'), [Symbol('Улаанбаатар', isTerminal: true)]),
  Rule(Symbol('Noun'), [Symbol('Монгол', isTerminal: true)]),
  Rule(Symbol('Noun'), [Symbol('Америк', isTerminal: true)]),
  Rule(Symbol('Noun'), [Symbol('машин', isTerminal: true)]),
  Rule(Symbol('Noun'), [Symbol('гол', isTerminal: true)]),
  Rule(Symbol('Noun'), [Symbol('дэлгүүр', isTerminal: true)]),

  Rule(Symbol('Verb'), [Symbol('ирсэн', isTerminal: true)]),
  Rule(Symbol('Verb'), [Symbol('явсан', isTerminal: true)]),
  Rule(Symbol('Verb'), [Symbol('ирнэ', isTerminal: true)]),
  Rule(Symbol('Verb'), [Symbol('явна', isTerminal: true)]),
  Rule(Symbol('Verb'), [Symbol('авсан', isTerminal: true)]),
  Rule(Symbol('Verb'), [Symbol('авна', isTerminal: true)]),
];

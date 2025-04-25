import 'symbol.dart';

class Rule {
  const Rule(this.symbol, this.expansion);
  final Symbol symbol;
  final List<Symbol> expansion;
}

const productionRules = [
  Rule(Symbol('S'), [Symbol('NounPhrase'), Symbol('Verb')]),

  Rule(Symbol('NounPhrase'), [Symbol('Noun')]),
  Rule(Symbol('NounPhrase'), [Symbol('Noun'), Symbol('Noun')]),
  Rule(Symbol('NounPhrase'), [Symbol('NounCase'), Symbol('Noun')]),
  Rule(Symbol('NounCase'), [Symbol('Noun'), Symbol('Suffix')]),

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

  Rule(Symbol('Suffix'), [Symbol('-ын', isTerminal: true)]),
  Rule(Symbol('Suffix'), [Symbol('-д', isTerminal: true)]),
  Rule(Symbol('Suffix'), [Symbol('-ыг', isTerminal: true)]),
  Rule(Symbol('Suffix'), [Symbol('-аас', isTerminal: true)]),
  Rule(Symbol('Suffix'), [Symbol('-аар', isTerminal: true)]),
  Rule(Symbol('Suffix'), [Symbol('-тай', isTerminal: true)]),
  Rule(Symbol('Suffix'), [Symbol('руу', isTerminal: true)]),

  Rule(Symbol('Verb'), [Symbol('ирсэн', isTerminal: true)]),
  Rule(Symbol('Verb'), [Symbol('явсан', isTerminal: true)]),
  Rule(Symbol('Verb'), [Symbol('ирнэ', isTerminal: true)]),
  Rule(Symbol('Verb'), [Symbol('явна', isTerminal: true)]),
  Rule(Symbol('Verb'), [Symbol('авсан', isTerminal: true)]),
  Rule(Symbol('Verb'), [Symbol('авна', isTerminal: true)]),
];

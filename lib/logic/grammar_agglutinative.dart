import 'symbol.dart';

class Rule {
  const Rule(this.symbol, this.expansion);
  final Symbol symbol;
  final List<Symbol> expansion;
}

const productionRules = [
  Rule(Symbol('S'), [Symbol('NounPhrase'), Symbol('Verb')]),

  Rule(Symbol('NounPhrase'), [Symbol('NomCase')]),
  Rule(Symbol('NounPhrase'), [Symbol('GenCase'), Symbol('Noun')]),
  Rule(Symbol('NounPhrase'), [Symbol('Noun'), Symbol('DatCase')]),
  Rule(Symbol('NounPhrase'), [Symbol('Noun'), Symbol('AccCase')]),
  Rule(Symbol('NounPhrase'), [Symbol('Noun'), Symbol('AblCase')]),
  Rule(Symbol('NounPhrase'), [Symbol('Noun'), Symbol('InsCase')]),
  Rule(Symbol('NounPhrase'), [Symbol('Noun'), Symbol('ComCase')]),
  Rule(Symbol('NounPhrase'), [Symbol('Noun'), Symbol('DirCase')]),

  Rule(Symbol('NomCase'), [Symbol('Noun')]),
  Rule(Symbol('NomCase'), [Symbol('Noun'), Symbol('Noun')]),
  Rule(Symbol('GenCase'), [Symbol('Noun'), Symbol('-ын', isTerminal: true)]),
  Rule(Symbol('DatCase'), [Symbol('Noun'), Symbol('-д', isTerminal: true)]),
  Rule(Symbol('AccCase'), [Symbol('Noun'), Symbol('-ыг', isTerminal: true)]),
  Rule(Symbol('AblCase'), [Symbol('Noun'), Symbol('-аас', isTerminal: true)]),
  Rule(Symbol('InsCase'), [Symbol('Noun'), Symbol('-аар', isTerminal: true)]),
  Rule(Symbol('ComCase'), [Symbol('Noun'), Symbol('-тай', isTerminal: true)]),
  Rule(Symbol('DirCase'), [Symbol('Noun'), Symbol('руу', isTerminal: true)]),

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

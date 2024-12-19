import 'dart:math';

abstract class Sentence {
  Sentence();

  factory Sentence.random() {
    final random = Random();
    final types = [
      NominativeSentence(),
      GenitiveSentence(),
      DativeLocativeSentence(),
      AccusativeSentence(),
      AblativeSentence(),
      InstrumentalSentence(),
      ComitativeSentence(),
      DirectiveSentence(),
    ];
    return types[random.nextInt(types.length)];
  }

  final List<String> _current = ['S'];

  List<String> applyRule(String symbol);

  String createExample() {
    var sentence = ['S'];
    for (int i = 0; i < 100; i++) {
      final outputSentence = <String>[];
      for (final symbol in sentence) {
        final substitutes = applyRule(symbol);
        outputSentence.addAll(substitutes);
      }
      sentence = outputSentence;
      if (sentence.every((value) => _isTerminal(value))) {
        break;
      }
    }
    return sentence.join(' ');
  }

  bool _isTerminal(String token) {
    // Non-terminal symbols use PascalCase.
    return token.toLowerCase() == token;
  }

  @override
  String toString() {
    return _current.join(' ');
  }
}

List<String> _randomChoice(List<String> choices) {
  if (choices.isEmpty) {
    return [];
  }
  final index = Random().nextInt(choices.length);
  return [choices[index]];
}

List<String> _pastVerbs() => ['ирсэн', 'явсан'];
List<String> _presentVerbs() => ['ирж байна', 'явж байна'];
List<String> _futureVerbs() => ['ирнэ', 'явна'];
List<String> _names() => ['бат', 'мишээл'];
List<String> _pronouns() => ['тэр', 'би'];
List<String> _nouns() => ['аав', 'ээж', 'морь'];

class NominativeSentence extends Sentence {
  @override
  List<String> applyRule(String symbol) {
    switch (symbol) {
      case 'S':
        return ['NounPhrase', 'Verb'];
      case 'NounPhrase':
        return ['NomNoun'];
      case 'Verb':
        return _randomChoice(['PastVerb', 'PresentVerb', 'FutureVerb']);
      case 'NomNoun':
        return _randomChoice(['Pronoun', 'Name', 'RegularNoun']);
      case 'Pronoun':
        return _randomChoice(_pronouns());
      case 'Name':
        return _randomChoice(_names());
      case 'RegularNoun':
        return _randomChoice(_nouns());
      case 'PastVerb':
        return _randomChoice(_pastVerbs());
      case 'PresentVerb':
        return _randomChoice(_presentVerbs());
      case 'FutureVerb':
        return _randomChoice(_futureVerbs());
      default:
        return [symbol];
    }
  }
}

class GenitiveSentence extends Sentence {
  @override
  List<String> applyRule(String symbol) {
    switch (symbol) {
      case 'S':
        return ['NounPhrase', 'Verb'];
      case 'NounPhrase':
        return ['GenNoun', 'NomNoun'];
      case 'GenNoun':
        return _randomChoice(['Pronoun-ын', 'Name-ын', 'RegularNoun-ын']);
      case 'NomNoun':
        return ['RegularNoun'];
      case 'Verb':
        return _randomChoice(['PastVerb', 'PresentVerb', 'FutureVerb']);
      case 'Pronoun-ын':
        return _randomChoice(['түүний', 'миний']);
      case 'Name-ын':
        return _randomChoice(['батын', 'мишээлийн']);
      case 'RegularNoun':
        return _randomChoice(_nouns());
      case 'RegularNoun-ын':
        return _randomChoice(['аавын', 'ээжийн', 'морины']);
      case 'PastVerb':
        return _randomChoice(_pastVerbs());
      case 'PresentVerb':
        return _randomChoice(_presentVerbs());
      case 'FutureVerb':
        return _randomChoice(_futureVerbs());
      default:
        return [symbol];
    }
  }
}

class DativeLocativeSentence extends Sentence {
  @override
  List<String> applyRule(String symbol) {
    switch (symbol) {
      case 'S':
        return ['NounPhrase', 'Verb'];
      case 'NounPhrase':
        return ['NomNoun', 'DatNoun'];
      case 'NomNoun':
        return _randomChoice(['Pronoun', 'Name', 'RegularNoun']);
      case 'DatNoun':
        return _randomChoice(['Name-т', 'RegularNoun-т']);
      case 'Verb':
        return _randomChoice(['PastVerb', 'PresentVerb']);
      case 'Pronoun':
        return _randomChoice(_pronouns());
      case 'Name':
        return _randomChoice(_names());
      case 'Name-т':
        return _randomChoice(['улаанбаатарт', 'монголд']);
      case 'RegularNoun':
        return _randomChoice(['гэр', 'ээж', 'морь']);
      case 'RegularNoun-т':
        return _randomChoice(['гэрт', 'ээжид']);
      case 'PastVerb':
        return ['байсан'];
      case 'PresentVerb':
        return ['байна'];
      default:
        return [symbol];
    }
  }
}

class AccusativeSentence extends Sentence {
  @override
  List<String> applyRule(String symbol) {
    switch (symbol) {
      case 'S':
        return ['NounPhrase', 'Verb'];
      case 'NounPhrase':
        return ['NomNoun', 'DemPronoun', 'AccNoun'];
      case 'NomNoun':
        return _randomChoice(['Pronoun', 'Name', 'RegularNoun']);
      case 'AccNoun':
        return _randomChoice(['Pronoun-ыг', 'Name-ыг', 'RegularNoun-ыг']);
      case 'Verb':
        return _randomChoice(['PastVerb', 'PresentVerb', 'FutureVerb']);
      case 'Pronoun':
        return _randomChoice(_pronouns());
      case 'Pronoun-ыг':
        return _randomChoice(['түүнийг', 'намайг']);
      case 'DemPronoun':
        return _randomChoice(['энэ', 'тэр']);
      case 'Name':
        return _randomChoice(_names());
      case 'Name-ыг':
        return _randomChoice(['батыг', 'мишээлийг']);
      case 'RegularNoun':
        return _randomChoice(['мөнгө', 'ном', 'морь']);
      case 'RegularNoun-ыг':
        return _randomChoice(['мөнгийг', 'номыг', 'морийг']);
      case 'PastVerb':
        return ['авсан'];
      case 'PresentVerb':
        return ['авж байна'];
      case 'FutureVerb':
        return ['авна'];
      default:
        return [symbol];
    }
  }
}

class AblativeSentence extends Sentence {
  @override
  List<String> applyRule(String symbol) {
    switch (symbol) {
      case 'S':
        return ['NounPhrase', 'Verb'];
      case 'NounPhrase':
        return ['NomNoun', 'AblNoun'];
      case 'NomNoun':
        return _randomChoice(['Pronoun', 'Name', 'RegularNoun']);
      case 'AblNoun':
        return _randomChoice(['Name-аас', 'RegularNoun-аас']);
      case 'Verb':
        return _randomChoice(['PastVerb', 'PresentVerb', 'FutureVerb']);
      case 'Pronoun':
        return _randomChoice(_pronouns());
      case 'Name':
        return _randomChoice(_names());
      case 'Name-аас':
        return _randomChoice(['америкаас', 'монголоос']);
      case 'RegularNoun':
        return _randomChoice(['аав', 'ээж', 'морь']);
      case 'RegularNoun-аас':
        return _randomChoice(['ааваас', 'ээжээс', 'мориноос']);
      case 'PastVerb':
        return ['ирсэн'];
      case 'PresentVerb':
        return ['ирж байна'];
      case 'FutureVerb':
        return ['ирнэ'];
      default:
        return [symbol];
    }
  }
}

class InstrumentalSentence extends Sentence {
  @override
  List<String> applyRule(String symbol) {
    switch (symbol) {
      case 'S':
        return ['NounPhrase', 'Verb'];
      case 'NounPhrase':
        return ['NomNoun', 'InsNoun'];
      case 'NomNoun':
        return _randomChoice(['Pronoun', 'Name', 'RegularNoun']);
      case 'InsNoun':
        return _randomChoice(['RegularNoun-аар']);
      case 'Verb':
        return _randomChoice(['PastVerb', 'PresentVerb', 'FutureVerb']);
      case 'Pronoun':
        return _randomChoice(_pronouns());
      case 'Name':
        return _randomChoice(_names());
      case 'RegularNoun':
        return _randomChoice(['машин', 'морь']);
      case 'RegularNoun-аар':
        return _randomChoice(['машинаар', 'мориор']);
      case 'PastVerb':
        return _randomChoice(_pastVerbs());
      case 'PresentVerb':
        return _randomChoice(_presentVerbs());
      case 'FutureVerb':
        return _randomChoice(_futureVerbs());
      default:
        return [symbol];
    }
  }
}

class ComitativeSentence extends Sentence {
  @override
  List<String> applyRule(String symbol) {
    switch (symbol) {
      case 'S':
        return ['NounPhrase', 'Verb'];
      case 'NounPhrase':
        return ['NomNoun', 'ComNoun'];
      case 'NomNoun':
        return _randomChoice(['Pronoun', 'Name', 'RegularNoun']);
      case 'ComNoun':
        return _randomChoice(['Pronoun-тай', 'Name-тай', 'RegularNoun-тай']);
      case 'Verb':
        return _randomChoice(['PastVerb', 'PresentVerb', 'FutureVerb']);
      case 'Pronoun':
        return _randomChoice(_pronouns());
      case 'Pronoun-тай':
        return _randomChoice(['түүнтэй', 'надтай']);
      case 'Name':
        return _randomChoice(_names());
      case 'Name-тай':
        return _randomChoice(['баттай', 'мишээлтэй']);
      case 'RegularNoun':
        return _randomChoice(['аав', 'ээж', 'морь']);
      case 'RegularNoun-тай':
        return _randomChoice(['аавтай', 'ээжтэй', 'морьтой']);
      case 'PastVerb':
        return _randomChoice(_pastVerbs());
      case 'PresentVerb':
        return _randomChoice(_presentVerbs());
      case 'FutureVerb':
        return _randomChoice(_futureVerbs());
      default:
        return [symbol];
    }
  }
}

class DirectiveSentence extends Sentence {
  @override
  List<String> applyRule(String symbol) {
    switch (symbol) {
      case 'S':
        return ['NounPhrase', 'Verb'];
      case 'NounPhrase':
        return ['NomNoun', 'DirNoun'];
      case 'NomNoun':
        return _randomChoice(['Pronoun', 'Name']);
      case 'DirNoun':
        return _randomChoice(['Name-руу', 'RegularNoun-руу']);
      case 'Verb':
        return _randomChoice(['PastVerb', 'PresentVerb', 'FutureVerb']);
      case 'Pronoun':
        return _randomChoice(_pronouns());
      case 'Name':
        return _randomChoice(_names());
      case 'Name-руу':
        return _randomChoice(['Америк руу', 'Монгол руу']);
      case 'RegularNoun-руу':
        return _randomChoice(['гол руу', 'дэлгүүр лүү']);
      case 'PastVerb':
        return ['явсан'];
      case 'PresentVerb':
        return ['явж байна'];
      case 'FutureVerb':
        return ['явна'];
      default:
        return [symbol];
    }
  }
}

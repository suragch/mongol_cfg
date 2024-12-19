import 'dart:core' hide Symbol;

import 'symbol.dart';

class GrammarRule {
  const GrammarRule(this.symbol, this.expansion);
  final CfgSymbol symbol;
  final List<CfgSymbol> expansion;
}

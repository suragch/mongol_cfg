class CfgSymbol {
  const CfgSymbol(this.name, {this.isTerminal = false});
  final String name;
  final bool isTerminal;

  bool get isNonTerminal => !isTerminal;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CfgSymbol &&
        other.name == name &&
        other.isTerminal == isTerminal;
  }

  @override
  int get hashCode => Object.hash(name, isTerminal);

  @override
  String toString() => name;
}

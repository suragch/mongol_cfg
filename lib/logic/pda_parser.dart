import 'symbol.dart';
import 'grammar_agglutinative.dart';

class PDAParser {
  final List<GrammarRule> grammarRules;
  final CfgSymbol startSymbol;

  PDAParser({required this.grammarRules, required this.startSymbol});

  (bool isValid, String stackTrace) parse(List<String> inputTokens) {
    final tokens = inputTokens.map((t) => CfgSymbol(t, isTerminal: true)).toList();

    // Initialize the stack with the start symbol
    List<CfgSymbol> stack = [startSymbol];
    final stackTrace = StringBuffer();

    // Start the recursive parsing
    final isValid = _parseRecursive(stack, tokens, 0, stackTrace);
    return (isValid, stackTrace.toString());
  }

  bool _parseRecursive(List<CfgSymbol> stack, List<CfgSymbol> inputTokens, int inputIndex, StringBuffer stackTrace) {
    stackTrace.writeln(stack.toString());
    if (stack.isEmpty) {
      // Successfully parsed if all input tokens are consumed
      return inputIndex == inputTokens.length;
    }

    final top = stack.removeLast();

    if (!top.isTerminal) {
      // Get rules that can expand the non-terminal
      List<GrammarRule> rules = grammarRules.where((rule) => rule.symbol == top).toList();

      if (rules.isEmpty) {
        return false; // No rules to expand non-terminal
      }

      // Try each rule recursively (backtracking)
      for (var rule in rules) {
        final newStack = stack.toList();
        // Push right-hand side of the rule onto the stack in reverse order
        for (var symbol in rule.expansion.reversed) {
          newStack.add(symbol);
        }

        if (_parseRecursive(newStack, inputTokens, inputIndex, stackTrace)) {
          return true;
        }
      }
      return false;
    } else {
      // Terminal symbol, match with input
      if (inputIndex >= inputTokens.length || top != inputTokens[inputIndex]) {
        return false; // Mismatch
      }
      // Move to the next input token
      return _parseRecursive(stack, inputTokens, inputIndex + 1, stackTrace);
    }
  }
}

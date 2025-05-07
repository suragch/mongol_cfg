import 'symbol.dart';
import 'grammar.dart';

class PDAParser {
  final List<Rule> grammarRules;
  final Symbol startSymbol;

  PDAParser({required this.grammarRules, required this.startSymbol});

  (bool isValid, String? stackTrace) parse(List<String> inputTokens, {bool showTrace = false}) {
    final tokens = inputTokens.map((t) => Symbol(t, isTerminal: true)).toList();

    // Initialize the stack with the start symbol
    List<Symbol> stack = [startSymbol];
    final stackTrace = showTrace ? StringBuffer() : null;

    // Start the recursive parsing
    final isValid = _parseRecursive(stack, tokens, 0, stackTrace);
    return (isValid, stackTrace.toString());
  }

  bool _parseRecursive(List<Symbol> stack, List<Symbol> inputTokens, int inputIndex, StringBuffer? stackTrace) {
    stackTrace?.writeln(stack.toString());
    if (stack.isEmpty) {
      // Successfully parsed if all input tokens are consumed
      return inputIndex == inputTokens.length;
    }

    final top = stack.removeLast();

    if (top.isNonTerminal) {
      // Get rules that can expand the non-terminal
      List<Rule> rules = grammarRules.where((rule) => rule.symbol == top).toList();

      if (rules.isEmpty) {
        return false; // No rules to expand non-terminal
      }

      // Try each rule recursively (backtracking)
      for (var rule in rules) {
        final newStack = stack.toList();
        // Push right-hand side of the rule onto the stack in reverse order
        // The reverse order is so that the structure embedded in the expansion order
        // will match the terminal order. Items lower in the stack should come later.
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

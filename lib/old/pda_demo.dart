import 'package:flutter/material.dart';
import 'package:mongol_cfg/parser/pda_parser.dart';
import 'package:mongol_cfg/parser/symbol.dart';
import '../parser/grammar.dart';

class PdaDemo extends StatefulWidget {
  const PdaDemo({super.key});

  @override
  State<PdaDemo> createState() => _PdaDemoState();
}

class _PdaDemoState extends State<PdaDemo> {
  final List<String> selectedWords = [];
  final List<String> availableWords = grammarRules
      .expand((rule) => rule.expansion)
      .where((symbol) => symbol.isTerminal)
      .map((symbol) => symbol.name)
      .toSet()
      .toList()
    ..sort();
  String? stackTrace;
  bool? isValid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pushdown Automata Demonstration'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                constraints: const BoxConstraints(minHeight: 100),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: selectedWords
                      .map(
                        (word) => Chip(
                          label: Text(word),
                          onDeleted: () {
                            setState(() {
                              selectedWords.remove(word);
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Choose words to add:'),
              const SizedBox(height: 10),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 8.0,
                runSpacing: 8.0,
                children: availableWords
                    .map((word) => ActionChip(
                          label: Text(word),
                          onPressed: () {
                            setState(() {
                              selectedWords.add(word);
                            });
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(height: 20),
              Center(
                child: FilledButton(
                  onPressed: checkGrammar,
                  child: const Text('Check Grammar'),
                ),
              ),
              if (isValid != null) ...[
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'Grammar is ${isValid! ? 'valid' : 'invalid'}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isValid! ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ],
              if (stackTrace != null) ...[
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(stackTrace!),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void checkGrammar() {
    final parser = PDAParser(
      grammarRules: grammarRules,
      startSymbol: const CfgSymbol('S'),
    );
    final (valid, trace) = parser.parse(selectedWords);
    setState(() {
      isValid = valid;
      stackTrace = trace;
    });
  }
}

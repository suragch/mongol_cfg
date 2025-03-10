import 'package:flutter/material.dart';
import 'package:mongol_cfg/logic/cfg_generator.dart';

class CfgDemo extends StatefulWidget {
  const CfgDemo({super.key});

  @override
  State<CfgDemo> createState() => _CfgDemoState();
}

class _CfgDemoState extends State<CfgDemo> {
  String generatedSentence = '';
  String parseTree = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Context-Free Grammar Demonstration',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 16, width: double.infinity),
            FilledButton(
              onPressed: _generateNewSentence,
              child: const Text('Generate Sentence'),
            ),
            const SizedBox(height: 20),
            Text(generatedSentence),
            const SizedBox(height: 20),
            Text(parseTree),
          ],
        ),
      ),
    );
  }

  void _generateNewSentence() {
    final (sentence, tree) = generateRandomSentence();
    setState(() {
      generatedSentence = sentence;
      parseTree = tree;
    });
  }
}

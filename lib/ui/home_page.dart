import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mongol_cfg/ui/cfg_demo.dart';
import 'package:mongol_cfg/ui/pda_demo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoSegmentedControl<int>(
              children: const {
                0: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text('CFG')),
                1: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text('PDA')),
              },
              onValueChanged: (int value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              groupValue: selectedIndex,
            ),
          ),
          Expanded(child: selectedIndex == 0 ? const CfgDemo() : const PdaDemo()),
        ],
      ),
    );
  }
}

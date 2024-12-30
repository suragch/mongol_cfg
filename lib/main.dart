// import 'package:mongol_cfg/cases/sentence_types.dart';

import 'package:flutter/material.dart';
import 'package:mongol_cfg/ui/home_page.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

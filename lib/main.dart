import 'package:flutter/material.dart';
import 'package:oriflame/presentation/oriflame_quickshare_content.dart';

void main() {
  runApp(const OriFlameApp());
}

class OriFlameApp extends StatelessWidget {
  const OriFlameApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = "ORIFLAME";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OriFlameQuickShare(title: title),
    );
  }
}

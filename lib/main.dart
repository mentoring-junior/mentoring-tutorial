import 'package:flutter/material.dart';

import 'presentation/sound_list/sound_list_page.dart';

void main() {
  runApp(const MiniSoundApp());
}

class MiniSoundApp extends StatelessWidget {
  const MiniSoundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Sound',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const SoundListPage(),
    );
  }
}

import 'package:flutter/material.dart';

/// 음원 목록 화면.
///
/// 지금은 빈 화면이다. tasks/01부터 차근차근 채워 나간다.
class SoundListPage extends StatelessWidget {
  const SoundListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('사운드')),
      body: const Center(
        child: Text('여기에 사운드 목록이 보이게 될 거예요'),
      ),
    );
  }
}
